#!/bin/bash

#SBATCH --job-name=emapper
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=10G
#SBATCH --time=24:00:00
#SBATCH --partition=basic
#SBATCH --output=/lisc/scratch/course/2023w300106/tillmann/emapper.log
#SBATCH --error=/lisc/scratch/course/2023w300106/tillmann/emapper.err
#SBATCH --mail-type=END
#SBATCH --mail-user=a00545087@unet.univie.ac.at

### ENVIRONMENT
module load conda
module list
conda activate eggnog-mapper-2.1.12

### SETTING UP DIRECTORIES
# cd into my own directory
cd /lisc/scratch/course/2023w300106/tillmann/ex10

### RUNNING THE COMMAND
emapper.py -i /lisc/scratch/course/2023w300106/tillmann/ex4/proteinTransdecoder.fasta --cpu 16 --itype proteins --data_dir /lisc/scratch/mirror/eggnog-mapper/2.1.12/ -m diamond --pident 60 --query_cover 60 --subject_cover 70 --tax_scope 'eukaryota_broad' --override --output jaNemVect_emapper --temp_dir ${TMPDIR} --decorate_gff jaNemVect_emapper.dec.gff