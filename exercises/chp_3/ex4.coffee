objContains = (obj, val) ->
    if val in obj
        console.log "booyah";


objContains2 = (obj,match) ->
    for k,v of obj
        if v is match
            console.log "yah"


b = {}
b.blip = "blop"

objContains b, "blop"

console.log "second verse same as the first?"

objContains2 b, "blop"
