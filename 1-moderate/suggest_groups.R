args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat('Amira:Isaura,Lizzie,Madalyn,Margarito,Shakira,Un:Driving,Mineral collecting
Elliot:Isaura,Madalyn,Margarito,Shakira:Juggling,Mineral collecting
Isaura:Amira,Elliot,Lizzie,Margarito,Verla,Wilford:Juggling
Lizzie:Amira,Isaura,Verla:Driving,Mineral collecting,Rugby
Madalyn:Amira,Elliot,Margarito,Verla:Driving,Mineral collecting,Rugby
Margarito:Amira,Elliot,Isaura,Madalyn,Un,Verla:Mineral collecting
Shakira:Amira,Elliot,Verla,Wilford:Mineral collecting
Un:Amira,Margarito,Wilford:
Verla:Isaura,Lizzie,Madalyn,Margarito,Shakira:Driving,Juggling,Mineral collecting
Wilford:Isaura,Shakira,Un:Driving\n',file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

l <- readLines(args[[1]], warn = FALSE)
df <- strsplit(l,split=":")

users   <- unlist(lapply(df,function(x) x[1]))
friends <- unlist(lapply(df,function(x) x[2]))
groups  <- unlist(lapply(df,function(x) x[3]))

for(i in 1:length(users)) {
  frd.ids <- users %in% strsplit(friends[[i]],split=",")[[1]]
  frd.n <- sum(frd.ids)
  potentialGroups <- table(unlist(strsplit(groups[frd.ids],split=",")))
  potentialGroups.names <- names(potentialGroups[(potentialGroups/frd.n)>=0.5])
  relatedGroups <- potentialGroups.names[!potentialGroups.names %in% strsplit(groups[i],split=",")[[1]]]
  if(length(relatedGroups)>0) {
    cat(paste(users[i],paste(sort(relatedGroups),collapse=","),sep=":"),sep="\n")
  }  
}


