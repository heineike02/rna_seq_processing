#!/bin/bash

genomeDir=~/genomes/scer_20170412/genomeDir/

mkdir ~/solis_data/20170412_alignment/$i;


for i in $(find ~/solis_data/fastq/* -name "*.txt.gz"); do
    echo $i; 
    hand=$( basename ${i} .txt.gz)
    echo $hand;
    ~/../jpfonseca/software/STAR/bin/Linux_x86_64_static/STAR --genomeDir  $genomeDir --readFilesIn $i --outSAMtype SAM --quantMode GeneCounts  --runThreadN 8 --readFilesCommand zcat --outFileNamePrefix ~/solis_data/20170412_alignment/${hand}_ --outReadsUnmapped Fastx;
done

