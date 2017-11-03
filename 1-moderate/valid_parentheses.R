args <- commandArgs(trailingOnly=TRUE)


Stack <- setRefClass("Stack",
                     fields = list(x = "character"),
                     methods = list(
                       push = function(i) {
                         .self$x <- c(.self$x,i)
                       },
                       pop = function() {
                         p <- NULL
                         if (!.self$isEmpty()) {
                           p <- .self$x[.self$size()]
                           if(.self$size()==1) {
                             .self$x <- character()
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

opar <- c("(","{","[")
fpar <- c(")","}","]")


con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  pars <- strsplit(l,split="")[[1]]
  if(length(pars)<=1) {
    valid <- FALSE
  } else {
    valid <- TRUE
    stk <- Stack$new()
    for(p in pars) {
      if(p %in% opar) {
        stk$push(p)
      }
      if(p %in% fpar) {
        typ <- which(p==fpar)
        if(stk$isEmpty()) {
          valid <- FALSE
        } else {
          cp <- stk$pop()
          if(!opar[typ]==cp) {
            valid <- FALSE
            break
          }          
        }
      }
    }    
  }
  cat(ifelse(valid,"True","False"),sep="\n")
}
close(con)

