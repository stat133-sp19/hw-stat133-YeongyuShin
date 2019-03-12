#title: Shots-chart
#Description script regarding making charts
#inputs: shots record of 5 players
#outputs: images of location of shots made by each players and facetted plot

rm(list=ls())
library(ggplot2)
library(grid)
library(jpeg)
#klay thompson
klay <- read.csv("~/hw-stat133/workout01/data/klay-thompson.csv", stringsAsFactors = FALSE
                 , col.names = c("th_team_name", "th_game_date", "th_season", "th_period", "th_minites_remaining","th_seconds_remaining", "th_shot_made_flag", "th_action_type", "th_shot_type", "th_shot_distance", "th_opponent", "th_x", "th_y"))
boolen7 <- klay$th_shot_made_flag == 'n'
klay$th_shot_made_flag[boolen7] = "shot_no"
boolen8 <- klay$th_shot_made_flag == "y"
klay$th_shot_made_flag[boolen8] = "shot_yes"
klay_scatterplot <- ggplot(data = klay) + geom_point(aes(x = th_x, y = th_y, color = th_shot_made_flag))
download.file("https://raw.githubusercontent.com/ucb-stat133/stat133-hws/master/images/nba-court.jpg", "C:/Users/terta1037/Desktop/demo-repo/workout01/images/nba-court.jpg")
court_file <- "~/hw-stat133/workout01/images/nba-court.jpg"
court_image <- rasterGrob(readJPEG(court_file),
                          width = unit(1, "npc"),
                          height = unit(1, "npc"))
klay_shot_chart <- ggplot(data = klay) + annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = th_x, y = th_y, color = th_shot_made_flag)) +
  ylim(-50, 420) + ggtitle('Shot Chart: Klay Thompson (2016 season)')+
  theme_minimal()
pdf(file = "~/hw-stat133/workout01/images/klay-thompson-shot-chart.pdf", width = 6.5, height = 5)
klay_shot_chart
dev.off()

#andre iguodala
iguodala <- read.csv("~/hw-stat133/workout01/data/andre-iguodala.csv", stringsAsFactors = FALSE
                 , col.names = c("ig_team_name", "ig_game_date", "ig_season", "ig_period", "ig_minites_remaining","ig_seconds_remaining", "ig_shot_made_flag", "ig_action_type", "ig_shot_type", "ig_shot_distance", "ig_opponent", "ig_x", "ig_y"))
boolen1 <- iguodala$ig_shot_made_flag == 'n'
iguodala$ig_shot_made_flag[boolen1] = "shot_no"
boolen2 <- iguodala$ig_shot_made_flag == "y"
iguodala$ig_shot_made_flag[boolen2] = "shot_yes"
iguodala_shot_chart <- ggplot(data = iguodala) + annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = ig_x, y = ig_y, color = ig_shot_made_flag)) +
  ylim(-50, 420) + ggtitle('Shot Chart: andre iguodala (2016 season)')+
  theme_minimal()
png(filename = "~/hw-stat133/workout01/images/andre-iguodala-shot-chart.png", width = 6.5, height = 5, units = 'in', res = 200)
iguodala_shot_chart
dev.off()

#drarmond green
green <- read.csv("~/hw-stat133/workout01/data/draymond-green.csv", stringsAsFactors = FALSE
                     , col.names = c("gr_team_name", "gr_game_date", "gr_season", "gr_period", "gr_minites_remaining","gr_seconds_remaining", "gr_shot_made_flag", "gr_action_type", "gr_shot_type", "gr_shot_distance", "gr_opponent", "gr_x", "gr_y"))
boolen3 <- green$gr_shot_made_flag == 'n'
green$gr_shot_made_flag[boolen3] = "shot_no"
boolen4 <- green$gr_shot_made_flag == "y"
green$gr_shot_made_flag[boolen4] = "shot_yes"
green_shot_chart <- ggplot(data = green) + annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = gr_x, y = gr_y, color = gr_shot_made_flag)) +
  ylim(-50, 420) + ggtitle('Shot Chart: draymond green (2016 season)')+
  theme_minimal()
pdf(file = "~/hw-stat133/workout01/images/draymond-green-shot-chart.pdf", width = 6.5, height = 5)
green_shot_chart
dev.off()

#kevin durant
durant <- read.csv("~/hw-stat133/workout01/data/kevin-durant.csv", stringsAsFactors = FALSE
                  , col.names = c("dr_team_name", "dr_game_date", "dr_season", "dr_period", "dr_minites_remaining","dr_seconds_remaining", "dr_shot_made_flag", "dr_action_type", "dr_shot_type", "dr_shot_distance", "dr_opponent", "dr_x", "dr_y"))
boolen5 <- durant$dr_shot_made_flag == 'n'
durant$dr_shot_made_flag[boolen5] = "shot_no"
boolen6 <- durant$dr_shot_made_flag == "y"
durant$dr_shot_made_flag[boolen6] = "shot_yes"
durant_shot_chart <- ggplot(data = durant) + annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = dr_x, y = dr_y, color = dr_shot_made_flag)) +
  ylim(-50, 420) + ggtitle('Shot Chart: kevin durant (2016 season)')+
  theme_minimal()
pdf(file = "~/hw-stat133/workout01/images/kevin-durant-shot-chart.pdf", width = 6.5, height = 5)
durant_shot_chart
dev.off()

#stephen curry
curry <- read.csv("~/hw-stat133/workout01/data/stephen-curry.csv", stringsAsFactors = FALSE
                   , col.names = c("cr_team_name", "cr_game_date", "cr_season", "cr_period", "cr_minites_remaining","cr_seconds_remaining", "cr_shot_made_flag", "cr_action_type", "cr_shot_type", "cr_shot_distance", "cr_opponent", "cr_x", "cr_y"))
boolen9 <- curry$cr_shot_made_flag == 'n'
curry$cr_shot_made_flag[boolen9] = "shot_no"
boolen10 <- curry$cr_shot_made_flag == "y"
curry$cr_shot_made_flag[boolen10] = "shot_yes"
curry_shot_chart <- ggplot(data = curry) + annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = cr_x, y = cr_y, color = cr_shot_made_flag)) +
  ylim(-50, 420) + ggtitle('Shot Chart: stephen curry (2016 season)')+
  theme_minimal()
pdf(file = "~/hw-stat133/workout01/images/stephen-curry-shot-chart.pdf", width = 6.5, height = 5)
curry_shot_chart
dev.off()

#Facetted Shot Chart
thompson_f <- klay <- read.csv("~/hw-stat133/workout01/data/klay-thompson.csv", stringsAsFactors = FALSE)
thompson_f$player = "thompson"
iguodala_f <- read.csv("~/hw-stat133/workout01/data/andre-iguodala.csv", stringsAsFactors = FALSE)
iguodala_f$player = "iguodala"
green_f <- read.csv("~/hw-stat133/workout01/data/draymond-green.csv", stringsAsFactors = FALSE)
green_f$player = "green"
durant_f <- read.csv("~/hw-stat133/workout01/data/kevin-durant.csv", stringsAsFactors = FALSE)
durant_f$player = "durant"
curry_f <- read.csv("~/hw-stat133/workout01/data/stephen-curry.csv", stringsAsFactors = FALSE)
curry_f$player = "curry"
gsw <- rbind(thompson_f, iguodala_f, green_f, durant_f, curry_f)
boolen11 <- gsw$shot_made_flag == 'n'
gsw$shot_made_flag[boolen11] = "shot_no"
boolen12 <- gsw$shot_made_flag == "y"
gsw$shot_made_flag[boolen12] = "shot_yes"
gsw1 = ggplot(data = gsw) + annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) + ggtitle('Shot Chart(2016 season)')+
  theme_minimal()
gsw_shot_charts <- gsw1 + facet_wrap( ~ player, ncol = 3)
pdf(file = "~/hw-stat133/workout01/images/gsw-shot-charts.pdf", width = 8, height = 7)
gsw_shot_charts
dev.off()
png(filename = "~/hw-stat133/workout01/images/gsw-shot-charts.png", width = 8, height = 7, units = "in", res = 200)
gsw_shot_charts
dev.off()
