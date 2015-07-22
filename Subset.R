# K-means Cluster method!!!

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

# combining id column, cluster information, and pcakingData (PC values) to one data frame
# rename kmKing$cluster and test to something more logical
test <- kingdom1$id
test <- test[-66]

# rename kmKing$cluster to kclusterGroup
kclusterGroup <- kmKing$cluster

#rename test to id 

id <- test 

# Consider renaming pcakingData1 back to pcakingData
pcakingData1 <- cbind(pcakingData,kclusterGroup,id)
pcakingData <- pcakingData1

# (example) pulling a certain subset of cluster1King using set parameters
cluster1King <- subset(pcakingData, kmKing$cluster == 1)
cluster1King








