# NEW PCA USING PERCENTAGES
# PCA using rowsumSpecies b/c it does not contain the id column
# Note: I dropped the columns that had zero or constant variance because prcomp could not work on those columns
# names of constant columns
names(rowsumSpecies[, sapply(rowsumSpecies, function(v) var(v, na.rm=TRUE)--0)])

#drop constant columns
rowsumSpecies1 <- rowsumSpecies[, sapply(rowsumSpecies, function(v) var(v, na.rm = TRUE)!=0)]
#pca
pca.species <- prcomp(rowsumSpecies1, center = TRUE, scale. = TRUE)

# prints out the standard deviations and rotations of pca.phy
print(pca.species)

# returns a plot of the variances (y-axis) assocaited with the PC's (x-axis)
plot(pca.species, type = "l")

# summary method descriptes the importance of the PC's using their standard deviation, proportion of variance, and cumulative propotion of variance
# We see that the first 2 components combined account for about 63% of variation 
summary(pca.species)

# generates biplot from the output of princomp or prcomp
# Can also add parameters such as choices (specifies components to plot) and can be scaled by a lambda
g.species <- biplot(pca.species)
print(g.species)

# prints out the pca values of all the components
pca.species$x

# turns it into a data frame, so that we don't have to type out pca.phy$x
pcaSpeciesData <- as.data.frame(pca.species$x)
# combines id column and the PC columns
pcaSpeciesData <- cbind(order1[1], pcaSpeciesData)

# retrieves all PC values for PC4
pcaSpeciesData$PC4

# removes the arrows for vectors 
biplot(pca.species, var.axes=FALSE)

# new PCA graph without labels and vectors 
testPlot <- plot(pcaSpeciesData$PC1, pcaSpeciesData$PC2, main = "Species PCA", xlab= "PC1", ylab = "PC2")
pcaSpeciesData1 <- pcaSpeciesData[,-1]
rownames(pcaSpeciesData1) <- pcaSpeciesData[,1]
text(pcaSpeciesData$PC1, pcaSpeciesData$PC2, labels = row.names(pcaSpeciesData1))

# Plot over the points with different responses to Q12 of Survey (Red Velvet)

# Blue = Awesome 
whichRow<-which(grepl(c("5947"), pcaSpeciesData$id, fixed = FALSE))
test <- pcaSpeciesData[whichRow, ]
points(test$PC1, test$PC2, col="blue", pch = 16)

# Green = Good
multiMatch <- c("2108", "5853", "7917", "1718", "5853", "3188", "5029", "4699", "6082", "7798", "3281")
whichRow<-which(grepl(paste(multiMatch, collapse="|"), pcaSpeciesData$id, fixed = FALSE))
test <- pcaSpeciesData[whichRow, ]
points(test$PC1, test$PC2, col="green", pch = 16)

# Yellow = Tired
multiMatch <- c("3997", "6418", "7817", "8777", "5384", "8891", "5461", "6910", "8121", "6994", "2004", "3567", "9594", "1015", "1009")
whichRow<-which(grepl(paste(multiMatch, collapse="|"), pcaSpeciesData$id, fixed = FALSE))
test <- pcaSpeciesData[whichRow, ]
points(test$PC1, test$PC2, col="yellow", pch = 16)

# Orange = Sick
multiMatch <- c("4024", "7211", "2464")
whichRow<-which(grepl(paste(multiMatch, collapse="|"), pcaSpeciesData$id, fixed = FALSE))
test <- pcaSpeciesData[whichRow, ]
points(test$PC1, test$PC2, col="orange", pch = 16)

# Red = Stressed 
multiMatch <- c("5554", "3447", "4741", "6730", "1000", "9154", "1310", "3769", "3855", "3365")
whichRow<-which(grepl(paste(multiMatch, collapse="|"), pcaSpeciesData$id, fixed = FALSE))
test <- pcaSpeciesData[whichRow, ]
points(test$PC1, test$PC2, col="red", pch = 16)
