library(janitor)
road2 <- clean_names(roadaccidents)

road3 <- pivot_longer(road2,
                       cols = x2012:x2021,
                       names_to = "year",
                       values_to = "num")
library(stringr)
road3$year <- str_replace(road3$year, "^x", "")
road3$year <- as.numeric(road3$year)
View(road3)

ggplot(data = road3,
       mapping = aes (x = year, y = num, fill = age_group)) +
  geom_bar(stat = "identity", position = "dodge", 
           width = 0.80) +
  scale_fill_manual(values = c("0-20" = "#f2b995",
                               "21-40" = "#dc143c",
                               "41-60" = "#20a387",
                               "61-80" = "#136371",
                               "81+" = "#1e3a4b")) + 
  labs(title = ("A Decade of Road Traffic Deaths (2012-2021): Young Adults at Highest Risk"),
       subtitle = "The 21-40 age group consistently records the highest fatalities, with a significant decline in 2021",
       caption = "Data: Department of Disease Control, Thailand (2021)",
       fill = "Age Group") +
  theme_minimal() +
  scale_x_continuous(breaks = seq(2012, 2021)) + 
  theme(legend.position = "bottom",
        axis.title.x = element_blank(), 
        axis.title.y = element_blank(), 
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(), 
        plot.margin = margin(3,2,3,2,"cm"))
