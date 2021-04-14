#!/bin/bash

#take genome directory and fastq filename as an input directory. 

fastqIn=$1

genomeDir=$2

outFileNamePrefix=$3

alignmentDir=$4

#Star aligner options: 
#quantMode GeneCounts counts up genes as it aligns
#runThreadN 12 = use this many threads on the server (only use 3/4 of total)
#readFilesCommand zcat - fastq files are in .gz so this uncompresses them
#outFilterMismatchNmax 14 per lexogen increase this from default of 10 because of random primers during library generation. 

#Lexogen bluebee uses these parameters: 
#First they do trimming though  (see bluebee manual). 

#Specific for their setup: 
#--runThreadN 8 
#--genomeDir $resource_dir/index$opt 
#--readFilesIn ${fq_clean} 
#--outFileNamePrefix $out_prefix

#Parameters listed as encode options in section 3.2.2 of star manual v2.5.3ab
#--outFilterType BySJout
#--outFilterMultimapNmax 20 
#--alignSJoverhangMin 8
#--alignSJDBoverhangMin 1 
#--outFilterMismatchNmax 999
#--alignIntronMin 20
#--alignIntronMax 1000000 
#--alignMatesGapMax 1000000

#Additional parameters
#--outFilterMismatchNoverLmax 0.6 
#--outSAMattributes NH HI NM MD 
#--outSAMtype BAM SortedByCoordinate


~/../jpfonseca/software/STAR/bin/Linux_x86_64_static/STAR --genomeDir  $genomeDir --readFilesIn $fastqIn --outSAMtype SAM --quantMode GeneCounts  --runThreadN 12 --readFilesCommand zcat --outFilterMismatchNmax 14 --outFileNamePrefix "$alignmentDir""$outFileNamePrefix"_ --outReadsUnmapped Fastx;
#done

