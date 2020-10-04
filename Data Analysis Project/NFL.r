# 

dataset = read.csv('NFL_python.csv')

colnames(dataset) <- c('Index','Player','Team','Comp','Att','Pct','Att/G','Yds','Avg',
                       'Yds/G','TD','Int','1st','1st%','Lng','20+','40+','Sck','Rate')


head(dataset)

X <- subset(dataset,select=c('Player','Team','Comp','Att','Yds','TD','Int','Rate'))
################################################################################

A <- subset(dataset,select=c('Comp','Att'))

set.seed(1)
wcss <- vector()
for(i in 1:10) wcss[i] <- sum(kmeans(A, i)$withinss)
plot(1:10, wcss, type = "b", main = paste('Clusters of Players'), xlab = "Number of clusters",
ylab = "wcss")

set.seed(2)
kmeans <- kmeans(A, 3, iter.max = 300, nstart = 10)

library(ggplot2)
ggplot(data = dataset, aes(x = dataset$Comp, y = dataset$Att)) + 
  geom_point(shape = 20, size = 4, color = kmeans$cluster) +
  geom_text(stat = "identity", aes(label = dataset$Index), vjust=-0.75, hjust= "inward") +
  xlab("No.of Passes Completion") +
  ylab("No.of Attempts") +
  ggtitle("Clusters of Players whose Accuracy is Higher")

#########################################################################################

B <- subset(dataset,select=c('Yds','Att'))

set.seed(3)
wcss <- vector()
for(i in 1:10) wcss[i] <- sum(kmeans(B, i)$withinss)
plot(1:10, wcss, type = "b", main = paste('Clusters of Players'), xlab = "Number of clusters",
     ylab = "wcss")

set.seed(4)
kmeans <- kmeans(B, 3, iter.max = 300, nstart = 10)

library(ggplot2)
ggplot(data = dataset, aes(x = dataset$Yds, y = dataset$Att)) + 
  geom_point(shape = 20, size = 4, color = kmeans$cluster) +
  geom_text(stat = "identity", aes(label = dataset$Index), vjust=-0.5, hjust= "inward") +
  xlab("No.of Yards Thrown") +
  ylab("No.of Attempts") +
  ggtitle("Clusters of Players who thrown more yards w.r.t Attempts")
######################################################################################
C <- subset(dataset,select=c('Int','Att'))

set.seed(5)
wcss <- vector()
for(i in 1:10) wcss[i] <- sum(kmeans(C, i)$withinss)
plot(1:10, wcss, type = "b", main = paste('Clusters of Players'), xlab = "Number of clusters",
     ylab = "wcss")

set.seed(6)
kmeans <- kmeans(C, 3, iter.max = 300, nstart = 10)

library(ggplot2)
ggplot(data = dataset, aes(x = dataset$Int, y = dataset$Att)) + 
  geom_point(shape = 20, size = 4, color = kmeans$cluster) +
  geom_text(stat = "identity", aes(label = dataset$Index), vjust=-0.5, hjust= "inward") +
  xlab("No.of Interceptions") +
  ylab("No.of Attempts") +
  ggtitle("Cluster's of Player's who have ball more time with them")

#####################################################################################
D <- subset(dataset,select=c('TD','Att'))

set.seed(7)
wcss <- vector()
for(i in 1:10) wcss[i] <- sum(kmeans(D, i)$withinss)
plot(1:10, wcss, type = "b", main = paste('Clusters of Players'), xlab = "Number of clusters",
     ylab = "wcss")

set.seed(8)
kmeans <- kmeans(D, 3, iter.max = 300, nstart = 10)

library(ggplot2)

ggplot(data = dataset, aes(x = dataset$TD, y = dataset$Att)) + 
  geom_point(shape = 20, size = 4, color = kmeans$cluster) +
  geom_text(stat = "identity", aes(label = dataset$Index), vjust=-0.5, hjust= "inward") +
  xlab("No.of Touch Downs") +
  ylab("No.of Attempts") +
  ggtitle("Cluster's of Player's who can score more points for their team")

#########################################################################################