# http://alstatr.blogspot.com/2013/06/matrix-operations.html
# R: Matrix Operations
# Posted by Al-Ahmadgaid Asaad

# Matrix manipulation in R are very useful in Linear Algebra. 
# Below are lists of common yet important functions in dealing operations with matrices:
#   Transpose - t
#   Multiplication - %*%
#   Determinant - det
#   Inverse - solve, or ginv of MASS library
#   Eigenvalues and Eigenvectors - eigen

# Consider these matrices, matrix1 and matrix2. In R, these would be,

dat1 <- c(3,4,5,2,1,3,6,5,4)
matrix1 <- matrix(dat1, nrow = 3, ncol = 3, byrow = TRUE)
matrix1

dat2 <- c(6,7,5,4,5,8,7,6,6)
matrix2 <- matrix(dat2, nrow = 3, ncol = 3, byrow = TRUE)
matrix2

# Transposing these, simply use t 

t(matrix1)
t(matrix2)

# Now multiplying these two matrices, that would be

matrix1 %*% matrix2

# For the determinant, we have

det(matrix1)
det(matrix2)

# Taking the inverse of matrix1 is achieved by solve or ginv R functions. Note that ginv is in MASS package,

solve(matrix1)

library(MASS)
ginv(matrix1)

# And finally, for eigenvalues and eigenvectors simply use eigen

eigen(matrix1)
eigen(matrix2)

# The output above returns the $values, which is the eigenvalues, and $vectors, the eigenvectors.