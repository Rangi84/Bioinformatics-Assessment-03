
# Question 06 - Question 10

download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part1_files/growth_data.csv",destfile ="growth_data.csv")

# Q6.Import this csv file into an R object. What are the column names?

y<-read.csv("growth_data.csv", header=TRUE,stringsAsFactors = FALSE)
head(y)
str(y)
colnames(y)
ncol(y)

# Q7.Calculate the mean and standard deviation of tree circumference at the start and end of the study at both sites.


ne <- subset(y, Site=="northeast")
head(ne)
tail(ne)
sw <- subset(y, Site =="southwest")
head(sw)
tail(sw)

## Calculation of the mean & standerad deviation (sd) of tree circumference at the start (2004) and end (2019) of the Northeast (ne) site.

mean(ne$Circumf_2004_cm)
mean(ne$Circumf_2019_cm)

sd(ne$Circumf_2004_cm)
sd(ne$Circumf_2014_cm)

## Calculation of the mean & standerad deviation (sd) of tree circumference at the start (2004) and end (2019) of the Southwest (sw) site.
mean(sw$Circumf_2004_cm)
mean(sw$Circumf_2019_cm)

sd(sw$Circumf_2004_cm)
sd(sw$Circumf_2014_cm)

# Q8.Make a box plot of tree circumference at the start and end  of the study at both sites.

ne <- subset(y, Site=="northeast")
sw <- subset(y, Site =="southwest")
boxplot(ne$Circumf_2004_cm,ne$Circumf_2019_cm,sw$Circumf_2004_cm,sw$Circumf_2019_cm, names= c("ne2004","ne2019","sw2004","sw2019"), ylab = "Circumference(cm)", main="Growth in two Plantation Sites")


pdf("assessment 03-boxplot.pdf")
boxplot(ne$Circumf_2004_cm,ne$Circumf_2019_cm,sw$Circumf_2004_cm,sw$Circumf_2019_cm)

# To save the file
dev.off()
# Q9. Calculate the mean growth over the past 10 years at each site.

## TO calculate the....
ne$meangrowth <-ne$Circumf_2019_cm-ne$Circumf_2009_cm
head(ne)

sw$meangrowth <-sw$Circumf_2019_cm-sw$Circumf_2009_cm
sw
head(sw)

# Q10. Use the t.test and wilcox.test funtions to estimate the p-value that the 10 year growth is different at the two sites.

## T-test
t.test(sw$meangrowth,ne$meangrowth)

## Wilcox.test

wilcox.test(sw$meangrowth,ne$meangrowth) 

