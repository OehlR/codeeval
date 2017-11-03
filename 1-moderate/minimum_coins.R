args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat("11\n20\n",file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

coins <- c('1'= 1,
          '3'= 3,
          '5'= 5)



seuil<-10e-4 #floating comma
con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  #l<-"11"
  rest <- as.numeric(l)
  cpt <- 0
  while(!rest<=seuil) {
    cpt<-cpt+1
    rest <- rest-coins[max(which((coins-rest)<seuil))]
  }
  cat(paste(cpt,collapse=","),sep="\n")
}
close(con)



