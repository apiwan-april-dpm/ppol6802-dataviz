
library(janitor)
agriculture_share2 <- clean_names(agriculture_share_gdp)

library(ggplot2)
ggplot(data = agriculture_share2) +
  geom_line(mapping = aes(x = year,
                          y = agriculture_share,
                          colour = entity), 
            linewidth = 0.8) +
  scale_x_continuous(breaks = c(2010, 2012, 2014, 2016, 2018, 2020, 2022)) + 
  scale_y_continuous(breaks = c(0, 5, 10, 15, 20)) + 
  scale_color_manual(values = c(India = "#355e3b",
                                Vietnam = "#95e1af",
                                Indonesia = "#009700",
                                Thailand = "#d3d3d3",
                                Malaysia = "#d3d3d3",
                                China = "#d3d3d3",
                                Japan = "#d3d3d3",
                                `South Korea` = "#d3d3d3",
                                Singapore = "#d3d3d3")) +
  labs(title = (paste("Declining Trends in Agricultural GDP Share Across Asian Economies (2010–2022)")),
       subtitle = "Diverging patterns in agricultural dependence, with higher shares in emerging economies",
       y = "Share of GDP from Agriculture",
       x = "Year",
       caption = "Data: World Bank and OECD (2025)") +
  theme_minimal() +
  theme(legend.title = element_blank(), 
        plot.margin = margin(3,2,3,2, "cm"))  
