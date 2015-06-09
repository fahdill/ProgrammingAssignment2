# Below are two functions that are used together to create,
# solve inverse, and cache matrices.

# The makeCacheMatrix() instantiates special object that
# creates and store/caches matrix and its inverse.
# It can further interact with other functions communicating
# about whether the inverse matrix has been already stored
# (so it doesn't have to be recalculated) and if it is, 
# enables a simple pull of inverse matrix from makeCacheMatrix() properties/methods.

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


# This cacheSolve() function checks for cached inverse matrix in makeCacheMatrix() objects.
#
# It takes an argument of above mentioned object type, tries to retrieve 
# solved/inverse matrix, and if none is present, a solve() is performed on retrieved
# original, non inverse matrix.
# Then, the solved matrix is set back to makeCacheMatrix() object, 
# consequently caching it. Also, the inverse matrix is returned.
#
# If inverse matrix is present (therefore cached) in makeCacheMatrix() object 
# that is passed to this function cacheSolve(), inverse matrix is not calculated 
# but retrieved from makeCacheMatrix() object and return as is thus making
# less computational work.

cacheSolve = function(x, ...) {
    
    # get inverse matrix from x
    # (or get whatever is in matInv in x)
    inv = x$getInv()
    
    # if there IS cached inverse matrix do the following
    if (!is.null(inv)) {
        
        # say that there is cached matrix, no need to calculate it
        message("Retrieving cached inverse matrix...")
        
        # inverse is present in x 
        # so all we need to do is to return that
        return (inv)
    }
    
    # if cached inverse matrix from x in NOT available do:
    # retrieve unsolved (non-inverse) matrix from x
    origMatrix = x$get()
    
    # make inverse one
    inv = solve(origMatrix, ...)
    
    # set it to x thus making it cached for further use
    x$setInv(inv)
    
    # and return it at last
    inv
}
