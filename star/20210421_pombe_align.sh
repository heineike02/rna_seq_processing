#!/bin/bash
#PBS -N bulk_rnaseq
#PBS -l walltime=12:00:00
#PBS -l select=1:ncpus=8:mem=64gb
#PBS -m ea

module load star/2.7.1a
#module load python   #2.7.3(default)

genomeDir=/rds/general/user/bheineik/home/genomes/pombe_20201008_star

fastqIn_R1=/rds/general/user/bheineik/home/rna_seq_data/20210315_pombe_ox_bulk/Unaligned/BMH_WT_20_cont_S18_R1_001.fastq.gz

#BMH_759_20_cont_S7_R1_001.fastq.gz

#BMH_WT_20_cont_S18_R1_001.fastq.gz
fastqIn_R2=/rds/general/user/bheineik/home/rna_seq_data/20210315_pombe_ox_bulk/Unaligned/BMH_WT_20_cont_S18_R2_001.fastq.gz

mkdir /rds/general/user/bheineik/home/rna_seq_data/20210315_pombe_ox_bulk/mapped/WT_20_cont

outFileNamePrefix=/rds/general/user/bheineik/home/rna_seq_data/20210315_pombe_ox_bulk/mapped/WT_20_cont/WT_20_cont_

#readFilesCommand zcat - to uncompress .gz files.  

#outMultimapperOrder Random:  Random order of alignments for multimappers.  Default for future releases. 

STAR --genomeDir  $genomeDir --readFilesIn $fastqIn_R1 $fastqIn_R2 --readFilesCommand zcat --outFileNamePrefix $outFileNamePrefix --outReadsUnmapped Fastx --outMultimapperOrder Random --alignIntronMax 1200 --alignMatesGapMax 1700 --quantMode GeneCounts --runThreadN 8 