#!/bin/sh -f

R=`which Rscript`
infile=$1
target=$2

echo $infile
echo $target
echo $target.tsv
echo $R
./scripts/convert_scaffoldDIA_to_PSMtab.py $infile $target.tsv
$R ./scripts/run_probamr_gencode.R $target.tsv $target.sam

cat ./data/sam_header $target.sam > _tmp.sam
samtools view -S -b _tmp.sam > $target.bam
samtools sort $target.bam $target.sort
samtools index $target.sort.bam
rm _tmp.sam
