#!/bin/bash
#PBS -N bulk_rnaseq
#PBS -l walltime=12:00:00
#PBS -l select=1:ncpus=8:mem=64gb
#PBS -m ea

module load star/2.7.1a 

genomeDir=/rds/general/user/bheineik/home/genomes/pombe_20201008_star

genomeFastaFiles=/rds/general/user/bheineik/home/genomes/pombe_20201008/Schizosaccharomyces_pombe_all_chromosomes_20201008.fa  #could also try _bare.fa to remove the line breaks

sjdbGTFfile=/rds/general/user/bheineik/home/genomes/pombe_20201008/Schizosaccharomyces_pombe_all_chromosomes_20201008_cellranger.gtf
#Schizosaccharomyces_pombe_all_chromosomes_20201008.gff3
#Schizosaccharomyces_pombe_all_chromosomes_20201008_cellranger_exon.gtf


#Star aligner options: 
#runThreadN 8 = use this many threads on the server 
#runMode = genomeGenerate

#sjdbOverhang = 74.  matelength-1. We had 75bp reads.  Specifies the length of the genomic sequence around the annotated junction to be used in constructing the splice junctions database. Ideally, this length should be equal to the ReadLength-1, where ReadLength is the length of the reads. For instance, for Illumina 2x100b paired-end reads, the ideal value is 100-1=99. In case of reads of varying length, the ideal value is max(ReadLength)-1. In most cases, the default value of 100 will work as well as the ideal value. 

#Using defaults got the following warning, so adjusted genomeSAindexNbases to 10
#WARNING: --genomeSAindexNbases 14 is too large for the genome size=13893632, which may cause seg-fault at the mapping step. Re-run genome generation with recommended --genomeSAindexNbases 10	

#--sjdbGTFfeatureExon CDS

#If Using the standard pombase genome and gff3.  Therefore used: 
#--sjdbGTFtagExonParentTranscript Parent  per star manual and


STAR --runThreadN 8 --runMode genomeGenerate --genomeDir $genomeDir --genomeFastaFiles $genomeFastaFiles --sjdbGTFfile $sjdbGTFfile --sjdbGTFfeatureExon CDS --sjdbOverhang 74 --genomeSAindexNbases 10
