# Finding the percentages of the reads to normalize the data before apply PCA
# creates a new dataframe for class1 minus the id column
class1.num <- class1[,-1]
# find row sums 
rowSums(class1.num)
# finds the percentages of row sums for entire table
# to find for individual rows, add the class1.num[row#,]/rowSums(class1.num[row#,])*100
rowsumClass <- class1.num/rowSums(class1.num)*100
rowsumClass
# combines the id column and the test table
cbind(class1[,1], rowsumClass)
classPercent <- cbind(class1[,1], rowsumClass)

# renaming the id column name following the structure: colnames(dataframe)[column #] <- "new name"
colnames(classPercent)[1] <- "id"

# *************linear model (got warnings!!!)************
fit <- lm(classPercent[1,], classPercent[2,])
summary(fit)

# plots regression against specified columns
plot(classPercent$cBacilli, classPercent$cBacteroidia)

# draws a correlogram
library(corrgram)
corrgram(classPercent, upper.panel = panel.pts)


