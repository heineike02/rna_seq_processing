import os

#Move files to heslab server
#first copy to a single folder and then move that folder.  When I am back on the hes lab server I can move the files from that folder
#back out to out to where they are supposed to be

data_dir_gpu = os.path.normpath("/home/heineike/rna_seq_data/20181024_KL_SC_PKA_Msn24_Rph1Gis1/dual_index/BMH_HES_02/")
samples = os.listdir(data_dir_gpu + os.sep + "processed_data")

data_dir_hes = os.path.normpath("/data/Scratch/Ben/20181019_kl_sc_msn24_rph1gis1/dual_index/BMH_HES_02/")

spec = 'KL' #SC

for sample in samples: 
    sample_spec = sample.split('_')[0]
    sample_no = sample.split('_')[1]
    if (sample_spec==spec):
        UTR_file_ext = os.sep + "processed_data" + os.sep + sample + os.path.normpath("/star_out/B" + sample_no + "_S" + str(int(sample_no)) +"_L001_R1_001.fastq.gz/read_counts_UTR_400.txt")
        UTR_file_gpu = data_dir_gpu + UTR_file_ext
        UTR_dir_gpu = data_dir_gpu + os.sep + 'counts_UTR'
        
        cp_cmd = 'cp ' + UTR_file_gpu + ' ' + UTR_dir_gpu + os.sep + 'read_counts_UTR_400_' + sample + '.txt'
        
        os.system('echo ' + sample)  
        #os.system("echo '" + cp_cmd + "'")
        os.system(cp_cmd)
        

rsync_cmd = "rsync -azh " + UTR_dir_gpu + " -e 'ssh -p 40904' heineike@elsamad.ucsf.edu:" + data_dir_hes + os.sep
os.system("echo '" + rsync_cmd + "'")
os.system(rsync_cmd)
