startTurn = ->
    myTurn - true
    showMessage 'firstTile'

endTurn = ->
    selectedCoordinates = null
    myTurn = false
    showMessage 'waitForMove'

handleMessage = (message) ->
    {type, content} = typeAndContent message
    switch type
        when 'welcome'
            {players, currPlayerNum, tiles, yourNum: myNum} = JSON.parse content
            startGame players, currPlayerNum
        when 'moveResult'
            {player, swapCoordinates, moveScore, newWords} = JSON.parse content
            showMoveResult player, swapCoordinates, moveScore, newWords

startGame = (players, currPlayerNum) ->
    for player in players
        $("#p#{player.num}name").html player.name
        $("#p#{player.num}score").html player.score
    drawTiles()
    if myNum is currPlayerNum
        startTurn()
    else
        endTurn()


showMoveResult = (player, swapCoordinates, moveScore, newWords) ->
    $("#p#{player.num}score").html player.score
    $notice = $('<p clase="notice"></p>')
    if moveScore is 0
        $notice.html "#{player.name} formed no words with this turn"
    else
        $notice.html """
            #{player.name} formed the following #{newWords.length} words(s):</br />
            <b>#{newWords.join(', ')}</b><br />
            earning <b>#{moveScore / newWords.length}x#{newWords.length}
            = #{moveScore}</b> points!
        """
    showThenFade $notice
    swapTiles swapCoordinates
    if player.num isnt myNum then startTurn()

drawTiles = ->
    gridHtml = ''
    for x in [0...grid.tiles.length]
        gridHtml += '<ul>'
        for y in [0...grid.tiles.length]
            gridHtml += "<li id='tile#{x}_#{y}'>#{grid.tiles[x][y]}</li>"
        gridHtml += '</ul>'
    $('#grid').html gridHtml

drawTiles = ->
    gridHtml = ''
    for x in [0...grid.tiles.length]
        gridHtml += '<ul>'
        for y in [0...grid.tiles.length]
            gridHtml += "<li id='tile#{x}_#{y}'>#{grid.tiles[x][y]}</li>"
        gridHtml += '</ul>'
    $('#grid').html gridHtml

tileClick = ->
    $tile = $(this)
    if $tile.hasClass 'selected'
        # undo
        selectedCoordinates = null
        $tile.removeClass 'selected'
        showMessage 'firstTile'
    else
        $tile.addClass 'selected'
        [x, y] = @id.match(/(\d+)_(\d+)/)[1..]
        selectTile x, y


showMessage = (messageType) ->
  switch messageType
    when 'firstTile'
      messageHtml = "Please select your first tile."
    when 'secondTile'
      messageHtml = "Please select a second tile."
  $('#message').html messageHtml


showThenFade = ($elem) ->
    $elem.insertAfter $('#grid')
    animationTarget = opacity: 0, height: 0, padding: 0
    $elem.delay(5000).animate animationTarget, 500, -> $elem.remove()


$(document).ready ->
    $('#grid li').live 'click', tileClick
    socket = new io.Socket()
    socket.connect()
    socket.on 'connect', -> showMessage 'waitForConnection'
    socket.on 'message', handleMessage
