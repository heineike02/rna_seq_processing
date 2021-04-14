import subprocess 
import os
import pandas as pd

#metadata file copied from excel spreadsheet describing experiment. 
metadata = pd.read_table('/home/heineike/rna_seq_data/20170817_kl_sc_pka/metadata/20170817_klscpka_metadata.txt')

genomeDir_dict = {'KL': '/home/heineike/genomes/klac_20170819/genomeDir'}

for directory,subdirectories,files in os.walk("/home/heineike/rna_seq_data/20170817_kl_sc_pka/fastq/"):
    for file in files:
        print("processing " + file)
        fastqIn = directory + file
        label = file.split('_')[0]
        species = metadata[metadata["Label"]==int(label)]['Name'].values[0].split('_')[0]
        if species == 'KL': 
            genomeDir = genomeDir_dict[species]
            outFileNamePrefix = label
            alignmentDir = '/home/heineike/rna_seq_data/20170817_kl_sc_pka_rim15/'
            subprocess.check_call(["./20170817_klscpka_star.sh",fastqIn, genomeDir, outFileNamePrefix, alignmentDir])
        else: 
            print('SC File, moving on')
        
        print('\n')
        