args <- commandArgs(trailingOnly=TRUE)

rotate <- function(vec,n) {
  vec[((1:n %% n)+1)]
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x<- strsplit(strsplit(l,split=",")[[1]],split="")
  isrotation <- FALSE
  n <- length(x[[1]])
  r <- x[[1]]
  if(length(x[[1]])==length(x[[2]])) {
    for (i in 1:n) {
      r <- rotate(r,n)
      if(sum(r == x[[2]])==n) {
        isrotation <- TRUE
        break
      }  
    }  
  }
  cat(ifelse(isrotation,"True","False"),sep="\n")
}
close(con)



