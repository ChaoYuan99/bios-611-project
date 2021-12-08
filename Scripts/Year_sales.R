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

vgsales <- read.csv("Data/vgsales.csv")
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
vgsales <- vgsales[vgsales$Year!='N/A',]
vgsales <- vgsales[vgsales$Publisher!='N/A',]

#Year_sales
#2017 and 2020 have too little data

vgsales <- vgsales[vgsales$Year!=2020,]
vgsales <- vgsales[vgsales$Year!='Adventure',]

Year_sales <- vgsales %>% group_by(Year) %>% summarise(sum_global_sales = sum(Global_Sales))

p1 = ggplot(data = Year_sales, aes(x = Year, y = sum_global_sales, group = 1)) + 
  geom_line() +
  geom_point() +
  theme_classic()
ggsave("Figures/Year_sales.png",p1)
