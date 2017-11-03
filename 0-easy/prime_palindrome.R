args <- commandArgs(trailingOnly=TRUE)
i <- 1
psum <- n <- 0
while(n<=1000) {
  i<-i+1
  if(sum(i %% 2:i == 0)==1) {
    psum <- psum+i
    n <- n+1
  }
}
sum(prime)

