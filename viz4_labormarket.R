library(dplyr) 
laborforce_survey2 <- laborforce_survey %>%
  mutate(type = case_when(
    type == "Employed persons" ~"Employed",
    type == "Unemployed persons" ~ "Unemployed",
    type == "Seasonal labor force" ~ "Seasonal Workers",
    type == "Household work" ~ "Homemakers",
    type == "Studying" ~ "Students",
    type == "Children, elderly, or those unable to work" ~ "Not Able to Work (Children, Elderly, or Disabled)",
    type == "Caregivers for children, the elderly, the sick, or persons with disabilities" ~ "Caregivers (Children, Elderly, Sick, or Disabled)",
    TRUE ~ type))

laborforce_survey2$type <- factor(laborforce_survey2$type, levels = c("Employed", "Unemployed", "Seasonal Workers", "Homemakers", "Students", "Not Able to Work (Children, Elderly, or Disabled)",                                                                   "Caregivers (Children, Elderly, Sick, or Disabled)", "Others"))

library(ggplot2)
ggplot(data = laborforce_survey2,
       aes(x = gender, y = percent2, fill = type)) +
  geom_bar(stat = "identity", width = 0.50) + 
  theme(plot.margin = unit(c(1,1,1,1), "cm")) + 
  geom_text(aes(label = round_half_up(percent2, digit = 2)), 
            position = position_stack(vjust = 0.5)) +
  scale_fill_manual(values = c("#001845","#090c9b","#b4c5e4",
                               "#7c0a02","#e25822","#f4ab44",
                               "#f7dc6f","#E6E8E3")) +
  labs(title = "Understanding Gender Disparities in Thailand’s Labor Market (Quarter 4, 2024)",
       subtitle = "While men dominate formal employment, women are disproportionately responsible for unpaid caregiving and household roles.",
       y = "Percentage", fill = "Category",
       caption = "Source: National Statistical Office, Thailand (2024)") +
  theme_minimal() +
  theme(axis.title.x = element_blank(), axis.title.y = element_blank(), 
        axis.ticks.x = element_blank(), axis.ticks.y = element_blank(),
        plot.margin = margin(3,2,3,2,"cm"))
