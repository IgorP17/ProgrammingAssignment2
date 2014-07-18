## makeCacheMatrix - function to store origin and inversed matrix.
## cacheSolve - function to get inversed matrix.
## makeCacheMatrixV2 - as first, but more readable.


## object to store origin matrix and inversed
makeCacheMatrix <- function(x = matrix()) {
    inversed <- NULL
    set <- function(y) {
        x <<- y
        inversed <<- NULL
    }
    get <- function() x
    setinv <- function(inv) inversed <<- inv
    getinv <- function() inversed
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
}


##get inversed matrix based upon makeCacheMatrix
##printMessage = FALSE - do we need print message that
##cached inverse matrix returned

cacheSolve <- function(x, printMessage = FALSE, ...) {
    m <- x$getinv()
    #if inversed NOT null e.g. already initialized
    if(!is.null(m)) {
        #if we want print some message
        if (printMessage) message("getting cached data")
        
        return(m)
    }
    #inversed matrix does not exists
    data <- x$get()#get original matrix
    m <- solve(data, ...) #solve it
    x$setinv(m) #set inversed
    m #return inversed
}



##version 2 of makeCacheMatrix
makeCacheMatrixV2 <- function(x = matrix()) {
    inversed <- NULL
    storedMatrix <- x
    set <- function(y) {
        storedMatrix <<- y
        inversed <<- NULL
    }
    get <- function() storedMatrix
    setinv <- function(inv) inversed <<- inv
    getinv <- function() inversed
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
}

