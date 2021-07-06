#!/bin/bash
#PBS -N bulk_rnaseq
#PBS -l walltime=12:00:00
#PBS -l select=1:ncpus=8:mem=64gb
#PBS -m ea

module load star/2.7.1a
module load python

python /rds/general/user/bheineik/home/github/rna_seq_processing/star/20210421_pombe_align_all.py

bash /rds/general/user/bheineik/home/github/rna_seq_processing/star/20210421_pombe_commands.txt