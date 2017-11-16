package racetrack

abstract class BaseController {
    def auth() {
        if(!session.username) {
            def originalRequestParams = [controller:controllerName, action:actionName]
            originalRequestParams.putAll(params)
            println originalRequestParams
            session.originalRequestParams = originalRequestParams
            redirect(controller:'user',action:'login')
            return false
        }
    }
}

