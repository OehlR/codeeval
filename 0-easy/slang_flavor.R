args <- commandArgs(trailingOnly=TRUE)

## FOR LOCAL TEST
if(F) {
  cat("Lorem ipsum dolor sit amet. Mea et habeo doming praesent. Te inani utroque recteque has, sea ne fugit verterem!\nUsu ei scripta phaedrum, an sed salutatus definiebas? Qui ut recteque gloriatur reformidans. Qui solum aeque sapientem cu.\nEu nam nusquam quaestio principes.\n",file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}


slang <- c(", yeah!",", this is crazy, I tell ya.",", can U believe this?",", eh?",", aw yea.",", yo.","? No way!",". Awesome!")

## BEGIN
con <- file(args[[1]], "r")
current <- 1
print<-FALSE
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- strsplit(l,split="")[[1]]
  for (i in 1:length(x)) {
    if(x[i] %in% c(".","!","?")) {
      if(print) {
        x[i] <- slang[current]
        current <- current+1
        if(current>length(slang)) current<-1        
      }
      print <- !print
    }
  }
  cat(paste(x,collapse=""),sep="\n")
}
close(con)

