import subprocess 
import os
import pandas as pd

base_dir = '/home/heineike/genomes/klac_20170819/'
#make sure to create the genome directory before running this
genomeDir = base_dir + 'genomeDir'
genomeFastaFiles = base_dir + 'KL_genome/Kluyveromyces_lactis.ASM251v1.dna.toplevel.fa'
sjdbGTFfile = base_dir + 'KL_GTF/Kluyveromyces_lactis.ASM251v1.32_custom.gtf'

subprocess.check_call(["./20180321_create_genome.sh", genomeDir, genomeFastaFiles, sjdbGTFfile])