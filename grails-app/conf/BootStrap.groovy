
import racetrack.*
class BootStrap {

    def init = { servletContext ->
        final String BACKUP_ADMIN = 'adminjoe'
        if (!User.findByUsername(BACKUP_ADMIN)) {
            new User(username:BACKUP_ADMIN,password:'password').save()
        }
    }
    def destroy = {
    }
}
