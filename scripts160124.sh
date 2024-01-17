module load gffread
module list
###gffread command

Extract the transcripts
gffread -g /lisc/scratch/course/2023w300106/tillmann/ex4/ncbi_dataset/data/GCF_932526225.1/GCF_932526225.1_jaNemVect1.1_genomic.fna -w transcripts.fasta /lisc/scratch/course/2023w300106/jmontenegro/ex2/annotation/genomic.gff

module load transdecoder
module list

###Finding CDS in the RNA transcripts, predict all long ORF in each transcript
TransDecoder.LongOrfs -t /lisc/scratch/course/2023w300106/tillmann/ex4/transcripts.fasta -S -O jaNemVec.transdecoder --complete_orfs_only

###TransDecoder.Predict select the best protein in each transcript 

TransDecoder.Predict -t /lisc/scratch/course/2023w300106/tillmann/ex4/transcripts.fasta --single_best_only -O jaNemVec.transdecoder 



sed -e 's/\.p[0-9]\+ / /' -e 's/*//' transcripts.fasta.transdecoder.pep > ../proteinTransdecoder.fasta

module load interproscan.sh
module list

interproscan.sh -b NemVec.function -cpu 16 -etra -f TSV,GFF3 -goterms -i /lisc/scratch/course/2023w300106/tillmann/ex4/proteinTransdecoder.fasta -iprlookup -pa -t p

module load conda
conda info --envs
conda activate eggnog-mapper-2.1.12
emapper.py --help


