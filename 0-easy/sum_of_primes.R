args <- commandArgs(trailingOnly=TRUE)

i<- 1
psum <- 2
n <- 2
while(n<1000) {
  prime<-TRUE
  i<-i+1
  for(j in (2:as.integer(sqrt(i)))) {
    if((i %% j)==0) {
      prime<-FALSE
      break
    }
  }
  if(prime) {
    #res <- c(res,i)
    psum <- psum+i
    n <- n+1
  }
}
cat(psum+3,sep="\n")

