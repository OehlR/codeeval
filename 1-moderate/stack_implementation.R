args <- commandArgs(trailingOnly=TRUE)


Stack <- setRefClass("Stack",
                 fields = list(x = "numeric"),
                 methods = list(
                   push = function(i) {
                     .self$x <- c(.self$x,i)
                   },
                   pop = function() {
                     p <- NULL
                     if (!.self$isEmpty()) {
                       p <- .self$x[.self$size()]
                       if(.self$size()==1) {
                         .self$x <- numeric()
                       } else {
                         .self$x <- .self$x[-.self$size()]
                       }                       
                     }
                     return(p)
                   },
                   isEmpty = function() {
                     res <- FALSE
                     if(.self$size()==0) res <- TRUE
                     return(res)
                   },
                   size = function() {
                     return(length(.self$x))
                   }
                 )
)

con <- file(args[[1]], "r")   
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  
  sequence <- as.numeric(strsplit(l,split=" ")[[1]])
  
  stk = Stack$new()
  for (i in sequence) {
    stk$push(i)
  }

  printout <- TRUE
  while (!stk$isEmpty()) {
    r <- stk$pop()    
    if (printout) {
      cat(r,sep="")
      if (stk$size() >= 2) {
        cat(" ",sep="")
      }
    }    
    printout = !printout
  }
  cat("",sep="\n")
}
close(con)

