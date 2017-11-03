args <- commandArgs(trailingOnly=TRUE)

## FOR LOCAL TEST
if(F) {
  cat("Feb 2004-Dec 2009; Sep 2004-Jul 2008\nAug 2013-Mar 2014; Apr 2013-Aug 2013; Jun 2014-Aug 2015; Apr 2003-Nov 2004; Apr 2014-Jan 2015\nMar 2003-Jul 2003; Nov 2003-Jan 2004; Apr 1999-Nov 1999\nApr 1992-Dec 1993; Feb 1996-Sep 1997; Jan 2002-Jun 2002; Sep 2003-Apr 2004; Feb 2010-Nov 2011\nFeb 2004-May 2004; Jun 2004-Jul 2004\n",file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

## BEGIN
con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- strsplit(strsplit(l,split="; ")[[1]],split="-")
  we <- NULL
  for (p in x) {
    u <- seq(strptime(paste("01",p[1]),"%d %b %Y"),strptime(paste("01",p[2]),"%d %b %Y"),"month")
    add <- which(!is.element(u, we))
    if (length(add)>0) we<-c(we,u[add])
  }
  cat(floor(length(we)/12),sep="\n")
}
close(con)


