args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat("14:01:57 12:47:11\n13:09:42 22:16:15\n08:08:06 08:38:28\n23:35:07 02:49:59\n14:31:45 14:46:56\n",file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- strsplit(l,split=" ")[[1]]
  x <- x[order(x)]
  cat(format(as.POSIXct(c(difftime(strptime(x[2],"%H:%M:%S"), strptime(x[1],"%H:%M:%S"), units = "sec")), origin = Sys.Date()),"%H:%M:%S"),sep="\n")
}
close(con)
