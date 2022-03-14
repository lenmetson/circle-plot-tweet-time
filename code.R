library(tidyverse)
library(ggplot2)

# Set working directory 
setwd()

# Read in data 

tweets_time <- read.csv(tweets_time.csv)

# Add day and night variable

hour_summary$hour_num <- as.numeric(hour_summary$hour)

hour_summary$night <- "Day"

hour_summary$night[hour_summary$hour_num==0] <- "Night"
hour_summary$night[hour_summary$hour_num==1] <- "Night"
hour_summary$night[hour_summary$hour_num==2] <- "Night"
hour_summary$night[hour_summary$hour_num==3] <- "Night"
hour_summary$night[hour_summary$hour_num==4] <- "Night"
hour_summary$night[hour_summary$hour_num==5] <- "Night"
hour_summary$night[hour_summary$hour_num==22] <- "Night"
hour_summary$night[hour_summary$hour_num==23] <- "Night"


# Add percentage of tweets

hour_summary$perc <- NA

hour_summary$perc <- hour_summary$n/sum(hour_summary$n)

# Make plot

plot <- ggplot(hour_summary, aes(x=hour, y=perc, fill = night)) + geom_bar(stat="identity") + 
  coord_polar(start = 0) + # Makes bar plot circular
  scale_fill_manual(values = c("#FFC107", "#1E88E5")) +
  xlab("") + ylab("") +
  labs(title = "When do abortion campaign groups tweet?",
       subtitle = "Proportion of tweets tweeted at each hour of the day.",
       caption = "N = 641,538. Groups from Northern Ireland and Ireland") +
  ylim(-.1,max(hour_summary$perc))  +
  theme(panel.background = element_blank(),
        axis.text.y=element_blank(),  #remove y axis labels
        axis.ticks.y=element_blank(),
        legend.title = element_blank())  #remove y axis ticks

ggsave(here("output", "time_plot.png"), height = 7, width = 7)
