# Dr. Riedel's code to subset
clust1 <- subset(pcakingData, PC1 > 0)
clust1 <- subset(pcakingData, PC1 > 0 & PC1 < 0.01)
clust1

# I tried reversing it by using the unscaled parameters at the top of the graph
clust1 <- subset(pcakingData, PC1 > 50)

# problem occurs because i am trying to subset rows on more than one value
# code didn't work...gives the same results as before
sub.king <- pcakingData[pcakingData$PC1 %in% c(-0.003, 0.007), ]
sub.king

# Attempt to subset with multiple values by displaying plot with all values
# doesn't do anything helpful
x = pcakingData$PC1
y = pcakingData$PC2
plot (x,y)
plot (x,y, type = 'p')
text(x, y, sep=", ", cex = 0.8)

# Following the syntax outlined by help(subset)
sub.king <- subset(pcakingData$PC1, select = -0.1:0.1)

# Cluster Analysis and k-means method!!!

# Determine the number of clusters
wss <- (nrow(pcakingData)-1)*sum(apply(pcakingData, 2, var))
for (i in 2:15) wss[i] <- sum(kmeans(pcakingData, centers = i)$withinss)
plot(1:15, wss, type = "b", xlab = "Number of Clusters", ylab = "Within groups sum of squares")

# Apply k means with k = 3 because the plot starts to bend downwards at k = 3
# returns a colored plot where red = cluster 1, green = cluster 2, and blue = cluster 3
kmKing <- kmeans(pcakingData, 3, nstart = 25, iter.max = 1000)
library(RColorBrewer)
library(scales)
palette(alpha(brewer.pal(9,'Set1'), 0.5))
plot(pcakingData, col=kmKing$cluster, pch=16)

# look at clusters in order of increasing size
sort(table(kmKing$clust))
clust <- names(sort(table(kmKing$clust)))

# Row names of the first cluster
row.names(kingdom1[kmKing$cluster==clust[1],])

# Row names of the second cluster
row.names(kingdom1[kmKing$cluster==clust[2],])

# Row names of the third cluster
row.names(kingdom1[kmKing$cluster==clust[3],])









