clearArray = (arr) ->
    console.log "#{arr}"
    arr.splice 0, arr.length
    #return the cleared array
    #    arr
    #return null
    #   undefined


arr1 = [1,4,5,'a','c']

arr2 = clearArray arr1
#print the outcomes.
console.log "#{arr1}"
console.log "#{arr2}"