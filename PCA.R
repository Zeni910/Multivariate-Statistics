
library(plyr)
library(ggplot2)
library(GGally)

full_auto_data <- read.table("./auto.txt", header=FALSE, sep="\t")

full_auto_data <- rename(full_auto_data, c(
  "V1"="MPG",
  "V2"="Cylinders",
  "V3"="Displacement",
  "V4"="Horsepower",
  "V5"="Weight",
  "V6"="Acceleration",
  "V7"="ModelYear",
  "V8"="Origin",
  "V9"="CarName"
))

auto_data <- full_auto_data[,c(1,3,5,6)]


ggpairs(auto_data)


pdf("../figures/auto_ggpairs_scaled.pdf", width=8, height=8)
auto_data.scaled <- scale(auto_data)
ggpairs(as.data.frame(auto_data.scaled))

auto_pca <- prcomp(auto_data, scale = TRUE)

print(summary(auto_pca))

print(auto_pca)


plot(auto_pca, main="")
axis(1, at=1:4, labels=c('PC1','PC2','PC3','PC4'))

biplot(auto_pca,xlabs=full_auto_data[,9],cex=c(0.3,1.0))





