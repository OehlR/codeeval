args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat("SetCol 32 20\nSetRow 15 7\nSetRow 16 31\nQueryCol 32\nSetCol 2 14\nQueryRow 10\nSetCol 14 0\nQueryRow 15\nSetRow 10 1\nQueryCol 2\n",file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

mat <- matrix(0,256,256)
con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- strsplit(l,split=" ")[[1]]
  instruction <- x[1]
  ops <- as.numeric(x[2:3])
  if(instruction=="SetRow") {
    mat[ops[1],] <- ops[2]
  } else if(instruction=="SetCol") {
    mat[,ops[1]] <- ops[2]
  } else if(instruction=="QueryRow") {
    cat(sum(mat[ops[1],]),sep="\n")
  } else if(instruction=="QueryCol") {  
    cat(sum(mat[,ops[1]]),sep="\n")
  } else {
    ""
  }
}
close(con)
  
  