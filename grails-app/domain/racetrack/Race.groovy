package racetrack

import net.sf.ehcache.config.Searchable

class Race {
    String name
    Date startDateTime
    String city
    String state
    Float distance
    Float cost
    Integer maxRunners = 100
    Float winnerPrizeAmount

    static hasMany = [registrations:Registration]

    String toString(){"${this.name}:${this.city},${this.state}"}

    static constraints = {
       // version true
        name(minSize: 5, maxSize: 50, blank:false)
        startDateTime(validator: {return (it > new Date())})
        city(minSize: 3, maxSize:  30,blank:false)
        state(inList:['Bagmati', 'Gandaki', 'Mechi', 'Sagarmatha', 'Narayani', 'Lumbini'],blank:false)
        distance(min:0.1f,max:100f)
        cost(min:0f,max:5999.99f)
        winnerPrizeAmount(min:0f, blank:false)
        maxRunners(min:2)

    }
}
