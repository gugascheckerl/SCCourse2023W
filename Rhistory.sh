getwd()
setwd("/scratch/course/2023w300106/tillmann/")
getwd()
15+15
vector1 <-5
vector1 +100
vector1 <- class
vector1 <- c(1,2,3,4,5,6,7,8,9,10)
vector1 +2
vector1 *2
median(vector1)
vector1 ^2
min(vector1)
max(vector1)
boxplot(vector1)
accel <- vector ^ 2
plot(vector,accel)
accel <- vector1 ^ 2
plot(vector,accel)
plot(vector1, accel)
read.table("ex8/counts.tsv.summary")
summary <- read.table("ex8/counts.tsv.summary", sep="\t", comment.char= "#", , col.names = 1)
summary <- read.table("ex8/counts.tsv.summary", sep="\t", comment.char= "#")
View(summary)
summary <- read.table("ex8/counts.tsv.summary", sep="\t", comment.char= "#", header=TRUE)
names(summary)
setwd()
setwd(scratch)
getwd
getwd()
setwd("/lisc/scratch/course/2023w300106/BAMS/)
setwd("/lisc/scratch/course/2023w300106/BAMS")
getwd()
summary <- read.table("counts.tsv.summary", sep="\t", comment.char= "#", header=TRUE)
summary
library(tidyverse)
summary <- read_tsv("counts.tsv.summary", comment = "#")
summary
summary[1,]
summary[1,5:10]
mean(summary[1,2:12])
mean(unlist(summary[1,2:12]))
rowSums(summary[, 2:12])
colSums(summary[, 2:12])
summary[, 2:12]/colSums(summary[, 2:12]) *10000000
scaledCPM <- summary[, 2:12]/colSums(summary[, 2:12]) *10000000
scaledCPM
library(edgeR)
cpm(summary[, 2:12])
cpm(summary[, 2:12])
scaledCPM <- cpm(summary[, 2:12])
boxplot(scaledCPM[1, ])
boxplot(scaledCPM[12, ])
boxplot(scaledCPM[14, ])
sessionInfo()
scaledCPM
rownames(scaledCPM) <- unlist(summary[,1])
scaled CPM
scaledCPM
library(reshape)
library(reshape2)
scaledCPMMelt <- melt(scaledCPM)
scaledCPMMelt
dim(scaledCPMMelt)
ggplot(scaledCPMMelt, aes(x=Var1, y=value))+ geom_boxplot
ggplot(scaledCPMMelt, aes(x=Var1, y=value))+ geom_boxplot()
ggplot(scaledCPMMelt, aes(x=Var1, y=value))+ geom_boxplot()+coord_flip
ggplot(scaledCPMMelt, aes(x=Var1, y=value))+ geom_boxplot()+coord_flip()
scaledCPMMelt <- melt(scaledCPM[rowSums(scaledCPM)>0, ])
scaledCPMMelt
ggplot(scaledCPMMelt, aes(x=Var1, y=value))+ geom_boxplot()+coord_flip()
ggplot(scaledCPMMelt, aes(x=Var1, y=value))+ geom_boxplot()
ggplot(scaledCPMMelt, aes(x=Var1, y=value))+ geom_violin()
ggplot(scaledCPMMelt, aes(x=Var1, y=value))+ geom_jitter()
ggplot(scaledCPMMelt, aes(x=Var1, y=value, col=Var1))+ geom_jitter()
ggplot(scaledCPMMelt, aes(x=Var1, y=value, col=Var1))+ geom_boxplot()+scale_colour_viridis_d()
ggplot(scaledCPMMelt, aes(x=Var1, y=value, col=Var1))+ geom_boxplot()+scale_colour_viridis_d() +theme(axis.text(angle=90))+ labs(x="", y="Number of reads (CPM)"),col="Category") + theme_bw()
ggplot(scaledCPMMelt, aes(x=Var1, y=value, col=Var1))+ theme_bw()+ geom_boxplot()+scale_colour_viridis_d() +theme(axis.text(angle=90))+ labs(x="",y="Number of reads (CPM)"), col="Category")
ggplot(scaledCPMMelt, aes(x=Var1, y=value, col=Var1))+ theme_bw()+ geom_boxplot()+scale_colour_viridis_d() +theme(axis.text(angle=90))+ labs(x="",y="Number of reads (CPM)") col="Category")
ggplot(scaledCPMMelt, aes(x=Var1, y=value, col=Var1))+ theme_bw()+ geom_boxplot()+scale_colour_viridis_d() +theme(axis.text(angle=90))+ labs(x="",y="Number of reads (CPM)", col="Category")
ggplot(scaledCPMMelt, aes(x=Var1, y=value, col=Var1))+ theme_bw()+ geom_boxplot()+scale_colour_viridis_d() +theme(axis.text.x = element_text(angle=90))+ labs(x="",y="Number of reads (CPM)", col="Category")
counts <- read.table("counts.tsv", comment="#")
counts
counts[, c(1,6:17)]
counts[, 3] / counts[, 2]+1000
counts[, 3] / counts[, 2]*1000
counts[,3] / counts[,2]*1000
counts[ ,3] / counts[ ,2]*1000
rpk <- apply(counts[ ,3:13], 2, funtion(x) x/counts[,2]*1000
rpk <- counts[, 3:13] / unlist(counts[,2]*1000)
rpk <- counts[,3:13] /unlist(counts[,2]*1000)
counts
counts
names(counts)
counts[1:5, 1:5]
counts <- read_tsv("counts.tsv", comment = "#")
counts
rpk <- counts[,3:13] /unlist(counts[,2])*1000
count
View(counts)
counts <- counts[,c(1,6:17)]
rpk <- counts[,3:13] /unlist(counts[,2])*1000
tpm <- [1:5,1:5]
tpm[1:5,1:5]
tpm <- cpm(rpk)
tpm[1:5,1:5]
savehistory("/lisc/scratch/course/2023w300106/tillmann/Rhistory.Rhistory")
rownames(tpm) <- unlist(counts[,1])
tpm[1:5,1:5]
melNorm <- melt(tpm)
head(melNorm)
ggplot(melNorm, aes(x=Var1, y=value))+ geom_boxplot
ggplot(melNorm, aes(x=Var1, y=value))+ geom_boxplot()
ggplot(melNorm, aes(x=Var1, y=value))+ geom_boxplot + scale_y_log10()
ggplot(melNorm, aes(x=Var1, y=value))+ geom_boxplot() + scale_y_log10()
ggplot(melNorm) + geom_boxplot()(aes(x=Var2, y=value, col=Var2)) + scale_y_log10()
ggplot(melNorm) + geom_boxplot(aes(x=Var2, y=value, col=Var2)) + scale_y_log10()
ggplot(melNorm) + geom_violin(aes(x=Var2, y=value, col=Var2)) + scale_y_log10()
savehistory("/lisc/scratch/course/2023w300106/tillmann/Rhistory.sh")
ggplot(melNorm) + geom_boxplot(aes(x=Var2, y=value, col=Var2)) + scale_y_log10() + geom_violin(aes(x=Var2, y=value, col=Var2))
ggplot(melNorm)  + scale_y_log10() + geom_violin(aes(x=Var2, y=value, col=Var2))+ geom_boxplot(aes(x=Var2, y=value, col=Var2))
ggplot(melNorm)  + scale_y_log10() + geom_violin(aes(x=Var2, y=value, col=Var2))+ geom_boxplot(aes(x=Var2, y=value, col=Var2))+theme_bw()
ggplot(melNorm)  + scale_y_log10() + geom_violin(aes(x=Var2, y=value, col=Var2))+ geom_boxplot(aes(x=Var2, y=value, col=Var2))+theme_bw()+labs(y="Read counts per gene (TPM)", x="", col="library")+theme(axis.text.x = element_blank())
ggplot(melNorm,aes(x=Var2, y=value, col=Var2))  + scale_y_log10() + geom_violin(aes(x=Var2, y=value, col=Var2))+ geom_boxplot(width=0.2)+theme_bw()+labs(y="Read counts per gene (TPM)", x="", col="library")+theme(axis.text.x = element_blank())
head(melNorm)
melNorm %>% group_by(Var2)%>% arrange(desc(value), .by_group = TRUE) %>% dplyr::filter(row_number()<=5)
melNorm %>% group_by(Var2)%>% arrange(desc(value), .by_group = TRUE) %>% dplyr::filter(row_number()<=5) %>% ungroup()%>% group_by(Var1) %>% summarize(count=n())
melNorm %>% group_by(Var2)%>% arrange(desc(value), .by_group = TRUE) %>% dplyr::filter(row_number()<=5) %>% ungroup()%>% group_by(Var1) %>% summarize(count=n())%>% arrange(desc())
melNorm %>% group_by(Var2)%>% arrange(desc(value), .by_group = TRUE) %>% dplyr::filter(row_number()<=5) %>% ungroup()%>% group_by(Var1) %>% summarize(count=n())%>% arrange(desc(count))
melNorm %>% dplyr::filter(value>=1) %>% dim()
dim(melNorm)
melNorm %>% dplyr::filter(value>=1) %>% group_by(Var1) %>% summarize(count=n())
melNorm %>% dplyr::filter(value>=1) %>% group_by(Var1) %>% summarize(count=n())%>% ggplot(aes)y=count, x=1)) + geom_histogram()
melNorm %>% dplyr::filter(value>=1) %>% group_by(Var1) %>% summarize(count=n()) %>% ggplot(aes (y=count, x=1)) + geom_histogram()
melNorm %>% dplyr::filter(value>=1) %>% group_by(Var1) %>% summarize(count=n()) %>% ggplot(aes (x=count)) + geom_histogram()
melNorm %>% dplyr::filter(value>=1) %>% group_by(Var1) %>% summarize(count=n()) %>% ggplot(aes (x=count)) + geom_boxplot()
melNorm %>% dplyr::filter(value>=1) %>% group_by(Var1) %>% summarize(count=n()) %>% ggplot(aes (x=count)) + geom_violin()
melNorm %>% dplyr::filter(value>=1) %>% group_by(Var1) %>% summarize(count=n()) %>% ggplot(aes (x=count)) + geom_boxplot()
melNorm %>% dplyr::filter(value>=1) %>% group_by(Var1) %>% summarize(count=n()) %>% ggplot(aes (y=count, x=1)) + geom_violin()
melNorm %>% dplyr::filter(value<=1) %>% ggplot(aes(x=value, col=Var2))+geom_density() +scale_y_log10()+scale_x_log10()
melNorm %>% dplyr::filter(value>=1) %>% ggplot(aes(x=value, col=Var2))+geom_density() +scale_y_log10()+scale_x_log10()
savehistory("/lisc/scratch/course/2023w300106/tillmann/Rhistory.sh")
