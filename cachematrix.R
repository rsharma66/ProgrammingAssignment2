## This easy-seeming, yet complicated function caches the inverse
## of a matrix to vastly speed up calculations on large matrices.

## to create cache values of data and its inverse as NULL matrices

makeCacheMatrix <- function(x = matrix()) {
i <- NULL
set <- function(y) {
x <<- y
i <<- NULL
}
get <- function() x
setinverse <- function(solve) i <<- solve
getinverse <- function() i
list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## calculate inverse of a matrix in an efficient way by caching values

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

i <- x$getinverse()
if(!is.null(i)) {
        message("getting cached data")
        return(i)
}
data <- x$get()
i <- solve(data, ...)
x$setinverse(i)
i                
}
