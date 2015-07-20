# created an object called exSpecies to represent family1 without the first id column and columns with
# all -Inf and/or 0 values
exSpecies <- species1[, -c(1, 31, 32, 41, 43, 46:49, 52, 54, 57, 64, 69, 72, 76, 77, 79, 81:87, 89, 95:105, 107, 109, 111, 114, 115, 117:132, 134:136, 200:203, 205:218, 220:224, 226:253, 255:307, 309:314, 316:328, 330:385, 387:438, 440:664, 666:1016, 1018, 1021, 1024, 1025, 1027:1030, 1033, 1036, 1038:1040, 1044:1414)]
# log transformation, excluded columns 
log.species <- log(exSpecies)
# makes a data frame with the log transformation
speciesData <- as.data.frame(log.species)
# converts all -Inf values to NA
# decided not to associate the log transformation and data frame b/c that's an unnecessary, possibly bad step
# must change the class and order (maybe phylum)
speciesData[speciesData == -Inf] <- NA
# followed steps 4 and 5 from Basespace document in order to make a MDS plot graph 
# MDS = PCA when pairwise Euclidean distances are known among data points 
# euclidean distances between rows
speciesDist <- dist(speciesData)
# k = number of dimensions 
speciesFit <- cmdscale(speciesDist, eig = TRUE, k = 2)
# view results
speciesFit
# creates plot
x <- speciesFit$points[,1]
y <- speciesFit$points[,2]
plot(x, y, xlab = "Coordinate 1", ylab = "Coordinate 2", main = "Metric MDS", type = "n")
text(x, y, labels = row.names(speciesData), cex = .7)