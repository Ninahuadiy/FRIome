# Scores and Loadings of Phylum
# Analysis

# Gives a report of the importance of components
# includes the standard deviation, proportion of variance, and cumulative proportion
summary(pca.phy)

# Gives the rotation of the principal components relative to each of the phylum types, a matrix of variable loadings
pca.phy$rotation
# Gives numeric or complex matrix (or data frame) which provides data for PCA
pca.phy$x

# Gives the plot of phylum PCA
g.phy <- biplot(pca.phy)

#Gives a plot of the pca.phylum's rotations
plot(pca.phy$rotation, xlab = "Loadings on PC1", ylab = "Loadings on PC2")
text(pca.phy$rotation, row.names(pca.phy$rotation))

#Gives a plot of pca.phylum's score
plot(pca.phy$x, xlab = "PC1", ylab = "PC2")
text(pca.phy$x, row.names(pca.phy$x))
