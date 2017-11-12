package racetrack

class Registration {
    Race race
    String name
    Date dateOfBirth
    String gender
    String postalAddress
    String emailAddress
    Date createdAt = new Date()

    static belongsTo = [Race]
    //static optionals = ["gender","postalAddress"]

    String toString(){"${this.name}:${this.emailAddress}"}

    static constraints = {
        name(maxLength:50,blank:false)
        dateOfBirth(nullable:false, max: new Date())
        gender(inList:["M", "F"], nullable: true)
        postalAddress(maxLength:255)
        emailAddress(maxLength:50,email:true)
        race(nullable:false)
    }
}
