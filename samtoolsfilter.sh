#!/bin/bash

#SBATCH --job-name=samtoolsfilter
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=8G
#SBATCH --time=2:00:00
#SBATCH --partition=basic
#SBATCH --output=/lisc/scratch/course/2023w300106/tillmann/samtoolsfilter.log
#SBATCH --error=/lisc/scratch/course/2023w300106/tillmann/samtoolsfilter.err
#SBATCH --mail-type=END
#SBATCH --mail-user=a00545087@unet.univie.ac.at

###samtools view command
##Load Module
module load samtools
module list
###EXECUTION
samtools view -b -o /scratch/course/2023w300106/BAMS/SRR24348397.f.bam -q 20 -f 0x2 -F 0x4 -@ 8 /lisc/scratch/course/2023w300106/tillmann/ex4
