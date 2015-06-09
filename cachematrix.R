# ASSIGNMENT 2, NOT FINISHED
# caching matrix

# makes an object that caches (eventually) a matrix and its inverse
# packs itself with methods that enable it to do so

# initiate object with empty matrix, if no arguments are given
makeCacheMatrix = function(x = matrix()) {
    
    # empty placeholder for inverse matrix
    matInverse = NULL
    
    # set new matrix from outside
    set = function(x2) {
        
        # "<<-" enables the scope to be extended from outside to inside the function
        # example: 
        # let  m = makeMatrix()  then  m$setMatrix(some_matrix) sets new matrix to m
        x <<- x2
        
        # clear inverted matrix when assigning a new matrix to object
        matInverse <<- NULL
        message ("New matrix made, cache cleared.")
    }
    
    # get matrix that is set
    get = function() {x}
    
    # make a way to set inverted matrix from outside
    # basically, set matInverded to whatever you pass to this function:
    #
    # let m = makeMatrix(some_matrix)
    # its then possible to:
    # m$setInverse(solve(m$getMatrix()))  to set the inverse inside object
    setInv = function(inv) {matInverse <<- inv}
    
    # a way to get inverted matrix now existing in this object
    getInv = function() {matInverse}
    
    # return a list of properties/methods for this object
    list(
        setMatrix = set, 
        getMatrix = get,
        setInverse = setInv,
        getInverse = getInv
    )
}



## TO DO
## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
}

