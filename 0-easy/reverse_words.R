args <- commandArgs(trailingOnly=TRUE)
test.cases <- strsplit(readLines(args[[1]], warn=FALSE), '\n')
for (test in test.cases) {
  if (length(sub(" +$", "", test)) > 0) {
    cat(rev(unlist(strsplit(test," "))),'\n')
  }
}
