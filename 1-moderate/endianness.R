args <- commandArgs(trailingOnly=TRUE)

cat(ifelse(.Platform$endian=="little","LittleEndian","BigEndian"),sep="\n")
