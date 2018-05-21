# Title : "data preparation"
# Description : the script is about creating a madified csv file
# Inputs : players*.csv
# Outputs : shots-data.csv,summary.txt
# Author : Aummul Baneen Manasawala
# Date: 03/06/2018


#reading files
curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = F)
thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = F)
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = F)
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = F)
iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = F)

#adding column for name
curry$name <- c("Stephen Curry")

iguodala$name <- c("Andre Iguodala")

green$name <- c("Graymond Green")

durant$name <- c("Kevin Durant")

thompson$name <- c("Klay Thompson")



#change shot_made_flag to descriptive
iguodala[iguodala$shot_made_flag=="y", "shot_made_flag" ] <- "made shot"
iguodala[iguodala$shot_made_flag=="n", "shot_made_flag"] <- "missed shot"

curry[curry$shot_made_flag=="y", "shot_made_flag" ] <- "made shot"
curry[curry$shot_made_flag=="n", "shot_made_flag"] <- "missed shot"


durant[durant$shot_made_flag=="y","shot_made_flag" ] <- "made shot"
durant[durant$shot_made_flag=="n", "shot_made_flag"] <- "missed shot"


green[green$shot_made_flag=="y", "shot_made_flag"] <- "made shot"
green[green$shot_made_flag=="n", "shot_made_flag"] <- "missed shot"


thompson[thompson$shot_made_flag=="y", "shot_made_flag"] <- "made shot"
thompson[thompson$shot_made_flag=="n", "shot_made_flag" ] <- "missed shot"


#add column minute

curry$minute <- (curry$period * 12) - curry$minutes_remaining
durant$minute <- durant$period*12 - durant$minutes_remaining  
green$minute <- green$period*12 - green$minutes_remaining
iguodala$minute <- iguodala$period*12 - iguodala$minutes_remaining
thompson$minute <- thompson$period*12 - thompson$minutes_remaining

#sinking files
sink(file = "../output/andre-iguodala-summary.txt")
summary(iguodala)
sink()

sink(file = "../output/graymond-green-summary.txt")
summary(green)
sink()


sink(file = "../output/klay-thompson-summary.txt")
summary(thompson)
sink()

sink(file = "../output/stephen-curry-summary.txt")
summary(curry)
sink()

#stacking all in one
shots_data <- as.data.frame(rbind(curry, durant, green, iguodala, thompson))

#exporting table
write.csv(shots_data, file = "../data/shots-data.csv", row.names = T)

#sinking combined summary
sink(file = "../output/shots-data-summary.txt")
summary(shots_data)
sink()
