run = (func, args...) ->
    func args

parrot = (input...) ->
    console.log "#{input.join(',')}"


run parrot, 'a', 'b', 'c'
