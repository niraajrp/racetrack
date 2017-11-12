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
        name(minSize: 5, maxSize: 50, blank:false)
        dateOfBirth(validator: {return (it < new Date())})
        gender(inList:["M", "F"], nullable: false)
        postalAddress(maxSize: 150, nullable: true)
        emailAddress(maxSize: 50, email:true, nullable: false)
        race(nullable:false)
    }
}
