x = true
showAnswer = (x = x) ->
    console.log if x then 'It works!' else 'Nope.'
showAnswer()  #=> Nope

#(x = x)  will allways retun false in this since it's undef