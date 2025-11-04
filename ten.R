# Load data and scale for clustering
wine <- read.csv("/Users/mayankverma/Downloads/wine+quality/winequality-white.csv", sep=";")
wine_num <- scale(wine[, 1:11])  

set.seed(123)
km <- kmeans(wine_num, centers=3, nstart=25)
wine$kmeans_cluster <- as.factor(km$cluster)


d <- dist(wine_num)
hclust_mod <- hclust(d)
plot(hclust_mod, main="Hierarchical Clustering Dendrogram")
rect.hclust(hclust_mod, k=3, border=2:4)





if(!require(ggplot2)) install.packages("ggplot2")
if(!require(RColorBrewer)) install.packages("RColorBrewer")
library(ggplot2)
library(RColorBrewer)

pca <- prcomp(wine_num)
wine$PC1 <- pca$x[,1]
wine$PC2 <- pca$x[,2]
        
ggplot(wine, aes(x=PC1, y=PC2, color=kmeans_cluster)) +
  geom_point(alpha=0.7) +
  labs(title="K-means Clusters on PCA Axes") +
  scale_color_brewer(palette="Set1")

# (Optional) Show original quality classes on PCA for comparison
ggplot(wine, aes(x=PC1, y=PC2, color=factor(quality))) +
  geom_point(alpha=0.6) +
  labs(title="Wine Quality vs. Clusters", color="Quality")


km$centers

aggregate(wine[,1:11], by=list(cluster=wine$kmeans_cluster), mean)



wss <- numeric(10)
for (k in 1:10) {
  wss[k] <- kmeans(wine_num, centers=k, nstart=10)$tot.withinss
}
plot(1:10, wss, type="b", pch=19, frame=FALSE,
     xlab="Number of clusters K",
     ylab="Total within-clusters sum of squares",
     main="Elbow Method for K")


