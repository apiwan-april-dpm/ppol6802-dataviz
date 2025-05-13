library(ggplot2)

ggplot(data = prisch_completion) +
  geom_line(mapping = aes(x = year,
                          y = completion_rate,
                          colour = entity),
            linewidth = 0.8) +
  scale_x_continuous(breaks = c(2000, 2002, 2004, 2006, 2008, 2010)) + 
  scale_y_continuous(breaks = c(0, 25, 50, 75, 100)) +
  scale_color_manual(values = c('High income countries'= "#D3D3D3",
                                'Upper-middle income countries' = "#D3D3D3",
                                'Lower-middle income countries' = "#D3D3D3",
                                'Low income countries' = "#D3D3D3",
                                'World' = "#D3D3D3",
                                Vietnam = "#0818A8",
                                Morocco = "#DC143C")) +
  labs(title = (paste("Primary School Completion Rates: Global Trends and Country Highlights")),
       subtitle = "Comparing progress in Morocco, Thailand and Vietnam against global income groups (2000–2010)",
       y = "Primary School Completion Rate (%)",
       caption = "Data: UNESCO Institute for Statistics (2024)") +
  theme_minimal() +
  theme(legend.title = element_blank(),
        axis.title.x = element_blank(), 
        axis.title.y = element_blank(), 
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(),
        plot.margin = margin(3,2,3,2, "cm"))
