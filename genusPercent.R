# Finding the percentages of the reads to normalize the data before apply PCA
# creates a new dataframe for genus1 minus the id column
genus1.num <- genus1[,-1]
# find row sums 
rowSums(genus1.num)
# finds the percentages of row sums for entire table
# to find for individual rows, add the genus1.num[row#,]/rowSums(genus1.num[row#,])*100
rowsumGenus <- genus1.num/rowSums(genus1.num)*100
rowsumGenus
# combines the id column and the test table
cbind(genus1[,1], rowsumGenus)
genusPercent <- cbind(genus1[,1], rowsumGenus)

# renaming the id column name following the structure: colnames(dataframe)[column #] <- "new name"
colnames(genusPercent)[1] <- "id"

#linear model
fit <- lm(genusPercent[1,], genusPercent[2,])
summary(fit)
#plot regression against columns
plot(genusPercent$gStreptococcus, genusPercent$gPrevotella)

#draw a correlogram 
library(corrgram)
corrgram(genusPercent, upper.panel = panel.pts)
