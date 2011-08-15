stdin = process.openStdin()
stdin.setEncoding 'utf8'
inputCallback = null
stdin.on 'data', (input) -> inputCallback input

promptForTile1 = ->
    console.log "Please enter coordinates for the first tile."
    inputCallback = (input) ->
        promptForTile2() if strToCoordinates input