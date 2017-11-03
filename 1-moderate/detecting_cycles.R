args <- commandArgs(trailingOnly=TRUE)


f <- setRefClass("f",
                 fields = list(i = "numeric",pas="numeric"),
                 methods = list(
                   initialize = function(i,pas) {
                     .self$i <<- i
                     .self$pas <<- pas
                   },
                   getNext = function() {
                     .self$i <- .self$i+.self$pas
                   }
                 )
)

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  sequence <- as.numeric(strsplit(l,split=" ")[[1]])
  n <- length(sequence)
  lent <- f$new(i=1,pas=1)
  vite <- f$new(i=2,pas=2)
  
  t = lent$i
  v = vite$i
  m = 1
  while (!sequence[t]==sequence[v]) {
    t <- lent$getNext()%%n
    v <- vite$getNext()%%n
    t <- ifelse(t==0,n,t)
    v <- ifelse(v==0,n,v)
    m = m + 1  
  }
  isbegin = FALSE
  bgn = min(t,v)
  lng <- 1
  while (!sequence[t]==sequence[t+lng]) {
    lng <- lng+1
  }  
  while (!isbegin) {
    if (bgn > 1) {
      if(sequence[bgn-1]==sequence[(bgn+lng)-1] & bgn > 1) {
        bgn <- bgn-1
      } else {
        isbegin = TRUE
      }
    } else {
      isbegin = TRUE  
    }
  }
  print(sequence)
  cat(paste(sequence[bgn:(bgn+lng-1)],collapse=" "),sep="\n")
  
}
close(con)

