# log transformation
log.phylum <- log(phylum1[,2:27]) 

# convert log transformation to data frame
phylumData <- as.data.frame(log.phylum)

# replace all infinite values with NA 
phylumData[phylumData == -Inf] <- NA

# transfers the dataframe back to log transformation
log.phylum <- phylumData

# Does PCR on rows 2-27; unsure of what "~." means in R, assuming a
# placeholder, na.action = na.omit removes the NA values from PCA 
pca.phy <- prcomp(~., data = log.phylum, center = TRUE, scale = TRUE, na.action = na.omit)

# print results
print(pca.phy)

# plot with line
plot(pca.phy, type = "l")

# gives summary 
summary(pca.phy)

# pca using a biplot
g.phy <- biplot(pca.phy)

# prints out the pca values of all the components
pca.phy$x

# turns it into a data frame, so that we don't have to type out pca.phy$x
pcaPhyData <- as.data.frame(pca.phy$x)

# retrieves all PC values for PC4
pcaPhyData$PC4
