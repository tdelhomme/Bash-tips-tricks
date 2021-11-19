# Bash-tips-tricks
Tips and tricks (mainly for comp. gen.) in the Bash language

* [SRA_download_bam.sh](https://github.com/tdelhomme/Bash-tips-tricks/blob/master/scripts/SRA_download_bam.sh): script to download BAM files from SRA (CAUTION: this suppose that the query data in SRA contains `aligned` reads)
  * input1: the txt file containing in rows the SRRXXXXX identifiers of the runs to download
  * input2: output folder
  * command line example: `./script_dwn_to_bam.sh SraAccList_SRP041470.txt BAM_SRP041470`

Example of input list file:
```
[tdelhomme@fsupeksvr SRA]$ head -n3 SraAccList_SRP041470.txt
SRR1264612
SRR1264613
SRR1264614
```
This page gives information about how to download dbGaP data using sratoolkit: [link](https://www.ncbi.nlm.nih.gov/sra/docs/sra-dbgap-download/)  
Note: to get the SRA accession list, we should use the **SRA Run selector** tool, available on the NCBI website

* Intersection of 2 files: `grep -Fxf "file1" "file2" > intersection
`
* Transfer remote files (whole folder) using **lftp** (e.g. from CNAG server)
```
 lftp -u username,'password' sftp://ftp.cnag.cat
 set ftp:ssl-allow false
 set ftp:passive-mode off
 set ssl:verify-certificate no
  
 mirror --verbose -c --verbose /PATH/TO/REMOTE/FOLDER /PATH/TO/LOCAL/FOLDER
```

* Compute mean coverage from a particular BAM file

One way is to use `samtools depth` that returns the depth at each sequenced position:
```
samtools depth  file.bam  |  awk '{sum+=$3} END { print "Average = ",sum/NR}'
```
But this is **extremely** time intensive for large BAM (like WGS). A better approach is to use `samtools idxstats`, which returns for each sequenced chromosome, the number of mapped reads. Then, with the combination of a second bash command that computes the estimated mean lenght of the reads, one can compute an approximation of the coverage in a few seconds:
```
```
