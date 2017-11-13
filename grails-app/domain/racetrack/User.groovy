package racetrack
class User {
    String username
    String password

    String toString(){"${this.username}"}

    static constraints = {
        username(minSize: 5, maxSize: 10, unique: true, nullable: false)
        password(minSize: 5, maxSize: 10, nullable: false)
//        role(inList: ['USER','ADMIN','SUPER-ADMIN'])
    }
}
