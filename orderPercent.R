# Finding the percentages of the reads to normalize the data before apply PCA
# creates a new dataframe for order1 minus the id column
order1.num <- order1[,-1]
# find row sums 
rowSums(order1.num)
# finds the percentages of row sums for entire table
# to find for individual rows, add the order1.num[row#,]/rowSums(order1.num[row#,])*100
rowsumOrder <- order1.num/rowSums(order1.num)*100
rowsumOrder
# combines the id column and the test table
cbind(order1[,1], rowsumOrder)
orderPercent <- cbind(order1[,1], rowsumOrder)

# renaming the id column name following the structure: colnames(dataframe)[column #] <- "new name"
colnames(orderPercent)[1] <- "id"

#linear model
fit <- lm(orderPercent[1,], orderPercent[2,])
summary(fit)

#plot regression against columns
plot(orderPercent$oLactobacillales, orderPercent$oNeisseriales)

#draw a correlogram 
library(corrgram)
corrgram(orderPercent, upper.panel = panel.pts)
