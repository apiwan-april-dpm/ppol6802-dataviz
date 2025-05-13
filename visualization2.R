library(ggplot2)

ggplot(data = pisa, 
       aes(x = gdp_growth, y = average_math, size = gdp_pc))+
  geom_point(color = "#ff62b0", alpha = 0.8, shape = 16) +  
  geom_text_repel(aes(label = country), size = 3, max.overlaps = 20) +
  labs(title = "Average performance of 15-year-olds in Math (2020)",
       subtitle = "Despite similar economic constraints, Vietnam’s 15-year-olds outperform peers worldwide, while Morocco struggles to lift scores",
       x = "GDP Growth",
       y = "Average PISA Score in Math",
       caption = "Source: OECD, Our World in Data and World Bank") +
  scale_size(range = c(3, 12), name =  "GDP per Capita") +
  theme_minimal() +
  theme(legend.position = "bottom", 
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(),
        plot.margin = margin(3,2,3,2, "cm"))
