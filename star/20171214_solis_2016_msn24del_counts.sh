#!/bin/bash

#first moved all the fastq files from the original data file into a folder called fastq

#moved metadata into a folder called meta

#decompressed files to convert .txt.tar.gz files to .txt.gz
#
#for a in *.tar.gz; do echo $a; tar -xvf $a; done
#

#moved files from new directory
#~/solis_data_msn24del/fastq/lab/soexa_public/Pincus/140722_WIGTC-HISEQB_C55DACXX/Quality_score/
#back to fastq directory

#rezipped files
#gzip *.txt


genomeDir=~/genomes/scer_20170412/genomeDir/

mkdir ~/rna_seq_data/solis_data_msn24del/20171214_alignment/;


for i in $(find ~/rna_seq_data/solis_data_msn24del/fastq/* -name "*.txt.gz"); do
    echo $i; 
    hand=$( basename ${i} .txt.gz)
    echo $hand;
    ~/../jpfonseca/software/STAR/bin/Linux_x86_64_static/STAR --genomeDir  $genomeDir --readFilesIn $i --outSAMtype SAM --quantMode GeneCounts  --runThreadN 8 --readFilesCommand zcat --outFileNamePrefix ~/rna_seq_data/solis_data_msn24del/20171214_alignment/${hand}_ --outReadsUnmapped Fastx;
done

