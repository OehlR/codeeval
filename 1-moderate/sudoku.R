args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat('4;1,4,2,3,2,3,1,4,4,2,3,1,3,1,4,2
4;2,1,3,2,3,2,1,4,1,4,2,3,2,3,4,1\n',file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- strsplit(l,split=";")[[1]]
  n <- as.numeric(x[1])
  grid <- matrix(as.numeric(strsplit(x[2],split=",")[[1]]),n,n,byrow=T)
  sq <- sqrt(n)
  ret <- "True"
  if(sum(apply(grid,1,function(y) length(unique(y)))==n)==n) {
    if(sum(apply(grid,2,function(y) length(unique(y)))==n)==n) {
      for(i in seq(1,n,sq)) {
        for(j in seq(1,n,sq)) {
          if(!length(unique(as.vector(grid[i:(i+sq-1),j:(j+sq-1)])))==n) {
            ret <- "False"
            break
          }
        } 
      }   
    } else {
      ret <- "False"    
    }
  } else {
    ret <- "False"  
  }
  cat(ret,sep="\n")
}
close(con)
