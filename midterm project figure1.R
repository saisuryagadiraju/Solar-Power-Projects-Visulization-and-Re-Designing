library(ggplot2)
library(tidyverse)
library(RColorBrewer)
source("hw.R")


#Stcked bar
# Sort the data by MWp in ascending order
solar<-read.csv("Largest Solar Power Plants.CSV", as.is=FALSE)
solar_sorted <- solar[order(solar$MWp..Megawatts.Peak.Capacity.), ]

# Create a stacked bar chart for MWp by Name, stacked by Country (ascending order)
ggplot(solar_sorted, aes(y= MWp..Megawatts.Peak.Capacity., x= factor(Name), fill = Country)) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = color_palette) +
  labs(title = "Figure 1: Megawatts Peak Capacity per Solar Project ",
       x = "Name of the Solar Power Project (in Acres)",
       y = "MWp (Megawatts Peak Capacity)",
       color = "black") +
  theme_minimal() +
  theme(legend.position = "right") +hw+
  theme(axis.text.x.bottom   = element_text(angle = 0, hjust = 0.5, size = 10))+
  guides(fill = guide_legend(title = "Country")) +
  geom_text(aes(label = Acres, hjust = 0), position = position_stack(vjust = 0.5), size = 3)+
  coord_flip()

