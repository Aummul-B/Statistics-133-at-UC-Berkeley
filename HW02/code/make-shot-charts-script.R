# Title : chart making
# Description : the script is about creating shot charts
# Inputs : shots-data.csv
# Outputs : charts
# Author : Aummul Baneen Manasawala
# Date: 03/06/2018


#load packages
library(ggplot2)
library(jpeg)
library(grid)

#scatterplot
curry_scatterplot <- ggplot(data = curry) + 
  geom_point(aes(x=x, y=y, color = shot_made_flag))
curry_scatterplot

durant_scatterplot <- ggplot(data = durant) + 
  geom_point(aes(x=x, y=y, color = shot_made_flag))
durant_scatterplot

green_scatterplot <- ggplot(data = green) + 
  geom_point(aes(x=x, y=y, color = shot_made_flag))
green_scatterplot

iguodala_scatterplot <- ggplot(data = iguodala) + 
  geom_point(aes(x=x, y=y, color = shot_made_flag))
iguodala_scatterplot

thompson_scatterplot <- ggplot(data = thompson) + 
  geom_point(aes(x=x, y=y, color = shot_made_flag))
thompson_scatterplot


#court image
court_file <- "../images/nba-court.jpg"

#create raste object
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc")
)

#shot chart with court background
curry_shot_chart <- ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x=x, y=y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Stephen Curry (2016 season)") +
  theme_minimal()
curry_shot_chart


durant_shot_chart <- ggplot(data = durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x=x, y=y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Kevin Durant (2016 season)") +
  theme_minimal()
durant_shot_chart


green_shot_chart <- ggplot(data = green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x=x, y=y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Draymond Green (2016 season)") +
  theme_minimal()
green_shot_chart


iguodala_shot_chart <- ggplot(data = iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x=x, y=y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Andre Iguodala (2016 season)") +
  theme_minimal()
iguodala_shot_chart

thompson_shot_chart <- ggplot(data = thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x=x, y=y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Klay Thompson (2016 season)") +
  theme_minimal()
thompson_shot_chart


#exporting the charts as images
ggsave(filename = "../images/andre-iguodala-shot-chart.pdf", 
       plot = iguodala_shot_chart, width = 6.5, height = 5, units = "in")

ggsave(filename = "../images/draymond-green-shot-chart.pdf", 
       plot = green_shot_chart, width = 6.5, height = 5, units = "in")

ggsave(filename = "../images/kevin-durant-shot-chart.pdf", 
       plot = durant_shot_chart, width = 6.5, height = 5, units = "in")

ggsave(filename = "../images/klay-thompson-shot-chart.pdf", 
       plot = thompson_shot_chart, width = 6.5, height = 5, units = "in")

ggsave(filename = "../images/stephen-curry-shot-chart.pdf", 
       plot = curry_shot_chart, width = 6.5, height = 5, units = "in")


#faceted shot chart

combine_shot_chart <- ggplot(data = shots_data) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x=x, y=y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle("Shots Chart: GSW (2016 season)") +
  theme_minimal()+
  theme(legend.position = "top")+
  facet_wrap(~name)

  
combine_shot_chart

ggsave(filename = "../images/gsw-shot-chart.pdf", 
       plot = combine_shot_chart, width = 8, height = 7, units = "in")


