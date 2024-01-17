#!/bin/bash

#SBATCH --job-name=interproscan
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=10G
#SBATCH --time=24:00:00
#SBATCH --partition=basic
#SBATCH --output=/lisc/scratch/course/2023w300106/tillmann/interproscan.log
#SBATCH --error=/lisc/scratch/course/2023w300106/tillmann/interproscan.err
#SBATCH --mail-type=END
#SBATCH --mail-user=a00545087@unet.univie.ac.at

### ENVIRONMENT
module load interproscan/5.65-97.0-11.0.4
module list

### SETTING UP DIRECTORIES
# cd into my own directory
cd /lisc/scratch/course/2023w300106/tillmann/ex10


### RUNNING THE COMMAND
interproscan.sh -b NemVec.function -cpu 16 -etra -f TSV,GFF3 -goterms -i /lisc/scratch/course/2023w300106/tillmann/ex4/proteinTransdecoder.fasta -iprlookup -pa -t p



