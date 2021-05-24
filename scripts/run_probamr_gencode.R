args <- commandArgs(trailingOnly = T)

default_flgs <- is.na(args[1:2])
default_args <- c("input.tsv", "output.sam")
args[default_flgs] = default_args[default_flgs]

psm_file <- args[1]
out_file <- args[2]
db <- "gencode_v38"

print(out_file)
exon_anno <- paste("annot", db, "exon_anno.RData", sep="/")
proseq <- paste("annot", db, "proseq.RData", sep="/")
procodingseq <- paste("annot", db, "procodingseq.RData", sep="/")

library(proBAMr)

passedPSM <- read.table(psm_file, sep="\t", header=TRUE)
load(exon_anno)
load(proseq)
load(procodingseq)
options(stringAsFactors=FALSE)

print(head(passedPSM))

SAM <- PSMtab2SAM(passedPSM, XScolumn='score', exon, proteinseq, procodingseq)
write.table(SAM, file=out_file, sep="\t", quote=FALSE, row.names=FALSE, col.names=FALSE)

dim(SAM)
