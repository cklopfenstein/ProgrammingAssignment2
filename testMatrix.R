## testMatrix.R
setwd("~/Devel/R/DataScience/ProgrammingAssignment2")
source("cachematrix.R")

mx <- array(c((0:1), (1:0)), dim=c(2,2));
##mx <- matrix(c((0:1), (1:0)), nrow = 2, ncol = 2);
mfun <- makeCacheMatrix(mx);

inv1 <- cacheSolve(mfun);
inv1;

inv2 <- cacheSolve(mfun);
inv2;

##xx <- array(c((1:0), (0:-1)), dim=c(2,2));
xx <- matrix(c((1:0), (0:-1)), nrow = 2, ncol = 2);
mfun$set(xx);
mx <- mfun$get();
mx;
inv1 <- cacheSolve(mfun);
inv1;

inv2 <- cacheSolve(mfun);
inv2;
## non-invertible matrix xy
xy <- array(c((0:1), (0:1)), dim=c(2,2));
mfun$set(xy);
mx <- mfun$get();
mx;
inv1 <- cacheSolve(mfun);
inv1;

inv2 <- cacheSolve(mfun);
inv2;

## non-square matrix xz
xz <- array(c((0:2), (2:0)), dim=c(3,2));
mfun$set(xz);
mx <- mfun$get();
mx;
inv1 <- cacheSolve(mfun);
inv1;

inv2 <- cacheSolve(mfun);
inv2;

## input a vector - set(), get() ok, error inverting. check.
v1 <- c(1,0,0,-1);
mfun$set(lst);
mfun$get();

## different matrix
m4 <- matrix(c(c(1,2,3,4), c(4,3,2,1), c(1,-2,-3,4), c(-4,3,2,-1)),
        nrow = 4, ncol = 4);
mfun$set(m4);
mfun$get();
m4inv <- cacheSolve(mfun);
m4inv;
m4inv <- cacheSolve(mfun);
m4inv;
id <- m4 %*% m4inv;
id;