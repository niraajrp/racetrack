package racetrack

class Race {
    String name
    Date startDateTime
    String city
    String state
    Float distance
    Float cost
    Integer maxRunners = 1000

    static hasMany = [registrations:Registration]

    String toString(){"${this.name}:${this.city},${this.state}"}

    static constraints = {
        name(maxLength:50,blank:false)
        maxRunners()
        startDateTime(validator: {return (it > new Date())})
        city(maxLength:30,blank:false)
        state(inList:['Bagmati', 'Gandaki', 'Mechi', 'Sagarmatha', 'Narayani', 'Lumbini'],blank:false)
        distance(min:3.1f,max:100f)
        cost(min:0f,max:999.99f)

    }
}
