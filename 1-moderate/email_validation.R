args <- commandArgs(trailingOnly=TRUE)

if(F) {
  cat('A@b@c@example.com
b@d.net
just"not"right@example.com
<invalid>@foo.com
"very.unusual.@.unusual.com"@example.com
this is not true
b@domain.net
Abc.example.com
hfij#kjdfvkl
niceandsimple@example.com
disposable.style.email.with+156@example.com\n',file=f<-tempfile())
  args<-list(f)
  #unlink(f)
}

con <- file(args[[1]], "r") 
while(length(l <- readLines(con, n = 1, warn = FALSE)) > 0) {
  matche <- grep("^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$",tolower(l))
  cat(ifelse(length(matche)>0,"true","false"),sep="\n")
}
close(con)



