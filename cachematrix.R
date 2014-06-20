## cachematrix.R
## Functions to calculate the inverse of a matrix, and 
## cache the inverse matrix. Note that an error occurs if
## the matrix is not invertible.

## makeCacheMatrix: A function to create a "vector" of functions.
## This function takes a matrix x as input, 
## and creates functions to (1) set the value of x,
## (2) get the value of x, (3) set (calculate) the inverse of x,
## and (4) get the inverse of x.

makeCacheMatrix <- function(x = matrix()) {
    x_inverse <- NULL
    set <- function(y) {
        x <<- y             ## <<- assigns a value to an object
        x_inverse <<- NULL  ## in a different environment
    }
    get <- function() x
    set_inverse <- function(solve) x_inverse <<- solve
    get_inverse <- function() x_inverse
    list(set = set, get = get,
         set_inverse = set_inverse,
         get_inverse = get_inverse)
}

## cacheSolve: A function to take the inverse of a matrix. The
## function takes a vector of functions as input
## If the inverse has already been calculated and cached,
## return the cached value.

cacheSolve <- function(vec, ...) {
        inverse <- vec$get_inverse()
        if(!is.null(inverse)) {
			message("getting cached data")
			return(inverse)         ## return cached inverse
		}
		data <- vec$get()
		inverse <- solve(data, ...)
		vec$set_inverse(inverse)
		inverse                     ## Return inverse of vec$get()
}
