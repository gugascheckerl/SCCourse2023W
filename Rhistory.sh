###Where is my working directory
getwd()
###Set my working directory to: 
setwd("/scratch/course/2023w300106/tillmann/")
###simple calculation
15+15
###Make a vektor: vektor1: name 5: content
vector1 <-5
###vector + number
vector1 +100
###vector content changed to a text
vector1 <- class
### make a vector with more than 1 number
vector1 <- c(1,2,3,4,5,6,7,8,9,10)
### if you add a number, it adds it to all the vector numbers
vector1 +2
###or multiplies all of them
vector1 *2
###or calculates the median of all of them
median(vector1)
###oder alle hoch 2
vector1 ^2
###oder das kleinste von den Werten
min(vector1)
###oder der größte Wert
max(vector1)
###plotte die Wert
boxplot(vector1
###mach einen neuen Vector namens accel, der alle werte von vector hoch 2 macht
accel <- vector ^ 2
###plott diese beiden Vectoren
plot(vector,accel)
###Vector accel ändern
accel <- vector1 ^ 2

#Get an overview of the summary file: 
###Lies die Tabelle
read.table("ex8/counts.tsv.summary")
### mach einen Vektor mit Namen summary, aus der Datei counts.tsv.summary, deren Spalten mit Tab getrennt sind,Kommentare beginnen mit # und die erste Reihe sind Column names 
summary <- read.table("ex8/counts.tsv.summary", sep="\t", comment.char= "#", , col.names = 1)
### View summary
View(summary)
### plus there is a header
summary <- read.table("ex8/counts.tsv.summary", sep="\t", comment.char= "#", header=TRUE)
####show me the names of the columns
names(summary)
###load the tidyverse library
library(tidyverse)
###Give me summary (row, )
summary[1,]
###Give me summary (row1, column 5 to 10)
summary[1,5:10]
###Give me mean of summary row1, column 2 to 12 > doesn´t work
mean(summary[1,2:12])
###needs to be "unlisted"
mean(unlist(summary[1,2:12]))
###rowSums from summary and use all rows, Column 2 to 12
rowSums(summary[, 2:12])
###How many reads in total do we have in each library
colSums(summary[, 2:12])
###Normalisation of dataset to 10 mio reads per library (CPM=Counts per Million) > didn´t work
scaledCPM <- summary[, 2:12]/colSums(summary[, 2:12]) *10000000
##Different way: 
###load library edgeR
library(edgeR)
###Make a matrix varibel called scaledCPM from summary and use all rows but just columns 2.12
scaledCPM <- cpm(summary[, 2:12])
###Make a boxplot for the first row "assigned reads"
boxplot(scaledCPM[1, ])
###Make a boxplot for the 12 th row "unnassigned no features"
boxplot(scaledCPM[12, ])
###Make a boxplot for the 14 th row "unnassigned ambiguity"
boxplot(scaledCPM[14, ])
### "module list"
sessionInfo()
###create a variable called rownames, attached to scaledCPM from the first Column of summary (add a column)
rownames(scaledCPM) <- unlist(summary[,1])
###Load library reshape 2
library(reshape2)
###Make a variable called scaledCPMMelt by melting scaled CPM (melting reshapes the table in order to be used by ggplott) and only use row that have sums larger then 0
scaledCPMMelt <- melt(scaledCPM[rowSums(scaledCPM)>0, ])
###look at scaledCPMMelt
scaledCPMMelt
###show me the dimensions of scaledCPMMelt
dim(scaledCPMMelt)
###Plot scaledCPMMelt, plot Var1on x and value on y, with boxplots and flip the axis
ggplot(scaledCPMMelt, aes(x=Var1, y=value))+ geom_boxplot()
###or same with violin
ggplot(scaledCPMMelt, aes(x=Var1, y=value))+ geom_violin()
### or the same with jitter
ggplot(scaledCPMMelt, aes(x=Var1, y=value))+ geom_jitter()
###or add a colour difference to different variable1 
ggplot(scaledCPMMelt, aes(x=Var1, y=value, col=Var1))+ geom_jitter()
###or use a distinct colour scheme (viridis)
ggplot(scaledCPMMelt, aes(x=Var1, y=value, col=Var1))+ geom_boxplot()+scale_colour_viridis_d()
### add theme_bw to make the background white, add angle90 to turn the text on the x-axis by 90 degrees, labels (lab) of y axis is going to be Number of reads, and the column names are called category
ggplot(scaledCPMMelt, aes(x=Var1, y=value, col=Var1))+ theme_bw()+ geom_boxplot()+scale_colour_viridis_d() +theme(axis.text.x = element_text(angle=90))+ labs(x="",y="Number of reads (CPM)", col="Category")

#Principle component Analysis Preparation
##loading data and normalizing
###
counts <- read.table("counts.tsv", comment="#")
###RPK: Normalizing for gene length of 1000 bp
rpk <- counts[,3:13] /unlist(counts[,2]*1000)
###tpm: transkripts per million
tpm <- cpm(rpk)
###adding rownames to tpm
rownames(tpm) <- unlist(counts[,1])
###melt again to reshape table
melNorm <- melt(tpm)
###look at the head
head(melNorm)
###plot melNorm most things see above, scale is normalizing, you can put violin and boxplot in the sam graph, set width of box 0.2, leave the x axis without a title
ggplot(melNorm,aes(x=Var2, y=value, col=Var2))  + scale_y_log10() + geom_violin(aes(x=Var2, y=value, col=Var2))+ geom_boxplot(width=0.2)+theme_bw()+labs(y="Read counts per gene (TPM)", x="", col="library")+theme(axis.text.x = element_blank())

##Filtering with tidyverse
### Filter in the Library tidyverse with melNorm in dplyr for only values greater than 1 and group by variable 1, either with boxplot
melNorm %>% dplyr::filter(value>=1) %>% group_by(Var1) %>% summarize(count=n()) %>% ggplot(aes (x=count)) + geom_boxplot()
###or violin
melNorm %>% dplyr::filter(value>=1) %>% group_by(Var1) %>% summarize(count=n()) %>% ggplot(aes (y=count, x=1)) + geom_violin()
###or density
melNorm %>% dplyr::filter(value<=1) %>% ggplot(aes(x=value, col=Var2))+geom_density() +scale_y_log10()+scale_x_log10()
melNorm %>% dplyr::filter(value>=1) %>% ggplot(aes(x=value, col=Var2))+geom_density() +scale_y_log10()+scale_x_log10()

###suche aus einer Tabelle alle ZEilen die in der Spalte category das wort Percentage aufweisen und plotte den Wert Value auf y und die Reference auf x für jede Category einzeln
> mergedStat %>% dplyr::filter(grepl("Percentage", category)) %>% ggplot (aes(x=reference, y=value)) + facet_grid(~category)+ geom_boxplot()
###plus scales free_y : mach die range von der x-Achse unabhängig; col=reference: Die references bekommen verschiedenen Farben
mergedStat %>% dplyr::filter(grepl("Percentage", category)) %>% ggplot (aes(x=reference, y=value)) + facet_grid(~category, scales = "free_y")+ geom_boxplot(aes(col=reference))+ theme_bw()

###prcomp Principal Components Analysis Performs a principal components analysis on the given data matrix and returns the results as an object of class prcomp.
ggplot(as.data.frame(pcaRes$x), aes(x=PC1, y=PC2))+ geom_point(aes(col=rownames(pcaRes$x)))+ geom_label_repel(aes(label=rowname(pcaRes$x)))+ scale_color_futurama()+theme_bw()
