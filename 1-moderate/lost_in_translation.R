args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat('\n',file=f<-tempfile())
  args<-list(f)
#unlink(f)
}

decode = c(
  'a'= 'y',
  'b'= 'h',
  'c'= 'e',
  'd'= 's',
  'e'= 'o',
  'f'= 'c',
  'g'= 'v',
  'h'= 'x',
  'i'= 'd',
  'j'= 'u',
  'k'= 'i',
  'l'= 'g',
  'm'= 'l',
  'n'= 'b',
  'o'= 'k',
  'p'= 'r',
  'q'= 'z',
  'r'= 't',
  's'= 'n',
  't'= 'w',
  'u'= 'j',
  'v'= 'p',
  'w'= 'f',
  'x'= 'm',
  'y'= 'a',
  'z'= 'q',
  ' '= ' ')

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- strsplit(l,split="")[[1]]
  u <- sapply(x,function(y) cat(decode[y],sep=""),simplify = T)
  cat("\n")
}
close(con)
