# NEW PCA USING PERCENTAGES
# PCA using rowsumPhylum b/c it does not contain the id column
pca.genus <- prcomp(rowsumGenus, center = TRUE, scale. = TRUE)

# prints out the standard deviations and rotations of pca.phy
print(pca.genus)

# returns a plot of the variances (y-axis) assocaited with the PC's (x-axis)
plot(pca.genus, type = "l")

# summary method descriptes the importance of the PC's using their standard deviation, proportion of variance, and cumulative propotion of variance
# We see that the first 2 components combined account for about 23% of variation 
summary(pca.genus)

# generates biplot from the output of princomp or prcomp
# Can also add parameters such as choices (specifies components to plot) and can be scaled by a lambda
g.genus <- biplot(pca.genus)
print(g.genus)

# prints out the pca values of all the components
pca.genus$x

# turns it into a data frame, so that we don't have to type out pca.phy$x
pcaGenusData <- as.data.frame(pca.genus$x)
# combines id and PC columns
pcaGenusData <- cbind(genus1[1], pcaGenusData)
# retrieves all PC values for PC4
pcaGenusData$PC4

# PCA graph without vectors and labels
plot(pcaGenusData$PC1, pcaGenusData$PC2)
pcaGenusData1 <- pcaGenusData[,-1]
rownames(pcaGenusData1) <- pcaGenusData[,1]
text(pcaGenusData$PC1, pcaGenusData$PC2, labels = row.names(pcaGenusData1))
