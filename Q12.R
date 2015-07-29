testPlot <- plot(pcaSpeciesData$PC1, pcaSpeciesData$PC2, main = "Species PCA", xlab= "PC1", ylab = "PC2")
# Plot over the points with different responses to Q12 of Survey (Red Velvet)

# Blue = Awesome 
whichRow<-which(grepl(c("5947"), pcaSpeciesData$id, fixed = FALSE))
test <- pcaSpeciesData[whichRow, ]
points(test$PC1, test$PC2, col="blue", pch = 16)

# Green = Good
multiMatch <- c("2108", "5853", "7917", "1718", "5853", "3188", "5029", "4699", "6082", "7798", "3281")
whichRow<-which(grepl(paste(multiMatch, collapse="|"), pcaSpeciesData$id, fixed = FALSE))
test <- pcaSpeciesData[whichRow, ]
points(test$PC1, test$PC2, col="green", pch = 16)

# Yellow = Tired
multiMatch <- c("3997", "6418", "7817", "8777", "5384", "8891", "5461", "6910", "8121", "6994", "2004", "3567", "9594", "1015", "1009")
whichRow<-which(grepl(paste(multiMatch, collapse="|"), pcaSpeciesData$id, fixed = FALSE))
test <- pcaSpeciesData[whichRow, ]
points(test$PC1, test$PC2, col="yellow", pch = 16)

# Orange = Sick
multiMatch <- c("4024", "7211", "2464")
whichRow<-which(grepl(paste(multiMatch, collapse="|"), pcaSpeciesData$id, fixed = FALSE))
test <- pcaSpeciesData[whichRow, ]
points(test$PC1, test$PC2, col="orange", pch = 16)

# Red = Stressed 
multiMatch <- c("5554", "3447", "4741", "6730", "1000", "9154", "1310", "3769", "3855", "3365")
whichRow<-which(grepl(paste(multiMatch, collapse="|"), pcaSpeciesData$id, fixed = FALSE))
test <- pcaSpeciesData[whichRow, ]
points(test$PC1, test$PC2, col="red", pch = 16)
