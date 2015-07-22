# Determines the number of clusters
wss <- (nrow(pcaPhyData)-1)*sum(apply(pcaPhyData, 2, var))
for (i in 2:12) wss[i] <- sum(kmeans(pcaPhyData, centers = i)$withinss)
plot(1:12, wss, type = "b")

# Apply k means with k = 2 because the plot starts to bend downwards at k = 2
kmPhy <- kmeans(pcaPhyData, 2, nstart = 25, iter.max = 1000)
library(RColorBrewer)
library(scales)
palette(alpha(brewer.pal(9,'Set1'), 0.5))
plot(pcaPhyData, col=kmPhy$cluster, pch=16)

# sort clusters in order of increasing size
sort(table(kmPhy$clust))
clust <- names(sort(table(kmPhy$clust)))

# row names of first cluster
row.names(phylum1[kmPhy$cluster==clust[1],])

# row names of second cluster
row.names(phylum1[kmPhy$cluster==clust[2],])


