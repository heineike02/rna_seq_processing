#!/bin/bash

#take genome directory and fastq filename as an input directory. 

genomeDir=$1

genomeFastaFiles=$2

sjdbGTFfile=$3

#Star aligner options: 
#runThreadN 12 = use this many threads on the server (only use 3/4 of total)
#runMode = genomeGenerate
#sjdbOverhang = 49.  Readlength-1. We had 50bp reads.  Specifies the length of the genomic sequence around the annotated junction to be used in constructing the splice junctions database. Ideally, this length should be equal to the ReadLength-1, where ReadLength is the length of the reads. For instance, for Illumina 2x100b paired-end reads, the ideal value is 100-1=99. In case of reads of varying length, the ideal value is max(ReadLength)-1. In most cases, the default value of 100 will work as well as the ideal value. 

# In addition to the aforementioned options, for GFF3 formatted annotations you need to use
#--sjdbGTFtagExonParentTranscript Parent. In general, for --sjdbGTFfile files STAR only
#processes lines which have --sjdbGTFfeatureExon (=exon by default) in the 3rd field #(column). The exons are assigned to the transcripts using parent-child relationship defined by the
# --sjdbGTFtagExonParentTranscript (=transcript id by default) GTF/GFF attribute. 

/home/jpfonseca/software/STAR/bin/Linux_x86_64_static/STAR --runThreadN 12 --runMode genomeGenerate --genomeDir $genomeDir --genomeFastaFiles $genomeFastaFiles --sjdbGTFfile $sjdbGTFfile --sjdbOverhang 49
