Raven = ->
Raven::quoth = -> console.log 'Nevermore'
raven1 = new Raven()
raven1.quoth()


Raven::quoth = -> console.log "I'm hungry"
raven1.quoth()

raven2 = new Raven()
raven2.quoth = -> console.log "I'm my own kind of raven"
raven1.quoth()
raven2.quoth()

console.log raven1.hasOwnProperty('quoth')
console.log raven2.hasOwnProperty('quoth')

console.log 'quoth' of raven2