elbow_data <- NULL
for (i in 1:7) {
  clustering <- kmeans(data[,c("GDP","internet")],
                       centers=i, nstart=10)
  elbow_data <- rbind(elbow_data, data.frame(total_ss = clustering$tot.withinss, k=i))
  
}

# Clustering for k=3 (identified from elbow plot)
k <- 3
clustering <- kmeans(data[,c("GDP", "internet")], centers=k,nstart=10)
data$clusters <- as.factor(clustering$cluster)
