makeCacheMatrix creates a special "matrix" which can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) inv <<- inverse
    getinverse <- function() inv
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}

The following function calculates the inverse of the special "matrix" created with
the above function. However, it first checks to see if the inverse has already been
calculated. If so, it gets the inverse from the cache and skips the computation. 
Otherwise, it calculates the inverse of the matrix and sets the value of the inverse 
in the cache via the setinverse function.

cacheSolve <- function(x, ...) {
    inv <- x$getinverse()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    mat <- x$get()
    inv <- inv(mat, ...)
    x$setinverse(inv)
    inv
}
