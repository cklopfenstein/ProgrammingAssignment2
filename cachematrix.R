## cachematrix.R
## Functions to calculate the inverse of a matrix, and 
## cache the inverse matrix. Note that an error occurs if
## the matrix is not invertible, and the error is not 
## handled.

## makeCacheMatrix: A function to create a "vector" of functions,
## which take a matrix x as input, 
## and create functions to (1) set the value of x,
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


## cacheSolve: A function to take the inverse of a matrix.
## If the inverse has already been calculated and cached,
## return the cached value.

cacheSolve <- function(x, ...) {    ## input x is a vector of functions
        ## Return a matrix that is the inverse of x$get()
        x_inverse <- x$get_inverse()
        if(!is.null(x_inverse)) {
			message("getting cached data")
			return(x_inverse)
		}
		data <- x$get()
		x_inverse <- solve(data, ...)
		x$set_inverse(x_inverse)
		x_inverse
			
}
