args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat('No matttter whom you  choose, she deccccclared, I will abide by your decision.\nI should fly away and you would never see me again.\n',file=x<-tempfile())
  args<-list(x)
  #unlink(x)
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  cat(gsub("(.)\\1+","\\1",l),sep="\n")
}
close(con)

