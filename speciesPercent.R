# Finding the percentages of the reads to normalize the data before apply PCA
# creates a new dataframe for species1 minus the id column
species1.num <- species1[,-1]
# find row sums 
rowSums(species1.num)
# finds the percentages of row sums for entire table
# to find for individual rows, add the species1.num[row#,]/rowSums(species1.num[row#,])*100
rowsumSpecies <- species1.num/rowSums(species1.num)*100
rowsumSpecies
# combines the id column and the test table
cbind(species1[,1], rowsumSpecies)
speciesPercent <- cbind(species1[,1], rowsumSpecies)

# renaming the id column name following the structure: colnames(dataframe)[column #] <- "new name"
colnames(speciesPercent)[1] <- "id"

#linear model
fit <- lm(speciesPercent[1,], speciesPercent[2,])
summary(fit)
#plot regression against columns
plot(speciesPercent$sNeisseria.mucosa, speciesPercent$sVeillonella.atypica)

#draw a correlogram 
library(corrgram)
corrgram(speciesPercent, upper.panel = panel.pts)
