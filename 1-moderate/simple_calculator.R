args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat("250*14.3
3^6 / 117
(2.16 - 48.34)^-1
(59 - 15 + 3*6)/21\n",file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}


con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  cat(round(eval(parse(text=l)),5),sep="\n")  
}
close(con)


