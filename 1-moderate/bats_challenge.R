args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat('22 2 2 9 11\n33 5 0\n16 3 2 6 10\n835 125 1 113\n47 5 0\n',file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

l<-"835 125 1 113"
x     <- as.numeric(strsplit(l,split=" ")[[1]])
d     <- x[2]
nbats <- x[3]
if(nbats>0) bats <- x[4:length(bats)]
cpt<-0
pos<-7
while(pos <= (x[1]-5)) {
  if(nbats>0) {
    if(sum(pos:(pos+d) %in% bats)==0) {
      cpt<-cpt+1
      pos<-pos+d          
    } else {
      pos<-(pos:(pos+d))[pos:(pos+d) %in% bats]+d
    }
  } else {
    cpt<-cpt+1
    pos<-pos+d    
  }
}
cat(cpt,sep="\n") 

nextAvalaible <- function(pos,d,bats) {
  ret=NULL
  if((pos+d)<=(length(bats)-6)) {
    if(sum(bats[pos:(pos+d)])==0) {
      ret<-pos+d    
    } else {
      while(!sum(bats[pos:(pos+d)])==0) {
        pos<-pos+1
      }      
      #ret<-(max(which(bats[pos:(pos+d)]>0))+(pos-1))+(d)
      ret<-pos+d-1
    }
  }
  return(ret)
}




con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- as.numeric(strsplit(l,split=" ")[[1]])
  d <- x[2]
  nbats       <- x[3]
  if(nbats>0) bats <- x[4:length(x)]
  cpt<-0
  pos<-7
  while(pos <= (x[1]-5)) {
    if(nbats>0) {
      if(sum(pos:(pos+d) %in% bats)==0) {
        cpt<-cpt+1
        pos<-pos+d       
      } else {
        pos<-(pos:(pos+d))[pos:(pos+d) %in% bats]+(d-1)
      }
    } else {
      cpt<-cpt+1
      pos<-pos+d    
    }
  }
  cat(cpt,sep="\n")   
}
close(con)





l <- "22 2 2 9 11"


wirelength-(2*6)


