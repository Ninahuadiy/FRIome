# NEW PCA USING PERCENTAGES
# PCA using rowsumFamily b/c it does not contain the id column
pca.family <- prcomp(rowsumFamily, center = TRUE, scale. = TRUE)

# prints out the standard deviations and rotations of pca.phy
print(pca.family)

# returns a plot of the variances (y-axis) assocaited with the PC's (x-axis)
plot(pca.family, type = "l")

# summary method descriptes the importance of the PC's using their standard deviation, proportion of variance, and cumulative propotion of variance
# We see that the first 2 components combined account for about 30% of variation 
summary(pca.family)

# generates biplot from the output of princomp or prcomp
# Can also add parameters such as choices (specifies components to plot) and can be scaled by a lambda
g.family <- biplot(pca.family)
print(g.family)

# prints out the pca values of all the components
pca.family$x

# turns it into a data frame, so that we don't have to type out pca.phy$x
pcaFamilyData <- as.data.frame(pca.family$x)

# retrieves all PC values for PC4
pcaFamilyData$PC4
