# NOT FINISHED
# Below are two functions that are used together to create,
# solve inverse, and cache matrices.

# The makeCacheMatrix() instantiates special object that
# creates and store/caches matrix and its inverse.
# It can further interact with other functions communicating
# about whether the inverse matrix has been already stored
# (so it doesn't have to be recalculated) and if it is, 
# enables a simple pull from makeCacheMatrix() properties/methods.

makeCacheMatrix = function(x = matrix()) {
    
    # empty placeholder where inverse matrix will be stored
    matInv = NULL
    
    # set new matrix from parent function(s)
    set = function(x2) {
        
        # "<<-" enables the scope to be extended from outside (parent) to inside the function
        # which means that "x" can be set within "set()"
        x <<- x2
        
        # clear inverse matrix when assigning a new matrix to object
        matInv <<- NULL
        message ("New matrix made, cache cleared.")
    }
    
    # get matrix that is set
    get = function() {x}
    
    # make a way to set inverse matrix from outside
    # basically, set matInv to whatever you pass to this function:
    #
    # let m = makeCacheMatrix(some_matrix)
    # its then possible to:
    # m$setInv(solve(m$get()))  to set the inverse inside object
    setInv = function(inv) {matInv <<- inv}
    
    # a way to get inverted matrix now existing in this object
    getInv = function() {matInv}
    
    # return a list of properties/methods for this object
    list(
        set = set, 
        get = get,
        setInv = setInv,
        getInv = getInv
    )
}





## TO DO
## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
}

