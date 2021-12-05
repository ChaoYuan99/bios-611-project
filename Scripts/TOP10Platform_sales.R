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

Platform_sales <- vgsales %>% group_by(Platform) %>% summarise(sum_global_sales = sum(Global_Sales), .groups = 'drop') %>% 
  arrange(desc(sum_global_sales))

p3 = ggplot(data = head(Platform_sales, 10), aes(x = Platform, y = sum_global_sales, fill = Platform)) + 
  geom_bar(stat = 'identity') +
  geom_label(aes(label = sum_global_sales), size = 3) +
  theme_classic() +
  coord_flip() +
  labs(title = "Top 10 Global Sales By Platform", y = "Global Sales",colour = "Blue")
ggsave("TOP10Platform_sales.png",p3)