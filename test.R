####Test assignment 2
source("ProgrammingAssignment2/cachematrix.R")
#####

x <- matrix(rnorm (100, 1, 0.5), 10, 10)
system.time(for(i in 1:100000) { solve(x) } )

q <- makeCacheMatrix(x)
system.time(for(i in 1:100000) { cacheSolve(q) } )

z <- makeCacheMatrixV2(x)
system.time(for(i in 1:100000) { cacheSolve(q) } )


###########
# create a 10x10 matrix
mat <- makeCacheMatrix(matrix(rnorm(100), c(10,10)))
stopifnot(!is.null(mat$get()))
print("get() Works")
mat$set(matrix(rnorm(10000), c(100,100)))
stopifnot(dim(mat$get()) == c(100,100))
print("set() works")
stopifnot(is.null(mat$getinv()))
print("inverse is correctly null")
# calculating and caching inverse
cacheSolve(mat)
stopifnot(!is.null(mat$getinv()))
print("cachesolve seems to work")
print("If the next print occurs immediately, then caching is working")
Sys.time()
for(i in 1:10000) {
    cacheSolve(mat)
}
Sys.time()
stopifnot(!is.null(mat$getinv()))
print("Called cacheSolve() 10,000 times")