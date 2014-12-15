args <- commandArgs(trailingOnly=TRUE)
cat(file.info(args[[1]])$size)
