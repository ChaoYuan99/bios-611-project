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
# NA Market--Top 10
NA_10_games <- vgsales %>% group_by(Name) %>% 
  summarise(sum_na_sales = sum(NA_Sales), .groups = 'drop') %>%
  arrange(desc(sum_na_sales)) %>%
  head(10)

a <- ggplot(data = NA_10_games, aes(x = Name, y = sum_na_sales, fill = Name)) + 
  geom_bar(stat = "identity") +
  theme_light() +
  geom_label(aes(label = sum_na_sales), size = 3) +
  theme(axis.text.x = element_text(
    angle = 0,
    vjust = 0,
    hjust = 0.5
  ),
  legend.position = "top") + theme(
    panel.grid.major = element_line(linetype = "blank"),
    panel.grid.minor = element_line(linetype = "blank"),
    axis.title = element_text(
      size = 12,
      face = "italic",
      colour = "cadetblue4"
    ),
    plot.title = element_text(
      size = 14,
      face = "bold",
      colour = "cadetblue"
    ),
    panel.background = element_rect(fill = NA),
    plot.background = element_rect(
      fill = "aliceblue",
      colour = "aliceblue",
      size = 1
    )
  ) + labs(title = "Top 10 Games have the most sales in NA Market", y = "Sales",
           colour = "Blue") + theme(legend.background = element_rect(fill = "aliceblue"),
                                    legend.position = "right") +
  theme(axis.text.x = element_text(angle = 30, vjust = 0.8, hjust=0.6),legend.position="none")

# EU Market--Top 10
EU_10_games <- vgsales %>% group_by(Name) %>% 
  summarise(sum_eu_sales = sum(EU_Sales), .groups = 'drop') %>%
  arrange(desc(sum_eu_sales)) %>%
  head(10)

b <- ggplot(data = EU_10_games, aes(x = Name, y = sum_eu_sales, fill = Name)) + 
  geom_bar(stat = "identity") +
  theme_light() +
  geom_label(aes(label = sum_eu_sales), size = 3) +
  theme(axis.text.x = element_text(
    angle = 0,
    vjust = 0,
    hjust = 0.5
  ),
  legend.position = "top") + theme(
    panel.grid.major = element_line(linetype = "blank"),
    panel.grid.minor = element_line(linetype = "blank"),
    axis.title = element_text(
      size = 12,
      face = "italic",
      colour = "cadetblue4"
    ),
    plot.title = element_text(
      size = 14,
      face = "bold",
      colour = "cadetblue"
    ),
    panel.background = element_rect(fill = NA),
    plot.background = element_rect(
      fill = "aliceblue",
      colour = "aliceblue",
      size = 1
    )
  ) + labs(title = "Top 10 Games have the most sales in EU Market", y = "Sales",
           colour = "Blue") + theme(legend.background = element_rect(fill = "aliceblue"),
                                    legend.position = "right") +
  theme(axis.text.x = element_text(angle = 30, vjust = 0.8, hjust=0.6),legend.position="none")

# JP Market--Top 10
JP_10_games <- vgsales %>% group_by(Name) %>% 
  summarise(sum_jp_sales = sum(JP_Sales), .groups = 'drop') %>%
  arrange(desc(sum_jp_sales)) %>%
  head(10)

c <- ggplot(data = JP_10_games, aes(x = Name, y = sum_jp_sales, fill = Name)) + 
  geom_bar(stat = "identity") +
  theme_light() +
  geom_label(aes(label = sum_jp_sales), size = 3) +
  theme(axis.text.x = element_text(
    angle = 0,
    vjust = 0,
    hjust = 0.5
  ),
  legend.position = "top") + theme(
    panel.grid.major = element_line(linetype = "blank"),
    panel.grid.minor = element_line(linetype = "blank"),
    axis.title = element_text(
      size = 12,
      face = "italic",
      colour = "cadetblue4"
    ),
    plot.title = element_text(
      size = 14,
      face = "bold",
      colour = "cadetblue"
    ),
    panel.background = element_rect(fill = NA),
    plot.background = element_rect(
      fill = "aliceblue",
      colour = "aliceblue",
      size = 1
    )
  ) + labs(title = "Top 10 Games have the most sales in JP Market", y = "Sales",
           colour = "Blue") + theme(legend.background = element_rect(fill = "aliceblue"),
                                    legend.position = "right") +
  theme(axis.text.x = element_text(angle = 30, vjust = 0.8, hjust=0.6),legend.position="none")

# Other Market--Top 10
Other_10_games <- vgsales %>% group_by(Name) %>% 
  summarise(sum_other_sales = sum(Other_Sales), .groups = 'drop') %>%
  arrange(desc(sum_other_sales)) %>%
  head(10)

d <- ggplot(data = Other_10_games, aes(x = Name, y = sum_other_sales, fill = Name)) + 
  geom_bar(stat = "identity") +
  theme_light() +
  geom_label(aes(label = sum_other_sales), size = 3) +
  theme(axis.text.x = element_text(
    angle = 0,
    vjust = 0,
    hjust = 0.5
  ),
  legend.position = "top") + theme(
    panel.grid.major = element_line(linetype = "blank"),
    panel.grid.minor = element_line(linetype = "blank"),
    axis.title = element_text(
      size = 12,
      face = "italic",
      colour = "cadetblue4"
    ),
    plot.title = element_text(
      size = 14,
      face = "bold",
      colour = "cadetblue"
    ),
    panel.background = element_rect(fill = NA),
    plot.background = element_rect(
      fill = "aliceblue",
      colour = "aliceblue",
      size = 1
    )
  ) + labs(title = "Top 10 Games have the most sales in Other Market", y = "Sales",
           colour = "Blue") + theme(legend.background = element_rect(fill = "aliceblue"),
                                    legend.position = "right") +
  theme(axis.text.x = element_text(angle = 30, vjust = 0.8, hjust=0.6),legend.position="none")

p6 = grid.arrange(a, b, c, d, ncol = 2, nrow = 2) 
ggsave("Figures/TOP10Game_each_market.png",p6)
