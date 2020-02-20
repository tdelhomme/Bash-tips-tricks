# Bash-tips-tricks
Tips and tricks (mainly for comp. gen.) in the Bash language

* [SRA_download_bam.sh](https://github.com/tdelhomme/Bash-tips-tricks/blob/master/scripts/SRA_download_bam.sh): script to download BAM files from SRA
  * input1: the txt file containing in rows the SRRXXXXX identifiers of the runs to download
  * input2: output folder
  * command line example: `./script_dwn_to_bam.sh SraAccList_SRP041470.txt BAM_SRP041470`
  * with
  ```
  [tdelhomme@fsupeksvr SRA]$ head SraAccList_SRP041470.txt
SRR1264612
SRR1264613
SRR1264614
SRR1264615
SRR1264616
SRR1264617
SRR1264618
SRR1264619
SRR1264620
SRR1264621
  ```
