clust1 <- subset.data.frame(pcakingData, PC1 > -0.005)
clust1 <- subset.data.frame(pcakingData, PC1 > -0.005 & PC1 < 0.01)
clust1

clust1 <- subset(pcakingData, PC1 > 50)

# problem occurs because i am trying to subset rows on more than one value
#code didn't work...gives the same results as before
sub.king <- pcakingData[pcakingData$PC1 %in% c(-0.003, 0.007), ]
sub.king

