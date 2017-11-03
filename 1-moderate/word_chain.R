args <- commandArgs(trailingOnly=TRUE)

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- strsplit(l,split=",")[[1]]
  w <- sapply(x,function(x) strsplit(x,split="")[[1]])
  
  begin.letters <- unlist(sapply(w, function(x) x[1]))
  end.letters <- unlist(sapply(w, function(x) x[length(x)]))
  eg <- expand.grid(end.letters,begin.letters)
  eg <- eg[as.vector(eg[,1])==as.vector(eg[,2]),]
  
  cat(ifelse(nrow(eg)>0,nrow(unique(eg)),"None"),sep="\n")
}
close(con)



l <- "soup,sugar,peas,rice"
l <- "ljhqi,nrtxgiu,jdtphez,wosqm"
l <- "hwtn,gajqx,jdwmns,rxomi,dvkhaup,tiogzyf,ipctsg,qylprau,dbfcsp,qan,snz"

x <- strsplit(l,split=",")[[1]]
w <- sapply(x,function(x) strsplit(x,split="")[[1]])

begin.letters <- unlist(sapply(w, function(x) x[1]))
end.letters <- unlist(sapply(w, function(x) x[length(x)]))
eg <- expand.grid(end.letters,begin.letters)
eg <- eg[as.vector(eg[,1])==as.vector(eg[,2]),]

cat(ifelse(nrow(eg)>0,nrow(unique(eg)),"None"),sep="\n")