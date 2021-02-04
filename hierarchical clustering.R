library(dplyr)
library(ggplot2)
library(ggdendro)

hominin_data <- read.table("hominin.txt", header=TRUE, sep="\t")

ggplot(hominin_data, aes(x=Brain.weight..g.,y=Post.canine.surface..mm.squared.,
                         label = Hominin.Lineage)) + geom_point() + 
                     geom_text(hjust = 0, nudge_x = 25, fontface = 'italic') + 
              labs(y = expression(paste("Post-canine Surface ", (mm^2))), 
                   x = "Brain weight (g)") + xlim(400,1600) + ylim(300,550)


x1 <- (hominin_data[[2]]-mean(hominin_data[[2]]))/sd(hominin_data[[2]])
x2 <- (hominin_data[[4]]-mean(hominin_data[[4]]))/sd(hominin_data[[4]])
ggplot(hominin_data, aes(x=x1,y=x2,label = Hominin.Lineage)) + geom_point() +
  labs(y = "Standardised Teeth", x = "Standardised Brain")

xx <- data.frame(x1,x2,row.names=hominin_data$Hominin.Lineage)

dd <- dist(xx,method="euclidean")
hc <- hclust(dd,method="average")
ggdendrogram(hc,rotate=TRUE)
ggsave("../figures/hom_tree.pdf", width = 5, height = 2.5)


