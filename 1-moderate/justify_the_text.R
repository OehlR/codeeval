args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat("Hello, World!
The precise 50-digits value of Pi is 3.14159265358979323846264338327950288419716939937510.
But he who would be a great man ought to regard, not himself or his interests, but what is just, whether the just act be his own or that of another. Next as to habitations. Such is the tradition.\n",file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

getLastSpacePos <- function(x,n) {
  if(nchar(x)>n) {
    d <- strsplit(x,split="")[[1]]
    d <- d[1:(n+1)]
    trimpos <- which(d == " ")
    if(length(trimpos)>0) {
      return(max(trimpos)-1)
    } else {  
      return(nchar(d))
    }
  } else {
    return(nchar(x))
  }
}


seuil<-80
con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  newlines <- list()
  str <- l
    i <- 0
  #for(i in 1:ceiling(nchar(l)/seuil)) {
  while(!str=="") {
    i <- i+1
    newlines[[i]] <- substr(str, 1, getLastSpacePos(str,seuil))  
    str <- substr(str, getLastSpacePos(str,seuil)+2,nchar(str))  
  }
  for (line in newlines[-length(newlines)]) {
    line <- strsplit(line,split=" ")[[1]]
    nspace <- length(line)-1
    theline <- character()
    if(nspace==0) {
      theline <- line[1]          
      spaces<- 0
    } else {
      dispospace <- seuil-sum(nchar(line))
      spaces <- numeric()
      for(p in 1:nspace) {
        spaces[p] <- ceiling(dispospace/nspace)
        dispospace <- dispospace-spaces[p]
        nspace <- nspace-1
        theline[(p*2)-1] <- line[p]
        theline[p*2] <- paste(rep(" ",spaces[p]),collapse="")
      }
      theline[p*2+1] <- line[p+1]
    }
    #print(spaces)
    cat(paste(theline,collapse=""),sep="\n")
  }
  cat(newlines[length(newlines)][[1]],sep="\n")
}
close(con)

