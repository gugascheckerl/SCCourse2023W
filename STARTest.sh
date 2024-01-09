#!/bin/bash

#SBATCH --job-name=starTest
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=16G
#SBATCH --time=10:00:00
#SBATCH --partition=basic
#SBATCH --output=/lisc/scratch/course/2023w300106/tillmann/star.log
#SBATCH --error=/lisc/scratch/course/2023w300106/tillmann/star.err
#SBATCH --mail-type=END
#SBATCH --mail-user=a00545087@unet.univie.ac.at

### ENVIRONMENT
module load star
module list

### SETTING UP DIRECTORIES
# cd into my own directory
cd /lisc/scratch/course/2023w300106/tillmann
mkdir ex5
cd ex4

### RUNNING THE COMMAND
STAR --runThreadN 16 --genomeDir /lisc/scratch/course/2023w300106/jmontenegro/ex2/ncbi_dataset/data/GCF_932526225.1/jaNemVect1.1_STAR --readFilesIn /lisc/scratch/course/2023w300106/tillmann/ex3/SRR24348397/SRR24348397_1.fastq /lisc/scratch/course/2023w300106/tillmann/ex3/SRR24348397/SRR24348397_2.fastq --outSAMtype BAM SortedByCoordinate --twopassMode Basic --outSAMstrandField intronMotif --outFileNamePrefix SRR24348397



