args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat("abcdefghik\nXa,}A#5N}{xOBwYBHIlH,#W\n(ABW>'yy^'M{X-K}q,\n6240488\n",file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- strsplit(l,split="")[[1]]
  x <- x[x %in% c(letters[1:10],0:9)]
  if(length(x)==0) {
    cat("NONE",sep="\n")    
  } else {
    ids <- which(x %in% letters[1:10])
    for (i in ids) {
      x[i] <- which(letters[1:10] %in% x[i])-1
    }
    cat(paste(x,collapse=""),sep="\n")    
  }
}
close(con)



