class Tribble
    constructor: ->
        @isAlive = true
        Tribble.count++
    breed: -> new Tribble if @isAlive
    die: ->
        Tribble.count-- if @isAlive
        @isAlive = false

    @count: 0
    @makeTrouble: -> console.log ('Trouble!' for i in [1..@count]).join(' ')


tribble1 = new Tribble
tribble2 = new Tribble
Tribble.makeTrouble()

tribble1.die()
Tribble.makeTrouble()

tribble2.breed().breed().breed()
Tribble.makeTrouble()

console.log Tribble.name