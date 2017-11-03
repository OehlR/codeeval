args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat("how are you, abc\nhello world, def\n",file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- strsplit(strsplit(l,split=", ")[[1]],split="")
  cat(paste(x[[1]][!x[[1]] %in% x[[2]]],collapse=""),sep="\n")  
}
close(con)
