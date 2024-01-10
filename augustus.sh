#!/bin/bash

#SBATCH --job-name=augustus
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=16G
#SBATCH --time=24:00:00
#SBATCH --partition=basic
#SBATCH --output=/lisc/scratch/course/2023w300106/tillmann/augustus.log
#SBATCH --error=/lisc/scratch/course/2023w300106/tillmann/augustus.err
#SBATCH --mail-type=END
#SBATCH --mail-user=a00545087@unet.univie.ac.at

##Load Module
module load conda
module list

conda activate augustus-3.5.0

### SETTING UP DIRECTORIES
# cd into my own directory

cd /lisc/scratch/course/2023w300106/tillmann
mkdir ex8
cd ex8

###AUGUSTUS command
augustus --strand=both --genemodel=complete --gff3=on --UTR=off --outfile=nemVec_augustus.gff --species=nematostella_vectensis /lisc/scratch/course/2023w300106/tillmann/chr1.fasta
