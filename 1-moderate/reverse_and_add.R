args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat("195\n",file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

isPalindrome <- function(a,b) {
  return(all.equal(a,b)==TRUE)
}


con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  n <- strsplit(l,split="")[[1]]
  end <- FALSE
  cpt <- 0
  while(TRUE) {
    if(isPalindrome(n,rev(n))) {
      break
    } else {
      a <- as.numeric(paste(n,collapse=""))
      b <- as.numeric(paste(rev(n),collapse=""))    
      cpt <- cpt+1
      n <- strsplit(as.character(a+b),split="")[[1]]
    }
  }
  cat(paste(cpt,paste(n,collapse=""),sep=" "),sep="\n")
}
close(con)

