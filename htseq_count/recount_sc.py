import os
import sys

resource_dir = "/home/heineike/genomes/scer_20181114/"
annotation = "saccharomyces_cerevisiae_R64-2-1_20150113_UTRs.gff"

processed_data_dir = os.path.normpath("/home/heineike/rna_seq_data/20181024_KL_SC_PKA_Msn24_Rph1Gis1/dual_index/BMH_HES_02/processed_data/")
samples = os.listdir(processed_data_dir)

for sample in samples: 
    sample_spec = sample.split('_')[0]
    sample_no = sample.split('_')[1]
    if (sample_spec=='SC') and (sample_no != '01'):
        bam_dir = processed_data_dir + os.sep + sample + os.path.normpath("/star_out/B" + sample_no + "_S" + str(int(sample_no)) +"_L001_R1_001.fastq.gz") + os.sep
        bam = bam_dir + 'starAligned.sortedByCoord.out.bam'
        htseq_count_cmd = 'htseq-count -t gene -i ID -m intersection-nonempty -s yes -f bam -r pos ' + bam + ' ' + \
                          resource_dir + annotation+ ' > ' + bam_dir + '/read_counts_UTR.txt'
        os.system(htseq_count_cmd)

#htseq-count -t gene -i ID -m intersection-nonempty -s yes -f bam -r pos $bam $resource_dir$annotation > $bam_dir/read_coun    ts_UTR.txt