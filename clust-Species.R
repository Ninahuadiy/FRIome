# Determines the number of clusters
wss <- (nrow(pcaSpeciesData1)-1)*sum(apply(pcaSpeciesData1, 2, var))
for (i in 2:12) wss[i] <- sum(kmeans(pcaSpeciesData1, centers = i)$withinss)
plot(1:12, wss, type = "b")

# Apply k means with k = 3 because the plot starts to bend downwards at k = 3
kmSpecies <- kmeans(pcaSpeciesData1, 3, nstart = 25, iter.max = 1000)
library(RColorBrewer)
library(scales)
palette(alpha(brewer.pal(9,'Set1'), 0.5))
plot(pcaSpeciesData1, col=kmSpecies$cluster, pch=16)

# sort clusters in order of increasing size
sort(table(kmSpecies$clust))
clust <- names(sort(table(kmSpecies$clust)))

# row names of first cluster
row.names(pcaSpeciesData1[kmSpecies$cluster==clust[1],])

# row names of second cluster
row.names(pcaSpeciesData1[kmSpecies$cluster==clust[2],])

# row names of third cluster
row.names(pcaSpeciesData1[kmSpecies$cluster==clust[3],])

# PC values of each cluster 
sclusterGroup <- kmSpecies$cluster
sclusterData <- cbind(pcaSpeciesData1,sclusterGroup)
cluster1Species <- subset(sclusterData, sclusterGroup == 1)
cluster2Species <- subset(sclusterData, sclusterGroup == 2)
cluster3Species <- subset(sclusterData, sclusterGroup == 3)
