# NEW PCA USING PERCENTAGES
# PCA using rowsumClass b/c it does not contain the id column
pca.class <- prcomp(rowsumClass, center = TRUE, scale. = TRUE)

# prints out the standard deviations and rotations of pca.phy
print(pca.class)

# returns a plot of the variances (y-axis) assocaited with the PC's (x-axis)
plot(pca.class, type = "l")

# summary method descriptes the importance of the PC's using their standard deviation, proportion of variance, and cumulative propotion of variance
# We see that the first 2 components combined account for about 29% of variation 
summary(pca.class)

# generates biplot from the output of princomp or prcomp
# Can also add parameters such as choices (specifies components to plot) and can be scaled by a lambda
g.class <- biplot(pca.class)
print(g.class)

# prints out the pca values of all the components
pca.class$x

# turns it into a data frame, so that we don't have to type out pca.phy$x
pcaClassData <- as.data.frame(pca.class$x)

# retrieves all PC values for PC4
pcaClassData$PC4
