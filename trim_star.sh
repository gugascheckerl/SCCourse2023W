#!/bin/bash

#SBATCH --job-name=trim_star
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=10G
#SBATCH --time=2:00:00
#SBATCH --partition=basic
#SBATCH --output=/lisc/scratch/course/2023w300106/tillmann/trim_star.log
#SBATCH --error=/lisc/scratch/course/2023w300106/tillmann/trim_star.err
#SBATCH --mail-type=END
#SBATCH --mail-user=a00545087@unet.univie.ac.at

### ENVIRONMENT
module load star
module list

### SETTING UP DIRECTORIES
# cd into my own directory
cd /lisc/scratch/course/2023w300106/tillmann
mkdir ex6
cd ex6

### RUNNING THE COMMAND
STAR --runThreadN 16 --genomeDir /lisc/scratch/course/2023w300106/jmontenegro/ex2/ncbi_dataset/data/GCF_932526225.1/jaNemVect1.1_STAR --readFilesIn /lisc/scratch/course/2023w300106/tillmann/ex3/SRR24348397/trim/SRR24348397_R1.qc.fastq /lisc/scratch/course/2023w300106/tillmann/ex3/SRR24348397/trim/SRR24348397_R2.qc.fastq --outSAMtype BAM SortedByCoordinate --twopassMode Basic --outSAMstrandField intronMotif --outFileNamePrefix SRR24348397_aftertrim



