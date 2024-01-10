#!/bin/bash

#SBATCH --job-name=stringtie
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=8G
#SBATCH --time=2:00:00
#SBATCH --partition=basic
#SBATCH --output=/lisc/scratch/course/2023w300106/tillmann/stringtie.log
#SBATCH --error=/lisc/scratch/course/2023w300106/tillmann/stringtie.err
#SBATCH --mail-type=END
#SBATCH --mail-user=a00545087@unet.univie.ac.at


###Stringtie command
##Load Module
module load stringtie
module list

### SETTING UP DIRECTORIES
# cd into my own directory

cd /lisc/scratch/course/2023w300106/tillmann
mkdir ex7
cd ex7

###STRINGTIE command
stringtie /scratch/course/2023w300106/BAMS/*.bam -l NemVecV1.gtf -o NemAnnotation.gtf -p 6 -u

