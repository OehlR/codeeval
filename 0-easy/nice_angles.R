args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat("330.39991833\n0.001\n14.64530319\n0.25\n254.16991217\n",file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}


con <- file(args[[1]], "r") 
while(length(l <- as.numeric(readLines(con, n = 1, warn = FALSE))) > 0) {
  d = floor(l)
  m = floor((l - d) * 60)
  s = floor((l - d - m/60) * 3600)
  cat(paste(d,".",formatC(m,width=2, format="d", flag="0"),"'",formatC(s,width=2, format="d", flag="0"),"\"",sep=""),sep="\n")    
}
close(con)

