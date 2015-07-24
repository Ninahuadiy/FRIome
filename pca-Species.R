# NEW PCA USING PERCENTAGES
# PCA using rowsumSpecies b/c it does not contain the id column
# Note: I dropped the columns that had zero or constant variance because prcomp could not work on those columns
# names of constant columns
names(rowsumSpecies[, sapply(rowsumSpecies, function(v) var(v, na.rm=TRUE)--0)])

#drop constant columns
rowsumSpecies1 <- rowsumSpecies[, sapply(rowsumSpecies, function(v) var(v, na.rm = TRUE)!=0)]
#pca
pca.species <- prcomp(rowsumSpecies, center = TRUE, scale. = TRUE)

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

# retrieves all PC values for PC4
pcaSpeciesData$PC4
