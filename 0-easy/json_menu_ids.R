args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat('{"menu": {"header": "menu", "items": [{"id": 27}, {"id": 0, "label": "Label 0"}, null, {"id": 93}, {"id": 85}, {"id": 54}, null, {"id": 46, "label": "Label 46"}]}}
{"menu": {"header": "menu", "items": [{"id": 81}]}}
{"menu": {"header": "menu", "items": [{"id": 70, "label": "Label 70"}, {"id": 85, "label": "Label 85"}, {"id": 93, "label": "Label 93"}, {"id": 2}]}}\n',file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- strsplit(gsub("\"","",l),split=" ")[[1]]
  ids <- which(x=="Label")
  if(length(ids >0)) {
    cat(sum(as.numeric(gsub("([^0-9]+)","",x[ids+1]))),sep="\n")
  } else {
    cat("0",sep="\n")    
  }
}
close(con)
