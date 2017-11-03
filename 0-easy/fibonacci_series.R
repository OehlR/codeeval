args <- commandArgs(trailingOnly=TRUE)

## FOR LOCAL TEST
if(F) {
  cat("5\n16\n7\n18\n11\n12\n14\n17\n8\n3\n10\n19\n6\n1\n4\n2\n15\n13\n9\n0\n",file=x<-tempfile())
  args<-list(x)
  #unlink(x)
}

## BEGIN
fib <- function(n) {
  if (n<2) {
    return(n)
  } else {
    return(fib(n-1)+fib(n-2))
  }
}
fib(9)
### SOLUTION 1 : 31.764 ranking points
# txt <- readLines(args[[1]])
# cat(sapply(txt, function(x) fib(as.numeric(x))),sep="\n")

### SOLUTION 2 : 32.043 ranking points
# con <- file(args[[1]], "r") 
# while(length(l <- as.numeric(readLines(con, n = 1, warn = FALSE))) > 0) {
#   if(l<2){
#     cat(l,sep="\n")  
#   } else {
#     mem <- c(0,1,numeric(l-1)) 
#     for(x in 3:(l+1)) mem[x]<-mem[x-2]+mem[x-1]
#     cat(mem[x],sep="\n")
#   }
# }
# close(con)

### SOLUTION 3 : ??? ranking points
# con <- file(args[[1]], "r") 
# while(length(l <- as.numeric(readLines(con, n = 1, warn = FALSE))) > 0) {
#   if(l<2){
#     cat(l,sep="\n")  
#   } else {
#     mem <- c(0,1,numeric(l-1)) 
#     for(x in 3:(l+1)) mem[x]<-mem[x-2]+mem[x-1]
#     cat(mem[x],sep="\n")
#   }
# }
# close(con)
l<-as.numeric(readLines(args[[1]]))
l<- c(11,15,18,5,19)
mem <- c(0,1)
for(i in l) {
  ll<-length(mem)
  if(i >= (ll-1)) {
    mem <- c(mem,numeric(i-ll))         
    for(x in (ll+1):(i+1)) mem[x]<-mem[x-2]+mem[x-1]
    cat(mem[x],sep="\n")
  } else {
    cat(mem[i+1],sep="\n")
  }
}




cat("100\n200\n300\n400\n500\n600\n700\n",file=x<-tempfile())
args<-list(x)


### SOLUTION MATTHIAS 1
rfil1 <- function() {  
  l<-as.numeric(readLines(args[[1]]))
#  l<-rep(l,5000)
  mem <- c(0,1)
  for(i in l) {
    ll<-length(mem)
    if(i > (ll-1)) {
      mem <- c(mem,numeric(i-ll))         
      for(x in (ll+1):(i+1)) mem[x]<-mem[x-2]+mem[x-1]
      cat(mem[x],sep="\n")
    } else {
      cat(mem[i+1],sep="\n")
    }
  }
}
# Rprof(tmp <- tempfile())
# rfil1()
# Rprof()
# summaryRprof(tmp)
# unlink(tmp)




### SOLUTION MATTHIAS 2
rfil2 <- function() {
  con <- file(args[[1]], "r") 
  while(length(l <- as.numeric(readLines(con, n = 1, warn = FALSE))) > 0) {
    if(l<2){
      cat(l,sep="\n")  
    } else {
      mem <- c(0,1,numeric(l-1)) 
      for(x in 3:(l+1)) mem[x]<-mem[x-2]+mem[x-1]
      cat(mem[x],sep="\n")
    }
  }
  close(con)
}

### SOLUTION YOANN
fibonacci_2 <- function(n){
  return(fibonacci_2Double(as.numeric(n))[[1]])
}

fibonacci_2Double <- function(n) {
  if (n == 0) return(list(0,0))
  if (n == 1) return(list(1,0))
  if (n >= 2) {
    res <- fibonacci_2Double(n-1)
    return(list(res[[1]]+res[[2]],res[[1]]))
  }
}
rfil3 <- function() {
  l<-as.numeric(readLines(args[[1]]))
  for(i in l) {
    cat(fibonacci_2(i),sep="\n")
  }     
}

res<-microbenchmark(rfil1(),rfil3())
boxplot(res)


unlink(x)

