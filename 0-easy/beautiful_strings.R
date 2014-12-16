args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat('ABbCcc\nGood luck in the Facebook Hacker Cup this year!\n',file=x<-tempfile())
  args<-list(x)
  #unlink(x)
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- tolower(strsplit(gsub(" ","",l),split="")[[1]])
  frq <- table(x[which(x %in% letters)])
  frq <- sort(frq,decreasing=T)
  val <- 26:(26-length(frq)+1)
  cat(sum(val*frq),sep="\n")
}
close(con)

