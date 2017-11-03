args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat("Tom exhibited.\nAmy Lawrence was proud and glad, and she tried to make Tom see it in her face - but he wouldn't look.\nTom was tugging at a button-hole and looking sheepish.\nTwo thousand verses is a great many - very, very great many.\nTom's mouth watered for the apple, but he stuck to his work.\n",file=x<-tempfile())
  args<-list(x)
  #unlink(x)
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  if(nchar(l)>55) {
    d <- strsplit(l,split="")[[1]]
    d <- d[1:40]
    trimpos <- which(d == " ")
    if(length(trimpos)>0) {
      cat(paste(c(d[1:(max(trimpos)-1)],"... <Read More>"),collapse=""),sep="\n")
    } else {  
      cat(res <- paste(c(d,"... <Read More>"),collapse=""),sep="\n")
    }
  } else {
    cat(l, sep="\n")
  }
}
close(con)

l <- "123456789A123456789B123456789C123456789D 23456789E1234 6"
if(nchar(l)>55) {
  d <- strsplit(l,split="")[[1]]
  d <- d[1:40]
  trimpos <- which(d == " ")
  if(length(trimpos)>0) {
    cat(paste(c(d[1:(max(trimpos)-1)],"... <Read More>"),collapse=""),sep="\n")
  } else {  
    cat(res <- paste(c(d,"... <Read More>"),collapse=""),sep="\n")
  }
} else {
  cat(paste(c(d,"... <Read More>"),collapse=""), sep="\n")
}


if(length(which(d == " ")>0) {
  paste(d[1:(max(which(d == " "))-1)],collapse=""),"... <Read More>",collapse="")
}

cat(ifelse(nchar(l)>55,sub("^(.+)( ?.+)*$","\\1... <Read More>",substr(l,1,40)),l),sep="\n")  


## more sexiest way
##   cat(ifelse(nchar(l)>55,gsub("^(.+)( )*","\\1... <Read More>",substr(l,1,40)),l),sep="\n")  