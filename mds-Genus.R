# created an object called exGenus to represent family1 without the first id column and columns with
# all -Inf and/or 0 values
exGenus <- genus1[, -c(1, 483, 491, 503:505, 507, 508, 510, 511, 513:518, 521, 523:525, 533, 534, 537:542, 544, 548:553, 555, 560:571, 573:578, 580:587, 589:641)]
# log transformation, excluded columns 
log.genus <- log(exGenus)
# makes a data frame with the log transformation
genusData <- as.data.frame(log.genus)
# converts all -Inf values to NA
# decided not to associate the log transformation and data frame b/c that's an unnecessary, possibly bad step
# must change the class and order (maybe phylum)
genusData[genusData == -Inf] <- NA
# followed steps 4 and 5 from Basespace document in order to make a MDS plot graph 
# MDS = PCA when pairwise Euclidean distances are known among data points 
# euclidean distances between rows
genusDist <- dist(genusData)
# k = number of dimensions 
genusFit <- cmdscale(genusDist, eig = TRUE, k = 2)
# view results
genusFit
# creates plot
x <- genusFit$points[,1]
y <- genusFit$points[,2]
plot(x, y, xlab = "Coordinate 1", ylab = "Coordinate 2", main = "Metric MDS", type = "n")
text(x, y, labels = row.names(genusData), cex = .7)