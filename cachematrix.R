## [Creates a special matrix object to cache it's inverse]

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y){
                x<<-y
                m<<-NULL
                }
        get <- function() x
        setmatrix <- function(sovle) m <<- solve
        getmatrix <- function() m
        list(set=set, get=get, 
             setmatrix=setmatrix,
             getmatrix=getmatrix)
        
}


## This function computes the inverse of the special matrix created and returned by makeCacheMatrix.

cacheSolve <- function(x=matrix(),...) {
        m <- x$getmatrix()
        if(!is.null(m)){
                message("Retrieving Cache Data")
                return(m)
        }
        matrix <- x$get()
        m <- solve(matrix,...)
        x$setmatrix(m)
        m
}
