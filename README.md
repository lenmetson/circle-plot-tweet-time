# Replication code for circular bar plot. 



I can't upload the raw data but I have uploaded to code to make the plot as well as the processed data. 

To replicate with your own dataset of tweets, you need to extract the `created_at` meta data and save it to a variable called `tweets_time`. Then run the following code to create the hour summary: 

```
tweets_time$hour <- substring(tweets_time$time, 12,13) # Extract hour from timestamp

hour_summary <- tweets_time %>% # Summarise by hour and count tweets tweeted at that hour 
  group_by(hour) %>%
  summarise(n=n())
```
