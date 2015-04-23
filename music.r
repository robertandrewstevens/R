
music<-read.csv("http://www.public.iastate.edu/~hofmann/looking-at-data/data/music.csv",row.names=1)
head(music)

library(rggobi)
ggobi(music)

music.std <- scale(music[, 3:7])
music.dist <- dist(music.std)

music.clust <- hclust(music.dist, method="ward")
plot(music.clust)

gd <- ggobi(music)[1]
cl <- cutree(music.clust, k=6)
for (i in 1:6) {
  glyph_color(gd) <- rep(1, 62) # reset color
  glyph_color(gd)[cl==i] <- 9 # highlight cluster

  readline("Ready to continue? Press return ")
}

gd[,"cl2"]<-cutree(music.clust,2)
gd[,"cl3"]<-cutree(music.clust,3)
gd[,"cl4"]<-cutree(music.clust,4)
gd[,"cl5"]<-cutree(music.clust,5)
gd[,"cl6"]<-cutree(music.clust,6)
gd[,"cl7"]<-cutree(music.clust,7)
gd[,"cl8"]<-cutree(music.clust,8)
gd[,"cl9"]<-cutree(music.clust,9)
gd[,"cl10"]<-cutree(music.clust,10)

# Do PCA in ggobi, and examine the clusters in the first two PCs

kcl<-kmeans(music.std,5)
table(kcl$cluster,cutree(music.clust,5))

gd[,"kcl"]<-kcl$cluster
glyph_color(gd) <- rep(1, 62)
glyph_size(gd) <- rep(3, 62)

# If rggobi is not running
# Run the cluster analysis in R, add the cluster solutions as new columns
# in the data, and write to csv
music.clust<-data.frame(music, cl2=cutree(music.clust,2), cl3=cutree(music.clust,3), cl4=cutree(music.clust,4), cl5=cutree(music.clust,5), cl6=cutree(music.clust,6), cl7=cutree(music.clust,7), cl8=cutree(music.clust,8), cl9=cutree(music.clust,9), cl10=cutree(music.clust,10), kcl=kmeans(music.std,5)$cluster)
write.csv(music.clust, "music-clust.csv", row.names=F, quote=F)
