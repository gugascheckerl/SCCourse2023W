#!/bin/bash

#SBATCH --job-name=trimmomatic
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=4G
#SBATCH --time=10:00:00
#SBATCH --partition=basic
#SBATCH --output=/lisc/scratch/course/2023w300106/tillmann/trimmomatic.log
#SBATCH --error=/lisc/scratch/course/2023w300106/tillmann/trimmomatic.err
#SBATCH --mail-type=END
#SBATCH --mail-user=a00545087@unet.univie.ac.at

###creat directory for trimmed data
module load trimmomatic/0.39
module list

###Run command
mkdir /lisc/scratch/course/2023w300106/tillmann/ex3/SRR24348397/trim
cd /lisc/scratch/course/2023w300106/tillmann/ex3/SRR24348397/trim

trimmomatic PE -threads 8 -phred 33 -trimlog trimmomatic.log -summary trim.summary.txt /lisc/scratch/course/2023w300106/tillmann/ex3/SRR24348397/SRR24348397_1.fastq /lisc/scratch/course/2023w300106/tillmann/ex3/SRR24348397/SRR24348397_2.fastq
/lisc/scratch/course/2023w300106/tillmann/ex3/SRR24348397/trim/SRR24348397_R1.qc.fastq
/lisc/scratch/course/2023w300106/tillmann/ex3/SRR24348397/trim/SRR24348397_S1.qc.fastq
/lisc/scratch/course/2023w300106/tillmann/ex3/SRR24348397/trim/SRR24348397_R2.qc.fastq
/lisc/scratch/course/2023w300106/tillmann/ex3/SRR24348397/trim/SRR24348397_S2.qc.fastq

ILLUMINACLIP:/lisc/scratch/course/2023w300106/tillmann/adapters.fa:2:30:10
SLIDINGWINDOW:6:15
MINLEN:75

