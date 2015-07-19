# log transformation, excluded columns 
log.class <- log(class1[,2:50])
# makes a data frame with the log transformation
classData <- as.data.frame(log.class)
# converts all -Inf values to NA
classData[classData == -Inf] <- NA
# transforms data frame back to log transformation
log.class <- classData
# tried performing pca using the same method as the phylum
# however returned an error: "cannot rescale a constant/zero column
# to unit variance" 
# error means that to convert to unit variance, we divide the values in column
# by the standard deviation. If column has zero variance, standard deviation = 0, cannot divide by 0
pca.class <- prcomp(~., data = log.class, center = TRUE, scale = TRUE, na.action = na.omit)
# followed steps 4 and 5 from Basespace document in order to make a MDS plot graph 
# MDS = PCA when pairwise Euclidean distances are known among data points 
# euclidean distances between rows
classDist <- dist(log.class)
# k = number of dimensions 
classFit <- cmdscale(classDist, eig = TRUE, k = 2)
# view results
classFit
# plot
x <- classFit$points[,1]
y <- classFit$points[,2]
plot(x, y, xlab = "Coordinate 1", ylab = "Coordinate 2", main = "Metric MDS", type = "n")
text(x, y, labels = row.names(log.class), cex = .7)

