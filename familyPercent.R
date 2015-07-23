# Finding the percentages of the reads to normalize the data before apply PCA
# creates a new dataframe for family1 minus the id column
family1.num <- family1[,-1]
# find row sums 
rowSums(family1.num)
# finds the percentages of row sums for entire table
# to find for individual rows, add the family1.num[row#,]/rowSums(family1.num[row#,])*100
rowsumFamily <- family1.num/rowSums(family1.num)*100
rowsumFamily
# combines the id column and the test table
cbind(family1[,1], rowsumFamily)
familyPercent <- cbind(family1[,1], rowsumFamily)

# renaming the id column name following the structure: colnames(dataframe)[column #] <- "new name"
colnames(familyPercent)[1] <- "id"

#linear model
fit <- lm(familyPercent[1,], familyPercent[2,])
summary(fit)
#plot regression against columns
plot(familyPercent$fStreptococcaceae, familyPercent$fPrevotellaceae)

#draw a correlogram 
library(corrgram)
corrgram(familyPercent, upper.panel = panel.pts)
