#!/bin/bash

#SBATCH --job-name=featureCounts
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=16G
#SBATCH --time=24:00:00
#SBATCH --partition=basic
#SBATCH --output=/lisc/scratch/course/2023w300106/tillmann/featureCounts.log
#SBATCH --error=/lisc/scratch/course/2023w300106/tillmann/featureCounts.err
#SBATCH --mail-type=END
#SBATCH --mail-user=a00545087@unet.univie.ac.at

##Load Module
module load subread
module list

### SETTING UP DIRECTORIES
# cd into my own directory

cd /lisc/scratch/course/2023w300106/tillmann
mkdir ex8
cd ex8

###featureCounts command
featureCounts -Q 20 --primary -s 2 -p --countReadPairs -T 16 -a /lisc/scratch/course/2023w300106/jmontenegro/ex2/annotation/tmp.gtf -o counts.tsv /lisc/scratch/course/2023w300106/tillmann/ex6/SRR24348397_aftertrimAligned.sortedByCoord.out.bam


 