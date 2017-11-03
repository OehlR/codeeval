args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat("Rkbs,5453; Wdqiz,1245; Rwds,3890; Ujma,5589; Tbzmo,1303;\n",file=x<-tempfile())
  args<-list(x)
  #unlink(x)
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
#  l <- "123456789A123456789B123456789C123456789D123456789E123456789F123456789G"
  x <- sort(as.numeric(gsub("(.*),([0-9]*)","\\2",strsplit(l,split=";")[[1]])))
  n <- length(x)
  if (n>1) x[2:n] <- x[2:n]-x[1:(n-1)]
  cat(paste(x,collapse=","),sep="\n")  
}
close(con)


l <- "Ramytdb,2683; Voclqmb,5236;"
