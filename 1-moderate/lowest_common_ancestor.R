args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat('8 52\n3 29\n',file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

tree <- list()
tree[["30"]] <- c(8,52)
tree[["8"]] <- c(3,20)
tree[["20"]] <- c(10,29)

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- as.numeric(strsplit(l,split=" ")[[1]])
  find <- FALSE
  for(i in 1:length(tree)) {
    if (sum(tree[[i]] %in% x)>0) {
      find <- TRUE
      break
    }
  }
  if (find) cat(names(tree)[i],sep="\n")
}
close(con)





