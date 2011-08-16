#cheated on this a looked at the end, wasn't clicking

warning = null
warning = "boo"
abortMission = (input) ->
    console.log "ABORT!  #{input}"

#return abortMission warning if warning?
return abortMission(warning) if warning?

#if warning? then return abortMission warning
#if warning? then return abortMission(warning)

return abortMission(warning if warning?)
