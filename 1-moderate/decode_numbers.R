args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat('85
2828
64
7572
5722
8
1718
9
5
9
65
1319
31
92
7968
7
4487
57
8
3558
558
42
32
4693
58
495
6
75
97
1971
9
1
513
6841
227
1219
6376
9
494
1111\n
',file=f<-tempfile())
args<-list(f)
#unlink(f)
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  x <- as.numeric(strsplit(l,split="")[[1]])
  cpt<-0
  if(length(x)>1) {
    for(i in 2:length(x)) {
      if(as.numeric(paste(x[(i-1):i],collapse="")) <= 26) {
        cpt<-cpt+1
      }
    }
    if(cpt==1) {
      cat(sum((cpt:1)+1),sep="\n") 
    } else {
      cat(sum((cpt:2)+1),sep="\n")    
    }    
  } else {
    cat(1,sep="\n")        
  }
  
}
close(con)

