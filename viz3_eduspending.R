library(ggplot2)
ggplot(data = literacy_educationshare, 
       aes(x = education_share, y = literacy_rate, size = gdp_per_cap))+
  geom_point(color = "#003fcf", alpha = 0.8, shape = 16) +  
  geom_text_repel(aes(label = entity), size = 3, max.overlaps = 10)+
  scale_size(range = c(5, 25), name =  "GDP per Capita (USD)") + 
  scale_x_continuous(limits = c(0, 30)) +
  scale_y_continuous(limits = c(0, 105)) + 
  theme_minimal() +
  theme(axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(), 
        plot.margin = margin(2,2,2,2,"cm")) +
  labs(title = "Exploring the Relationship Between Education Spending, Literacy and National Wealth (2022)",
       subtitle = "Higher investment doesn’t always translate into better educational outcomes, especially among lower-income countries",
       x = "Education Spending as a Share of Total Government Expenditure (%)",
       y = "Adult Literacy Rate (%)",
       caption = "Source: UNESCO Institute for Statistics and World Bank")
