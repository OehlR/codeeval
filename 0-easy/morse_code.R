args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat('.- ...- ..--- .-- .... .. . -.-. -..-  ....- .....\n-... .... ...--\n',file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}



demorse <- function(m) {
  switch(m,
         ".-"     = "A",
         "-."     = "N",
         "-----"  = "0",
         "-..."   = "B",
         "---"    = "O",
         ".----"  = "1",
         "-.-."   = "C",
         ".--."   = "P",
         "..---"  = "2",
         "-.."    = "D",
         "--.-"   = "Q",
         "...--"  = "3",
         "."      = "E",
         ".-."    = "R",
         "....-"  = "4",
         "..-."   = "F",
         "..."    = "S",
         "....."  = "5",
         "--."    = "G",
         "-"      = "T",
         "-...."  = "6",
         "...."   = "H",
         "..-"    = "U",
         "--..."  = "7",
         ".."     = "I",
         "...-"   = "V",
         "---.."  = "8",
         ".---"   = "J",
         ".--"    = "W",
         "----."  = "9",
         "-.-"    = "K",
         "-..-"   = "X",
         ".-.."   = "L",
         "-.--"   = "Y",
         "--"     = "M",
         "--.."   = "Z",
         "")
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  mots <- strsplit(strsplit(l, split="  ")[[1]], split=" ")
  cat(paste(unlist(lapply(mots,function(x) paste(unlist(lapply(x,function(m) demorse(m))),collapse=""))),collapse=" "),sep="\n")  
}
close(con)
