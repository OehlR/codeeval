args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat("2,10\n20,30\n",file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

isPrime <- function(x) {
  prime<-TRUE
  if(x>2) {
    for(i in (2:as.integer(sqrt(x)))) {
      if((x %% i)==0) {
        prime<-FALSE
        break
      }
    }    
  }
  return(prime)
}


con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- as.numeric(strsplit(l,split=",")[[1]])  
  cpt<-0
  for(i in x[1]:x[2]){
    if(isPrime(i)) {
      cpt <- cpt+1
    }
  }
  cat(cpt,sep="\n")
}
close(con)