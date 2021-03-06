package racetrack



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RegistrationController extends BaseController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Registration.list(params), model:[registrationInstanceCount: Registration.count()]
    }

    def show(Registration registrationInstance) {
        respond registrationInstance
    }

    def create() {
        respond new Registration(params)
    }

    @Transactional
    def save(Registration registrationInstance) {
        if (registrationInstance == null) {
            notFound()
            return
        }

        if (registrationInstance.hasErrors()) {
            respond registrationInstance.errors, view:'create'
            return
        }

        registrationInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = "${params.name}'s Profile Saved !"
//                flash.message = message(code: 'default.created.message', args: [message(code: 'registration.label', default: 'Registration'), registrationInstance.id])
                redirect registrationInstance
            }
            '*' { respond registrationInstance, [status: CREATED] }
        }
    }

    def edit(Registration registrationInstance) {
        respond registrationInstance
    }

    @Transactional
    def update(Registration registrationInstance) {
        if (registrationInstance == null) {
            notFound()
            return
        }

        if (registrationInstance.hasErrors()) {
            respond registrationInstance.errors, view:'edit'
            return
        }

        registrationInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = "${params.name}'s Profile Updated !"
//                flash.message = message(code: 'default.updated.message', args: [message(code: 'Registration.label', default: 'Registration'), registrationInstance.id])
                redirect registrationInstance
            }
            '*'{ respond registrationInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Registration registrationInstance) {

        if (registrationInstance == null) {
            notFound()
            return
        }

        registrationInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = "Profile Successfully Deleted !"
//                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Registration.label', default: 'Registration'), registrationInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'registration.label', default: 'Registration'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    @Transactional(readOnly=false)
    def register() {
        def registration = new Registration()
        println params
        println params.id
        registration.properties = params
        if (request.method == 'GET') {
            def race = Race.get(params.id)
            return ['registration':registration,'race':race]
        }
        else {
            if(registration.save()) {
                flash.message = "Successfully registered for ${registration.race.name}"
                redirect(controller:'race',action:'search')
            }
            else {
                def race = Race.get(params['race.id'])
                return ['registration':registration,'race':race]
            }
        }
    }
    def beforeInterceptor = [action:this.&auth, except:'register']
}
