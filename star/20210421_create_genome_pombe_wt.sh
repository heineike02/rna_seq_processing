#!/bin/bash
#PBS -N cellcount
#PBS -l walltime=12:00:00
#PBS -l select=1:ncpus=8:mem=64gb
#PBS -m ea

module load star/2.7.1a 

genomeDir=/rds/general/user/bheineik/home/genomes/pombe_20201008_star

genomeFastaFiles=/rds/general/user/bheineik/home/genomes/Schizosaccharomyces_pombe_all_chromosomes_20201008_bare.fa

sjdbGTFfile=/rds/general/user/bheineik/home/genomes/Schizosaccharomyces_pombe_all_chromosomes_20201008_cellranger_exon.gtf


#Star aligner options: 
#runThreadN 8 = use this many threads on the server 
#runMode = genomeGenerate

#sjdbOverhang = 74.  matelength-1. We had 75bp reads.  Specifies the length of the genomic sequence around the annotated junction to be used in constructing the splice junctions database. Ideally, this length should be equal to the ReadLength-1, where ReadLength is the length of the reads. For instance, for Illumina 2x100b paired-end reads, the ideal value is 100-1=99. In case of reads of varying length, the ideal value is max(ReadLength)-1. In most cases, the default value of 100 will work as well as the ideal value. 

# In addition to the aforementioned options, for GFF3 formatted annotations you need to use
#--sjdbGTFtagExonParentTranscript Parent. In general, for --sjdbGTFfile files STAR only
#processes lines which have --sjdbGTFfeatureExon (=exon by default) in the 3rd field #(column). The exons are assigned to the transcripts using parent-child relationship defined by the
# --sjdbGTFtagExonParentTranscript (=transcript id by default) GTF/GFF attribute. 

star --runThreadN 8 --runMode genomeGenerate --genomeDir $genomeDir --genomeFastaFiles $genomeFastaFiles --sjdbGTFfile $sjdbGTFfile --sjdbOverhang 74
