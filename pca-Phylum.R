# NEW PCA USING PERCENTAGES
# PCA using rowsumPhylum b/c it does not contain the id column
pca.phy <- prcomp(rowsumPhylum, center = TRUE, scale. = TRUE)

# prints out the standard deviations and rotations of pca.phy
print(pca.phy)

# returns a plot of the variances (y-axis) assocaited with the PC's (x-axis)
plot(pca.phy, type = "l")

# summary method descriptes the importance of the PC's using their standard deviation, proportion of variance, and cumulative propotion of variance
# We see that the first 2 components combined account for about 39% of variation 
summary(pca.phy)

# generates biplot from the output of princomp or prcomp
# Can also add parameters such as choices (specifies components to plot) and can be scaled by a lambda
g.phy <- biplot(pca.phy)
print(g.phy)

# prints out the pca values of all the components
pca.phy$x

# turns it into a data frame, so that we don't have to type out pca.phy$x
pcaPhyData <- as.data.frame(pca.phy$x)

# retrieves all PC values for PC4
pcaPhyData$PC4


