# Makes the Species' Score plot (what variables control)
testPlot <- plot(pcaSpeciesData$PC1, pcaSpeciesData$PC2, main = "Species PCA", xlab= "PC1", ylab = "PC2")
pcaSpeciesData1 <- pcaSpeciesData[,-1]
rownames(pcaSpeciesData1) <- pcaSpeciesData[,1]
text(pcaSpeciesData$PC1, pcaSpeciesData$PC2, labels = row.names(pcaSpeciesData1))

# Makes the Species' Loading plot (variables)
plot(pca.species$rotation, xlab = "Loadings on PC1", ylab = "Loadings on PC2", main = "Species Loading Plot")
# trying textplot
textplot(pca.species$rotation[,1], pca.species$rotation[,2], rownames(pca.species$rotation), new = TRUE, show.lines = TRUE)

# Trying to play with x and y limits; not working
mx <- apply(pca.species$rotation, 2, max)
mn <- apply(pca.species$rotation, 2, min)

textplot(pca.species$rotation[,1], pca.species$rotation[,2], rownames(pca.species$rotation), new = TRUE, show.lines = TRUE, xlim=c(mn[25], mx[25]), ylim=c(mn[25], mx[25]))

