args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat('-3,3,-1,1,1,-1,3,-3\n-3,3,-1,1,-2,4,2,2\n',file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

overlap <- function(tl1,br1,tl2,br2) {
  ret <- TRUE
  if(tl1$x > br2$x | tl2$x > br1$x) ret <- FALSE
  if(tl1$y < br2$y | tl2$y < br1$y) ret <- FALSE
  return(ret)
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- as.numeric(strsplit(l,split=",")[[1]])
  tl1 = list(x=x[1],y=x[2]) 
  br1 = list(x=x[3],y=x[4])
  tl2 = list(x=x[5],y=x[6])
  br2 = list(x=x[7],y=x[8])
  cat(ifelse(overlap(tl1,br1,tl2,br2),"True","False"),sep="\n")
}
close(con)


