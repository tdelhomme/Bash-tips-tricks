#!/bin/bash

# usage: ./script_dwn_to_bam.sh mylistofSRRids.txt

if [ $# -ne 2 ]
  then

    echo "ERROR:  Please provide both the list of SRR file and output folder, e.g. ./script_dwn_to_bam.sh mylistofSRRids.txt BAM_1"
    exit 1
fi

SRR=$1

mkdir -p $2

while IFS= read -r line
  do
    echo $(date) "-- Starting processing:" $line
    /home/tdelhomme/Documents/Softs/sratoolkit.2.10.3-centos_linux64/bin/sam-dump ${line} | samtools view -bS - > $2/${line}.bam
    echo $(date) "-- Finishing processing:" $line
done < $SRR
