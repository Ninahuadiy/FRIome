# Load xlsx package and the FRIome survey
library(xlsx)
survey <- read.xlsx("/Users/Nina/Desktop/FRIome Survey.xlsx", 1)

# Subset Clusters 1, 2, 1.2 (1 & 2), 1.3 (1 & 3), and 2.3 (2 & 3)
survey1.sub <- subset(survey, Cluster == 1)
survey2.sub <- subset(survey, Cluster == 2)
survey1.2.sub <- subset(survey, Cluster == 1.2)
survey1.3.sub <- subset(survey, Cluster == 1.3)
survey2.3.sub <- subset(survey, Cluster == 2.3)
