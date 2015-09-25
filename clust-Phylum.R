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

l = c("5947", "2108", "5853", "7917", "1718", "5853", "3188", "5029", "4699", "6082", "7798", "3281", "3342", "5423", "6569", "6308", "8115", "9120", "5358", "1896", "6000", "3997", "6418", "7817", "8777", "5384", "8891", "5461", "6910", "8121", "6994", "2004", "3567", "9594", "1015", "1009", "5337", "4113", "1202", "5736", "3723", "7681", "9316", "2353", "6976", "4024", "7211", "2464", "5554", "3447", "4741", "6730", "1000", "9154", "1310", "3769", "3855", "3365", "5033", "4749", "8584", "0707")
filter_pcaPhyData <- subset(pcaPhyData1, grepl(paste(l, collapse = "|"), id.pcaPhyData))

# row names of first cluster
row.names(filter_pcaPhyData[kmPhy$cluster==clust[1],])

# row names of second cluster
row.names(filter_pcaPhyData[kmPhy$cluster==clust[2],])


