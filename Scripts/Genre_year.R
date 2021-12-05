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

vgsales <- vgsales[vgsales$Year!='N/A',]

#Year_sales
#2017 and 2020 have too little data
vgsales <- vgsales[vgsales$Year!=2020,]
vgsales <- vgsales[vgsales$Year!='Adventure',]

Genre_game_num <-vgsales %>%
  group_by(Year,Genre) %>%
  summarise(count_name = length(unique(Name)), .groups = 'drop') %>%
  arrange(desc(Year))

ggplot(data = Genre_game_num, aes(x = Year, y = count_name, fill = Genre)) +
  geom_bar(stat = "identity", position = "stack") +
  theme_classic() +
  theme(axis.text.x = element_text(
    angle = 90,
    vjust = 0.5,
    hjust = 1
  )
  ) + labs(title = "Game Sold Quantity By Genre", y = "Games Count",
           colour = "Blue") + theme(legend.background = element_rect(fill = "aliceblue"),
                                    legend.position = "right")