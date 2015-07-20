# performs pca using the FactoMineR package
pca3 <- PCA(kingdom1, scale.unit = TRUE, ncp = 5, ind.sup = NULL, quanti.sup = NULL, quali.sup = 1, row.w = NULL, col.w = NULL, graph = TRUE, axes = c(1,2))

# displays the eigenvalues, variane, % of variance, and cummulative % of variance
summary(pca3)

# plots PCA on an individuals factor map
plot(pca3)

# IMPORTANT! Here we use the prcomp function from the STAT package
# The following code is modeled after the tutorial found online (documented on wiki)

# log transformation
log.king <- log(kingdom1[,2:4]) 
#b/c of infinite values, i removed the last column and row 66
log.king <- log(kingdom1[,2:3])
log.king <- log.kingdom[-66,]

#apply PCA and set center and scale. = TRUE to standardize the variables
pca.king <- prcomp(log.king, center = TRUE, scale. = TRUE)

# print out the transformation
log.king
head(log.king)

# print out the log transformation with just the 2nd and 3rd column 
# b/c 4th column has infinite values that should be excluded
log.king <- log(kingdom1[,2:3])
log.king

# exclude the 66th row because it has an infinite value
log.king <- log.king[-66,]
log.king

# apply PCA again and print out the PCA chart
pca.king <- prcomp(log.king, center = TRUE, scale. = TRUE)
print(pca.king)

# plot method returns plot of variances
plot(pca.king, type = 'l')

# summary method describes the importance of the components 
# (ie. standard deviation, proportion of variance, cumulative proportion)
summary(pca.king)

# create a biplot (enhanced scatter plot for PCA) with a scale of 1
g.king <- biplot(pca.king)
g.king <- biplot(pca.king, scale = 1)

# display the PC values of kingdom
pca.king$x

# display the PC values of kingdom of row 30
pca.king$x[30,]

# converts pca.king$x into a data frame called pcakingData in order to avoid 
# typing out the full name
pcakingData <- as.data.frame(pca.king$x)
pcakingData

# views the PC1 and PC2 values of the pcakingData data frame
pcakingData$PC1
pcakingData$PC2

# attempting to produce an MDS graph to compare PCA and MDS
# results are identical, but coordinates are different (probably due to different scale)
kingDist <- dist(log.king)
# k = number of dimensions 
kingFit <- cmdscale(kingDist, eig = TRUE, k = 2)
# view results
kingFit
# plot
x <- kingFit$points[,1]
y <- kingFit$points[,2]
plot(x, y, xlab = "Coordinate 1", ylab = "Coordinate 2", main = "Metric MDS", type = "n")
text(x, y, labels = row.names(log.king), cex = .7)
