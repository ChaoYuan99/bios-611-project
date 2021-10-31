library(tidyverse)
library(ggthemes)
library(ggplot2)
library(reshape2)
library(data.table)
library(hrbrthemes)
library(gganimate)
library(ggThemeAssist)
library(gridExtra)
library(gapminder)

#view some information of this dataset
str(vgsales)
summary(vgsales)
head(vgsales)

#data conversion and cleaning
vgsales <- data.frame(vgsales)
for (i in 3:6){
  vgsales[,i] <- as.factor(vgsales[,i])
}
vgsales <- vgsales[,-1] #rank makes no sense here
summary(vgsales)
# the attributes of Year and Publisher have N/A value
vgsales <- vgsales[vgsales$Year!='NA',]
vgsales <- vgsales[vgsales$Publisher!='NA',]

#Genre_sales
Genre_sales <- vgsales %>% group_by(Genre) %>% summarise(sum_global_sales = sum(Global_Sales)) 
ggplot(data = Genre_sales, aes(x = Genre, y = sum_global_sales, fill = Genre)) + 
  geom_bar(stat = 'identity') +
  geom_label(aes(label = sum_global_sales), size = 4) +
  theme_classic() 