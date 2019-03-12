#title: Shots-Data
#Description Shots
#inputs: Andre-Iguodala shots record, Draymond-Green shots record, Kevin-Durant shots recod, Klay Thompson, Stephen-Curry shots record
#outputs: Summaries of shots for each player and overall summary of 5 players

rm(list=ls())
iguodala <- read.csv("~/hw-stat133/workout01/data/andre-iguodala.csv", stringsAsFactors = FALSE
                     , col.names = c("ig_team_name", "ig_game_date", "ig_season", "ig_period", "ig_minites_remaining","ig_seconds_remaining", "ig_shot_made_flag", "ig_action_type", "ig_shot_type", "ig_shot_distance", "ig_opponent", "ig_x", "ig_y"))
boolen1 <- iguodala$ig_shot_made_flag == 'n'
iguodala$ig_shot_made_flag[boolen1] = "shot_no"
boolen2 <- iguodala$ig_shot_made_flag == "y"
iguodala$ig_shot_made_flag[boolen2] = "shot_yes"
iguodala$ig_shot_made_flag
iguodala$ig_minutes <- iguodala$ig_period*12 - iguodala$ig_minites_remaining
sink(file = "~/hw-stat133/workout01/output/andre-iguodala-summary.txt")
summary(iguodala)
sink()
green <- read.csv("~/hw-stat133/workout01/data/draymond-green.csv", stringsAsFactors = FALSE
                     , col.names = c("gr_team_name", "gr_game_date", "gr_season", "gr_period", "gr_minites_remaining","gr_seconds_remaining", "gr_shot_made_flag", "gr_action_type", "gr_shot_type", "gr_shot_distance", "gr_opponent", "gr_x", "gr_y"))
boolen3 <- green$gr_shot_made_flag == 'n'
green$gr_shot_made_flag[boolen3] = "shot_no"
boolen4 <- green$gr_shot_made_flag == "y"
green$gr_shot_made_flag[boolen4] = "shot_yes"
green$gr_shot_made_flag
green$gr_minutes <- green$gr_period*12 - green$gr_minites_remaining
sink(file = "~/hw-stat133/workout01/output/draymond-green-summary.txt")
summary(green)
sink()
durant <- read.csv("~/hw-stat133/workout01/data/kevin-durant.csv", stringsAsFactors = FALSE
                  , col.names = c("dr_team_name", "dr_game_date", "dr_season", "dr_period", "dr_minites_remaining","dr_seconds_remaining", "dr_shot_made_flag", "dr_action_type", "dr_shot_type", "dr_shot_distance", "dr_opponent", "dr_x", "dr_y"))
boolen5 <- durant$dr_shot_made_flag == 'n'
durant$dr_shot_made_flag[boolen5] = "shot_no"
boolen6 <- durant$dr_shot_made_flag == "y"
durant$dr_shot_made_flag[boolen6] = "shot_yes"
durant$dr_shot_made_flag
durant$dr_minutes <- durant$dr_period*12 - durant$dr_minites_remaining
sink(file = "~/hw-stat133/workout01/output/kevin-durant-summary.txt")
summary(durant)
sink()
thompson <- read.csv("~/hw-stat133/workout01/data/klay-thompson.csv", stringsAsFactors = FALSE
                   , col.names = c("th_team_name", "th_game_date", "th_season", "th_period", "th_minites_remaining","th_seconds_remaining", "th_shot_made_flag", "th_action_type", "th_shot_type", "th_shot_distance", "th_opponent", "th_x", "th_y"))
boolen7 <- thompson$th_shot_made_flag == 'n'
thompson$th_shot_made_flag[boolen7] = "shot_no"
boolen8 <- thompson$th_shot_made_flag == "y"
thompson$th_shot_made_flag[boolen8] = "shot_yes"
thompson$th_shot_made_flag
thompson$th_minutes <- thompson$th_period*12 - thompson$th_minites_remaining
sink(file = "~/hw-stat133/workout01/output/klay-thompson-summary.txt")
summary(thompson)
sink()
curry <- read.csv("~/hw-stat133/workout01/data/stephen-curry.csv", stringsAsFactors = FALSE
                     , col.names = c("cr_team_name", "cr_game_date", "cr_season", "cr_period", "cr_minites_remaining","cr_seconds_remaining", "cr_shot_made_flag", "cr_action_type", "cr_shot_type", "cr_shot_distance", "cr_opponent", "cr_x", "cr_y"))
boolen9 <- curry$cr_shot_made_flag == 'n'
curry$cr_shot_made_flag[boolen9] = "shot_no"
boolen10 <- curry$cr_shot_made_flag == "y"
curry$cr_shot_made_flag[boolen10] = "shot_yes"
curry$cr_shot_made_flag
curry$cr_minutes <- curry$cr_period*12 - curry$cr_minites_remaining
sink(file = "~/hw-stat133/workout01/output/stephen-curry-summary.txt")
summary(curry)
sink()
andre_iguodala <- read.csv(file = "~/hw-stat133/workout01/data/andre-iguodala.csv")
draymond_green <- read.csv(file = "~/hw-stat133/workout01/data/draymond-green.csv")
kevin_durant <- read.csv(file = "~/hw-stat133/workout01/data/kevin-durant.csv")
klay_thompson <- read.csv(file = "~/hw-stat133/workout01/data/klay-thompson.csv")
stephen_curry <- read.csv(file = "~/hw-stat133/workout01/data/stephen-curry.csv")
andre_iguodala$minutes <- andre_iguodala$period*12 - andre_iguodala$minutes_remaining
draymond_green$minutes <- draymond_green$period*12 - draymond_green$minutes_remaining
kevin_durant$minutes <- kevin_durant$period*12 - kevin_durant$minutes_remaining
klay_thompson $minutes <- klay_thompson $period*12 - klay_thompson $minutes_remaining
stephen_curry$minutes <- stephen_curry$period*12 - stephen_curry$minutes_remaining
shots_data <- rbind(iguodala = c("ig_team_name", "ig_game_date", "ig_season", "ig_period", "ig_minites_remaining","ig_seconds_remaining", "ig_shot_made_flag", "ig_action_type", "ig_shot_type", "ig_shot_distance", "ig_opponent", "ig_x", "ig_y", "ig_minutes"),
                    andre_iguodala, 
                    green = c("gr_team_name", "gr_game_date", "gr_season", "gr_period", "gr_minites_remaining","gr_seconds_remaining", "gr_shot_made_flag", "gr_action_type", "gr_shot_type", "gr_shot_distance", "gr_opponent", "gr_x", "gr_y", "gr_minutes"), 
                    draymond_green,
                    durant = c("dr_team_name", "dr_game_date", "dr_season", "dr_period", "dr_minites_remaining","dr_seconds_remaining", "dr_shot_made_flag", "dr_action_type", "dr_shot_type", "dr_shot_distance", "dr_opponent", "dr_x", "dr_y", "dr_minutes"),
                    kevin_durant,
                    thompson = c("th_team_name", "th_game_date", "th_season", "th_period", "th_minites_remaining","th_seconds_remaining", "th_shot_made_flag", "th_action_type", "th_shot_type", "th_shot_distance", "th_opponent", "th_x", "th_y","th_minutes"),
                    klay_thompson,
                    curry = c("cr_team_name", "cr_game_date", "cr_season", "cr_period", "cr_minites_remaining","cr_seconds_remaining", "cr_shot_made_flag", "cr_action_type", "cr_shot_type", "cr_shot_distance", "cr_opponent", "cr_x", "cr_y","cr_minutes"),
                    stephen_curry)
sink(file = "~/hw-stat133/workout01/data/shots-data.csv")
shots_data
sink()
summary_table <- rbind(iguodala = c("ig_team_name", "ig_game_date", "ig_season", "ig_period", "ig_minites_remaining","ig_seconds_remaining", "ig_shot_made_flag", "ig_action_type", "ig_shot_type", "ig_shot_distance", "ig_opponent", "ig_x", "ig_y", "ig_minutes"),
                       summary(iguodala), 
                       green = c("gr_team_name", "gr_game_date", "gr_season", "gr_period", "gr_minites_remaining","gr_seconds_remaining", "gr_shot_made_flag", "gr_action_type", "gr_shot_type", "gr_shot_distance", "gr_opponent", "gr_x", "gr_y", "gr_minutes"), 
                       summary(green),
                       durant = c("dr_team_name", "dr_game_date", "dr_season", "dr_period", "dr_minites_remaining","dr_seconds_remaining", "dr_shot_made_flag", "dr_action_type", "dr_shot_type", "dr_shot_distance", "dr_opponent", "dr_x", "dr_y", "dr_minutes"),
                       summary(durant),
                       thompson = c("th_team_name", "th_game_date", "th_season", "th_period", "th_minites_remaining","th_seconds_remaining", "th_shot_made_flag", "th_action_type", "th_shot_type", "th_shot_distance", "th_opponent", "th_x", "th_y","th_minutes"),
                       summary(thompson),
                       curry = c("cr_team_name", "cr_game_date", "cr_season", "cr_period", "cr_minites_remaining","cr_seconds_remaining", "cr_shot_made_flag", "cr_action_type", "cr_shot_type", "cr_shot_distance", "cr_opponent", "cr_x", "cr_y","cr_minutes"),
                       summary(curry))
sink(file = "~/hw-stat133/workout01/output/shots-data-summary.txt")
summary_table
sink()
