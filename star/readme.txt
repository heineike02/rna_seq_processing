Procedure to process RNA seq data using STAR aligner. 

1) Obtain the data

sftp from the cat server using instructions that come in the e.mail
A) Navigate to the place on our server where you want the data to go (I started by putting it in scratch) and then create a directory with the same name as the directory you want to move from the cat server. Make sure you have write access to that directory. 

B) Once you sftp into the cat from the directory that holds the directory you want to have data (that you just created), use;

get -r <directory>

you can navigate to the directory on the server to make it easier. 


I moved mine to the following places: 
A) The lab server.  
From there back it up to 1TB hard drive and desktop computer (transfer over samba) 

B) The GPU cluster. 
This is where the data will be processed.  May need to move the data after processing

rsync -zaP elsamad:/data/Scratch/Ben/BMHHES01

dest folder: 

~/rna_seq_data/<exp_name>

Use md5sum to verify data was moved in one piece. 


2) Ensure you have a genome directory set up for your experiment.  

[only has to be done once for a species]

For kluyveromyces lactis the GTF File was from here: http://fungi.ensembl.org/Kluyveromyces_lactis/Info/Index
[note: an updated GFF3 file is available]

The S.Cer Genome is from ?????

If you want to add additional transcripts to the GTF file, use the format prescribed for the file and add to the bottom so you can find it easily.  Make sure to use the correct name for the chromosome. 
You need to have it listed as an exon in order to be processed by STAR [do you need to have it listed as a transcript?]

3) Run STAR aligner

This is done with a python routine corresponding to the data in rna_seq_processing

~/github/rna_seq_processing/<exp_name>_alignment.py

which calls a shell script

~/github/rna_seq_processing/<exp_name>_star.sh


4) Process data using DESEQ to get estimated log fold change and generalized expression. 

Use the script ~/github/expression_broad_data/scripts/<exp_name>_data_processing.ipynb to make a metadata file and prep data for Rstudio

Use the rstudio notebook to apply deseq2 to the data ~/github/expression_broad_data/scripts/<exp_name>_deseq2.Rmd

go back to the data processing script to produce processed data for future analysis

