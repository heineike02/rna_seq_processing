import os

base_dir = '/rds/general/user/bheineik/home/'

genomeDir= base_dir + 'genomes/pombe_20201008_star'

fastqbase = base_dir + 'rna_seq_data/20210315_pombe_ox_bulk/Unaligned/'

outfilebase = base_dir + 'rna_seq_data/20210315_pombe_ox_bulk/mapped/'

readFilesCommand= 'zcat'  #Use to decompress fastq.gz files
   
outReadsUnmapped = 'Fastx'
    
outMultimapperOrder = 'Random' #Random order of alignments for multimappers.  Default for future releases. 
    
#outSJfilterIntronMaxVsReadN 1200 - I don't think this is needed if we use align intron max
    
alignIntronMax = '1200'   #Requires introns to be less than 1200bp
    
alignMatesGapMax = '1700'  #Requires mated pairs to be no longer than 1700bp.  This is set as the max intron size + 500, which should be the max size of any read in the library.  
   
quantMode= 'GeneCounts' 

runThreadN = '8'


files = os.listdir('/rds/general/user/bheineik/home/rna_seq_data/20210315_pombe_ox_bulk/Unaligned/')

files.sort()

reads = []
read_files = []

commands_fname = ('/rds/general/user/bheineik/home/github/rna_seq_processing/star/20210421_pombe_commands.txt')

with open(commands_fname,'w') as f: 
    for jj,file in enumerate(files): 
        strain_time_cond = '_'.join(file.split('_')[1:4])
        read= file.split('_')[5]
        reads.append(read)
        read_files.append(file)
        if reads == ['R1', 'R2']: 
            #print(strain_time_cond)
            outfiledir = outfilebase + strain_time_cond
            f.write('mkdir ' + outfiledir + '\n')
            outFileNamePrefix = outfiledir + '/' + strain_time_cond + '_'
            #print(read_files)

            star_command = ['STAR', '--runThreadN', runThreadN,
                            '--genomeDir', genomeDir,
                            '--readFilesIn', fastqbase + read_files[0], fastqbase + read_files[1],
                            '--readFilesCommand', 'zcat',
                            '--outFileNamePrefix', outFileNamePrefix, 
                            '--outReadsUnmapped', outReadsUnmapped,
                            '--outMultimapperOrder', outMultimapperOrder, 
                            '--alignIntronMax', alignIntronMax, 
                            '--alignMatesGapMax', alignMatesGapMax, 
                            '--quantMode', quantMode
                           ]
            
            f.write(' '.join(star_command) + '\n')
            f.write("echo '" + strain_time_cond + " complete '\n" )
            reads = []
            read_files = []

# genomeDir=/rds/general/user/bheineik/home/genomes/pombe_20201008_star

# genomeFastaFiles=/rds/general/user/bheineik/home/genomes/pombe_20201008/Schizosaccharomyces_pombe_all_chromosomes_20201008_bare.fa

# sjdbGTFfile=/rds/general/user/bheineik/home/genomes/pombe_20201008/Schizosaccharomyces_pombe_all_chromosomes_20201008_cellranger_exon.gtf





# genomeDir=/rds/general/user/bheineik/home/genomes/pombe_20201008_star

# fastqIn_R1=/rds/general/user/bheineik/home/rna_seq_data/20210315_pombe_ox_bulk/Unaligned/BMH_WT_20_cont_S18_R1_001.fastq.gz
# fastqIn_R2=/rds/general/user/bheineik/home/rna_seq_data/20210315_pombe_ox_bulk/Unaligned/BMH_WT_20_cont_S18_R1_001.fastq.gz

# mkdir WT_20_cont

# outFileNamePrefix=/rds/general/user/bheineik/home/rna_seq_data/20210315_pombe_ox_bulk/mapped/WT_20_cont/WT_20_cont_

# #readFilesCommand zcat - to uncompress .gz files.  

# #outMultimapperOrder Random:  Random order of alignments for multimappers.  Default for future releases. 










