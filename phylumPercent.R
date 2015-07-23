# Finding the percentages of the reads to normalize the data before apply PCA
# creates a new dataframe for phylum1 minus the id column
phylum1.num <- phylum1[,-1]
# find row sums 
rowSums(phylum1.num)
# finds the percentages of row sums for entire table
# to find for individual rows, add the phylum1.num[row#,]/rowSums(phylum1.num[row#,])*100
rowsumPhylum <- phylum1.num/rowSums(phylum1.num)*100
rowsumPhylum
# combines the id column and the test table
cbind(phylum1[,1], rowsumPhylum)
phylumPercent <- cbind(phylum1[,1], rowsumPhylum)

# renaming the id column name following the structure: colnames(dataframe)[column #] <- "new name"
colnames(phylumPercent)[1] <- "id"

#linear model
fit <- lm(phylumPercent[1,], phylumPercent[2,])
summary(fit)
#plot regression against columns
plot(phylumPercent$pFirmicutes, phylumPercent$pProteobacteria)


#draw a correlogram 
library(corrgram)
corrgram(phylumPercent, upper.panel = panel.pts)

