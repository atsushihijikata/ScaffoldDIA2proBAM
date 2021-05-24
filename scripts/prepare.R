library(proBAMr)
args <- commandArgs(trailingOnly = T)

default_flgs <- is.na(args[1])
default_args <- c("annot/gencode_v38")
args[default_flgs] = default_args[default_flgs]

annot_path <- args[1]
gtfFile <- "gencode/gencode.v38.annotation.gtf"
CDSfasta <- "gencode/gencode.v38.pc_transcripts.fa"
pepfasta <- "gencode/gencode.v38.pc_translations.fa"

PrepareAnnotationGENCODE(gtfFile, CDSfasta, pepfasta, annot_path,
			 dbsnp=NULL, splice_matrix=FALSE, COSMIC=FALSE)

