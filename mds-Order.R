# log transformation, excluded columns 103-117 because they only contained -Inf or 0 values
log.order <- log(order1[,2:102])

# convert log transformation to data frame
orderData <- as.data.frame(log.order)

# replace all infinite values with NA 
orderData[orderData == -Inf] <- NA

# transfers the dataframe back to log transformation
log.order <- orderData

# followed steps 4 and 5 from Basespace document in order to make a MDS plot graph 
# MDS = PCA when pairwise Euclidean distances are known among data points 
# euclidean distances between rows
orderDist <- dist(log.order)

# k = number of dimensions 
orderFit <- cmdscale(orderDist, eig = TRUE, k = 2)

# view results
orderFit

# plot
x <- orderFit$points[,1]
y <- orderFit$points[,2]
plot(x, y, xlab = "Coordinate 1", ylab = "Coordinate 2", main = "Metric MDS", type = "n")
text(x, y, labels = row.names(log.order), cex = .7)