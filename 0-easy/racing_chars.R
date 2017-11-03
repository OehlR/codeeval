args <- commandArgs(trailingOnly=TRUE)

## FOR LOCAL TEST
if(F) {
  cat("#########_##\n########C_##\n#######_####\n######_#C###\n#######_C###\n#######_####\n######C#_###\n######C_####\n#######_####\n#######_####\n",file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

## BEGIN
pos.actual=NULL
con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- strsplit(l, "")[[1]]
  find=FALSE
  pos.check <- which(x=='C')
  pos.gates <- which(x=='_')
  if(length(pos.check)>0) {
    if(is.null(pos.actual)) {
      pos.actual <- pos.check
      dir <- "|"
    } else {
      pos.rel <- (pos.check-pos.actual)
      if(abs(pos.rel) %in% c(0,1)) {
        if(pos.rel==-1)  dir <- "/"    
        if(pos.rel== 0)  dir <- "|"
        if(pos.rel== 1)  dir <- "\\"
        find=TRUE
        pos.actual <- pos.check 
      }      
    }
  } 
  if(!find) {
    if(is.null(pos.actual)) pos.actual <- pos.gates    
    pos.rel <- (pos.gates-pos.actual)
    if(pos.rel==-1)  dir <- "/"    
    if(pos.rel== 0)  dir <- "|"    
    if(pos.rel== 1)  dir <- "\\"    
    pos.actual <- pos.gates
  }
  x[pos.actual] <- dir
  cat(paste(x,collapse=""),sep="\n")
}
close(con)


