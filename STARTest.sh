#!/bin/bash
#SBASH --name=starTest
#SBASH --nodes=1
#SBASH --cpus-per-task=16
#SBASH --mem=4G
#SBASH --time=10:00:00
#SBASH --partition=basic
#SBASH --output=/lisc/scratch/course/2023w300106/tillmann/star.log
#SBASH --error=/lisc/scratch/course/2023w300106/tillmann/star.err
#SBASH --mail-type=END
#SBASH --mail-user=a00545087@unet.univie.ac.at
module load star
module list

cd /lisc/scratch/course/2023w300106/tillmann
mkdir ex5
cd ex4

STAR --runThreadN 16 --genomeDir /lisc/scratch/course/2023w300106/tillmann/ex4/ncbi_dataset/data/GCF_932526225.1/jaNemVect1.1_STAR readFilesIn /lisc/scratch/course/2023w300106/tillmann/ex3/SRR24348397/SRR24348397_1.fastq /lisc/scratch/course/2023w300106/tillmann/ex3/SRR24348397/SRR24348397_2.fastq --outSAMtype BAM SortedbyCoordinate --twopassMode Basic --outSAMstrandFile intronMotif --outFileNamePrefix SRR24348397

