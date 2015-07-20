# created an object called exFamily to represent family1 without the first id column and columns with
# all -Inf or 0 values
exFamily <- family1[, -c(1, 216, 218:220, 224, 226:247)]
# log transformation, excluded columns 
log.family <- log(exFamily)
# makes a data frame with the log transformation
familyData <- as.data.frame(log.family)
# converts all -Inf values to NA
# decided not to associate the log transformation and data frame b/c that's an unnecessary, possibly bad step
# must change the class and order (maybe phylum)
familyData[familyData == -Inf] <- NA
# followed steps 4 and 5 from Basespace document in order to make a MDS plot graph 
# MDS = PCA when pairwise Euclidean distances are known among data points 
# euclidean distances between rows
familyDist <- dist(familyData)
# k = number of dimensions 
familyFit <- cmdscale(familyDist, eig = TRUE, k = 2)
# view results
familyFit
# creates plot
x <- familyFit$points[,1]
y <- familyFit$points[,2]
plot(x, y, xlab = "Coordinate 1", ylab = "Coordinate 2", main = "Metric MDS", type = "n")
text(x, y, labels = row.names(familyData), cex = .7)