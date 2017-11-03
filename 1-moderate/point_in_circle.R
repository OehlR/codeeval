args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat('Center: (2.12, -3.48); Radius: 17.22; Point: (16.21, -5)
Center: (5.05, -11); Radius: 21.2; Point: (-31, -45)
Center: (-9.86, 1.95); Radius: 47.28; Point: (6.03, -6.42)\n',file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  center <- as.numeric(strsplit(gsub("^(Center: \\()?(.*)(\\))(;)(.)*$","\\2",l),split=", ")[[1]])
  radius <- as.numeric((gsub("^.*(Radius: )(.*)(;)(.*)","\\2",l)))
  point  <- as.numeric(strsplit(gsub("^.*(Point: \\()(.*)(\\))(.*)$","\\2",l),split=", ")[[1]])
  cat(ifelse(((point[1] - center[1])^2 + (point[2] - center[2])^2) < radius^2,"true","false"),sep="\n")  
}
close(con)
