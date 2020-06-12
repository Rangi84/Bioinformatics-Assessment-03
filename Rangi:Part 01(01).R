# Question 01-Question 05.

#Based on the file ("gene_expression.tsv"), which contains RNA-seq count data for two samples of interest.

download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part1_files/gene_expression.tsv", destfile ="gene_expression.tsv")

# Q1. Read in the file, making the gene accession numbers the row names. Show a table of values for the first six genes.

x <- read.table("gene_expression.tsv")
head(x)
str(x)
x <- read.table("gene_expression.tsv", header = TRUE , stringsAsFactors = FALSE , row.names = 1)
head(x)
str(x)

# Q2 Make a new column which is the mean of the other columns. Show a table of values for the first six genes.

x$meancol <- rowMeans(x)
head(x)

# Q3 List the 10 genes with the highest mean expression

x [order(-x$meancol),]
x[1:10,]

# Q4 Determine the number of genes with a mean < 10.

subset(x, meancol<10)
nrow(subset(x,meancol<10))

# Q5 Make a histogram plot of the mean values in png format and paste it into your report.

range(x$meancol)
hist(x$meancol, xlab= "Mean Value", main = "Hostogram of Mean Values", col = "red", breaks = 50,xlim=c(0,10000))

# Saving histogram plot as a pdf file by giving name for the file as 

pdf("assessment 03-Histogram.pdf")
hist(x$meancol)

# To save the file
dev.off() 
