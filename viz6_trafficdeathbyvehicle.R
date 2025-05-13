library(tidyr)
library(readxl)
library(janitor)
roadaccidents <- clean_names(roadaccidents) 

library(dplyr) 
road2 <- roadaccidents %>%
  mutate(vehicle = case_when(vehicle == "รถจักรยานยนต์" ~ "Motorcycle",
    vehicle == "รถจักรยาน" ~ "Bicycle",
    vehicle == "รถโดยสาร" ~ "Bus",
    vehicle == "คนเดินเท้า" ~ "Pedestrian",
    vehicle == "รถบรรทุกขนาดเล็ก/รถตู้" ~ "Small Truck/Van",
    vehicle == "รถยนต์" ~ "Car",
    vehicle == "รถบรรทุกหนัก" ~ "Heavy Truck",
    vehicle == "รถเพื่อการเกษตร" ~ "Agricultural Vehicle",
    vehicle == "สามล้อ" ~ "Tricycle",
    vehicle == "ไม่ระบุพาหนะ" ~ "Unspecified",
    TRUE ~ vehicle))

road3 <- road2 %>%
  group_by(dead_year, vehicle) %>%
  summarize(count = n())
road4 <- filter(road3,(dead_year >= 2017) & (dead_year <= 2021))

library(ggplot2)
ggplot(data = road4, 
       mapping = aes(x = dead_year, 
                     y = reorder(vehicle, count))) +
  geom_tile(aes(fill = count),
            color = "white") +  
  scale_fill_gradient(low = "#FBEC5D", 
                      high = "#fb2506") +
  labs(title = (paste("Road Traffic Fatalities by Vehicle Type in Thailand")),
       subtitle = "Motorcycles account for the highest fatalities, followed by cars during 2017-2021",
       caption = "Data: Department of Disease Control, Thailand (2021)",
       fill = "Number of Deaths") +
  theme(plot.margin = margin(3,2,3,2, "cm"),
        axis.title.x = element_blank(), 
        axis.title.y = element_blank(), 
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(),
        panel.background = element_blank())
