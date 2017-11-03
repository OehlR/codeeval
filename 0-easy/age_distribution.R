args <- commandArgs(trailingOnly=TRUE)

## FOR LOCAL TEST
if(F) {
  cat("0\n19\n",file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

## BEGIN
cuts <- c(-Inf,0, 3, 5, 12, 15, 19, 23, 66, 101)
labs <- c("This program is for humans",
          "Still in Mama's arms",
          "Preschool Maniac",
          "Elementary school",
          "Middle school",
          "High school",
          "College",
          "Working for the man",
          "The Golden Years",
          "This program is for humans")

l <- as.numeric(readLines(args[[1]], warn = FALSE))
cat(labs[findInterval(l, cuts)],sep="\n")
