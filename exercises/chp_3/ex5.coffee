doAndRepeatUntil = (func, cond) ->
    func.call this
    func.call this until cond()

user = {}
user.nags = 0
user.paidInFull = ->
    if user.nags > 3
        console.log "Fine I'll Pay!"
        return true
    false
user.harangue = ->
    user.nags++

doAndRepeatUntil user.harangue, user.paidInFull