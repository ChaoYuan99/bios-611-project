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

Publisher_sales <- vgsales %>% group_by(Publisher) %>% summarise(sum_global_sales = sum(Global_Sales), .groups = 'drop') %>% 
  arrange(desc(sum_global_sales))

p4 = ggplot(data = head(Publisher_sales, 10), aes(x = Publisher, y = sum_global_sales, fill = Publisher)) + 
  geom_bar(stat = 'identity') +
  geom_label(aes(label = sum_global_sales), size = 3) +
  theme_classic() +
  coord_flip() +
  labs(title = "Top 10 Global Sales By Publisher", y = "Global Sales",colour = "Blue")
ggsave("TOP10Publisher.png",p4)