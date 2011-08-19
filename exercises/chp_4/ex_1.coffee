root = global ? window

root.aphorism = 'Fool me 8 or more times, shame on me'


do restoreOldAphorism = ->
    aphorism = 'Fool me once, shame on you'
    console.log aphorism
    console.log @aphorism