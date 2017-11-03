args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat("43;82.91
63.00;89.35
63.00;89.00
333.35;450.35
237;237
237.55;261.99
268;293
398.50;400.25
323.04;323.04
296.17;297
357;255
15.94;16.00
144.37;88.37
30.15;30.15
279.83;279.83
373;483
79.31;79.31
391;270
100;100
63;89.35\n",file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

cash <- c('PENNY'= 0.01,
          'NICKEL'= 0.05,
          'DIME'= 0.10,
          'QUARTER'= 0.25,
          'HALF DOLLAR'= 0.50,
          'ONE'= 1,
          'TWO'= 2,
          'FIVE'= 5,
          'TEN'= 10,
          'TWENTY'= 20,
          'FIFTY'= 50,
          'ONE HUNDRED'= 100)



seuil<-10e-4 #floating comma
con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- as.numeric(strsplit(l,split=";")[[1]])
  pp = x[1]
  ch = x[2]
  if(pp==ch) {
    li <- "ZERO"
  } else if (pp>ch) {
    li <- "ERROR"  
  } else {
    due <- ch-pp
    li <- character()
    while(!due<=seuil) {
      pos <- max(which((cash-due)<seuil))
      li <- c(li,names(cash[pos]))
      due <- due-cash[pos]*1
    }  
  }
  cat(paste(li,collapse=","),sep="\n")
}
close(con)



