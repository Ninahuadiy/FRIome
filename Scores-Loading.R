# Makes the Species' Score plot (what variables control)
testPlot <- plot(surveyS1415$PC1, surveyS1415$PC2, main = "Species PCA", xlab= "PC1", ylab = "PC2")
surveyS1415Chart <- surveyS1415[,-1]
rownames(surveyS1415Chart) <- surveyS1415[,1]
text(surveyS1415$PC1, surveyS1415$PC2, labels = row.names(surveyS1415Chart))

# Expands the graph margins to its maximum amount
par(mar=c(0,0,0,0)+0.1)

# Makes the Species' Loading plot (variables)
plot(pca.species$rotation, xlab = "Loadings on PC1", ylab = "Loadings on PC2", main = "Species Loading Plot")
# trying textplot
textplot(pca.species$rotation[,1], pca.species$rotation[,2], rownames(pca.species$rotation), new = TRUE, show.lines = TRUE)

# Trying to play with x and y limits; not working
#mx <- apply(pca.species$rotation, 2, max)
#mn <- apply(pca.species$rotation, 2, min)

#textplot(pca.species$rotation[,1], pca.species$rotation[,2], rownames(pca.species$rotation), new = TRUE, show.lines = TRUE, xlim=c(mn[1], mx[1]), ylim=c(mn[2], mx[2]))

