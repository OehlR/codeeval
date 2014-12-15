args <- commandArgs(trailingOnly=TRUE)
for(n in 1:99) {
  if(!n%%2 == 0) cat(n,sep="\n")
}


# VECTORIZE SOLUTION BUT MEMORY CONSUMING
# is.oddnumber <- function(n) {
#   return(!n%%2 == 0)
# }
# unlist(lapply(1:99,function(x) if(!x%%2 == 0) x))

