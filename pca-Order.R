# NEW PCA USING PERCENTAGES
# PCA using rowsumOrder b/c it does not contain the id column
pca.order <- prcomp(rowsumOrder, center = TRUE, scale. = TRUE)

# prints out the standard deviations and rotations of pca.order
print(pca.order)

# returns a plot of the variances (y-axis) assocaited with the PC's (x-axis)
plot(pca.order, type = "l")

# summary method descriptes the importance of the PC's using their standard deviation, proportion of variance, and cumulative propotion of variance
# We see that the first 2 components combined account for about 32% of variation 
summary(pca.order)

# generates biplot from the output of princomp or prcomp
# Can also add parameters such as choices (specifies components to plot) and can be scaled by a lambda
g.order <- biplot(pca.order)
print(g.order)

# prints out the pca values of all the components
pca.order$x

# turns it into a data frame, so that we don't have to type out pca.phy$x
pcaOrderData <- as.data.frame(pca.order$x)
# combines id column and the PC columns
pcaOrderData <- cbind(order1[1], pcaOrderData)
# retrieves all PC values for PC4
pcaOrderData$PC4

# pca without vectors and labels
plot(pcaOrderData$PC1, pcaOrderData$PC2)

# PCA graph without vectors and labels
plot(pcaOrderData$PC1, pcaOrderData$PC2)
pcaOrderData1 <- pcaOrderData[,-1]
rownames(pcaOrderData1) <- pcaOrderData[,1]
text(pcaOrderData$PC1, pcaOrderData$PC2, labels = row.names(pcaOrderData1))

