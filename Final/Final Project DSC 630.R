library(ggplot2)
getwd()
setwd("~/Documents/DSC 630")
library(readr)
df <-read_csv("student-mat.csv")
View(df)
library(dplyr)
df1 <- df[, c('G3','studytime','activities','romantic','freetime','goout','absences')]
View(df1)
df1$activities<-ifelse(df1$activities=="yes",1,0)
df1$romantic<-ifelse(df1$romantic=="yes",1,0)
View(df1)
corr <- round(cor(df1),2)
View(corr)
library(reshape2)
melted_corr <- melt(corr)
View(melted_corr)
ggplot(data = melted_corr, aes(x=Var1, y=Var2, fill=value)) + geom_tile(color = "white")+
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson\nCorrelation") + geom_text(aes(Var2, Var1, label = value), color = "black", size = 4) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.direction = "horizontal")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
