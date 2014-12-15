args <- commandArgs(trailingOnly=TRUE)
write.table(format(1:12 %*% t(1:12), justify="right"),row.names=F, col.names=F, quote=F)
