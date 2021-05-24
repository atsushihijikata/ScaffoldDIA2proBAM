#!/bin/sh -f

R=`which Rscript`
url=http://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human
download=./download
datadir=./gencode
outdir=./annot/gencode_v38

if [ ! -e $download ]; then
    mkdir $download
fi
if [ ! -e $datadir ]; then
    mkdir $datadir
fi
if [ ! -e $outdir ]; then
    mkdir -p $outdir
fi

cd $download
curl -sO $url/release_38/gencode.v38.basic.annotation.gtf.gz 
curl -sO $url/release_38/gencode.v38.pc_transcripts.fa.gz 
curl -sO $url/release_38/gencode.v38.pc_translations.fa.gz 
cd ..

zcat $download/gencode.v38.basic.annotation.gtf.gz > $datadir/gencode.v38.annotation.gtf
python scripts/modify_fasta_file.py $download/gencode.v38.pc_transcripts.fa.gz > $datadir/gencode.v38.pc_transcripts.fa
python scripts/modify_fasta_file.py $download/gencode.v38.pc_translations.fa.gz > _z
python scripts/swap_acc.py _z > $datadir/gencode.v38.pc_translations.fa
python scripts/filter_gtf.py $datadir/gencode.v38.pc_transcripts.fa $download/gencode.v38.basic.annotation.gtf.gz > $datadir/gencode.v38.annotation.gtf
python scripts/filter_gtf.py $datadir/gencode.v38.pc_transcripts.fa $download/gencode.v38.basic.annotation.gtf.gz > $datadir/gencode.v38.annotation.gtf
rm _z

$R ./scripts/prepare.R $outdir
