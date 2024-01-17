#!/bin/bash

#SBATCH --job-name=cellranger
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=20G
#SBATCH --time=24:00:00
#SBATCH --partition=basic
#SBATCH --output=/lisc/scratch/course/2023w300106/tillmann/cellranger.log
#SBATCH --error=/lisc/scratch/course/2023w300106/tillmann/cellranger.err
#SBATCH --mail-type=END
#SBATCH --mail-user=a00545087@unet.univie.ac.at

### ENVIRONMENT
module load cellranger
module list

### SETTING UP DIRECTORIES
# cd into my own directory
cd /lisc/scratch/course/2023w300106/tillmann/
mkdir ex11
cd ex11

### RUNNING THE COMMAND
cellranger count --id 12hr --transcriptome /lisc/scratch/course/2023w300106/tillmann/Nv2_wnt4_pcna_fluo/ --fastqs /lisc/scratch/course/2023w300106/12hr1/run1,/lisc/scratch/course/2023w300106/12hr1/run2,/lisc/scratch/course/2023w300106/12hr1/run3 --sample 89085 --nosecondary --localcores 16 


	