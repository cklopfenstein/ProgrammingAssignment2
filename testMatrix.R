## testMatrix.R

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
