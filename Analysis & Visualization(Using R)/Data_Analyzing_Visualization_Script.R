

# Descriptive analysis on ride_length - figures in seconds (mean, median, max, min, quartile)
summary(merged_all_trips$ride_length)



#Compare casual and member users: mean ride_length (Can be written in 3 formats)
aggregate(merged_all_trips$ride_length ~ merged_all_trips$member_casual, FUN = mean)
aggregate(merged_all_trips$ride_length, by = list(merged_all_trips$member_casual), FUN = mean, na.rm = TRUE)
merged_all_trips %>% group_by(member_casual) %>% drop_na() %>% summarize(mean_ride_length = mean(ride_length))


#Compare casual and member users: median, max, min of ride_length
aggregate(merged_all_trips$ride_length ~ merged_all_trips$member_casual, FUN = median)
aggregate(merged_all_trips$ride_length ~ merged_all_trips$member_casual, FUN = max)
aggregate(merged_all_trips$ride_length ~ merged_all_trips$member_casual, FUN = min)



#Average ride length time by each day for member vs casual users
aggregate(merged_all_trips$ride_length ~ merged_all_trips$member_casual + merged_all_trips$day_of_week, FUN = mean)



#Sorting the day of the week in correct order
merged_all_trips$day_of_week <- ordered(merged_all_trips$day_of_week,levels= c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))



#Analyzing ridership data by type and each day of the week (number of rides)
v1 <- merged_all_trips  %>% group_by(member_casual,day_of_week) %>% summarize(number_of_rides = n()) %>% arrange(member_casual,day_of_week)
write_csv(v1,"v1.csv")


#Analyzing ridership data by type and each day of the week (average duration)
v2 <- merged_all_trips  %>% group_by(member_casual,day_of_week) %>% summarize(average_duration = mean(ride_length)) %>% arrange(member_casual,day_of_week)
write_csv(v2,"v2.csv")

#Analyzing ridership data by user type and weekdays (Number of rides on Monday,Tuesday,Wednesday,Thursday,Friday)
v3 <- merged_all_trips %>% select(member_casual,day_of_week,ride_length) %>% filter(day_of_week == "Monday" |day_of_week =="Tuesday"|day_of_week =="Wednesday"|day_of_week =="Thursday"|day_of_week =="Friday") %>% rename(weekdays = day_of_week) %>% group_by(member_casual) %>% summarize(number_of_rides_on_weekdays = n()) %>% arrange(member_casual)
write_csv(v3,"summary_number_of_ride_weekdays.csv")


#Analyzing ridership data by user type and weekdays (Average duration on Monday,Tuesday,Wednesday,Thursday,Friday)
v4 <- merged_all_trips %>% select(member_casual,day_of_week,ride_length) %>% filter(day_of_week == "Monday" |day_of_week =="Tuesday"|day_of_week =="Wednesday"|day_of_week =="Thursday"|day_of_week =="Friday") %>% rename(weekdays = day_of_week) %>% group_by(member_casual) %>% summarize(average_duration_on_weekdays = mean(ride_length)) %>% arrange(member_casual)
write_csv(v4,"v4.csv")


#Analyzing ridership data by user type and weekends (Number of rides on Saturday,Sunday)
v5 <- merged_all_trips %>% select(member_casual,day_of_week,ride_length) %>% filter(day_of_week == "Saturday" |day_of_week =="Sunday") %>% rename(weekends = day_of_week) %>% group_by(member_casual) %>% summarize(number_of_rides_on_weekends = n()) %>% arrange(member_casual)
write_csv(v5,"summary_number_of_ride_weekends.csv")



#Analyzing ridership data by user type and weekends (Average duration on Saturday,Sunday)
v6<- merged_all_trips %>% select(member_casual,day_of_week,ride_length) %>% filter(day_of_week == "Saturday" |day_of_week =="Sunday") %>% rename(weekends = day_of_week) %>% group_by(member_casual) %>% summarize(average_duration_on_weekends = mean(ride_length)) %>% arrange(member_casual)
write_csv(v6,"v6.csv")



#Analyzing ridership data by user type for monthly basis (number of duration)
v7 <- merged_all_trips %>% mutate(month = month(started_at, label = TRUE)) %>% group_by(member_casual,month) %>% summarise(number_of_rides = n()) %>% arrange(member_casual,month)
write_csv(v7,"summary_number_of_ride_monthly.csv")



#Analyzing ridership data by user type for monthly basis (Average duration )
v8 <- merged_all_trips %>% mutate(month = month(started_at, label = TRUE)) %>% group_by(member_casual,month) %>% summarise(average_duration = mean(ride_length)) %>% arrange(member_casual,month)
write_csv(v8,"summary_average_ride_duration_monthly.csv")



#Analyzing the stations most used by each user group (for casual user)
v9 <- merged_all_trips %>% mutate(station = start_station_name) %>%  drop_na(start_station_name) %>% group_by(start_station_name, member_casual) %>%  summarise(number_of_rides = n()) %>% filter(member_casual=="casual" ) %>% arrange(-number_of_rides,member_casual)
v10 <- head(v9,5)
write_csv(v10,"v10.csv")





#Visualization of ridership data by type and each day of the week (number of rides)
v1 %>% ggplot(aes(x=day_of_week, y= number_of_rides,group = member_casual)) +geom_line(aes(linetype = member_casual,color=member_casual)) + geom_point(aes(color=member_casual))



#Visualization of ridership data by type and each day of the week (average duration)
v2 %>% ggplot(aes(x=day_of_week, y= average_duration,group = member_casual)) +geom_line(aes(linetype = member_casual,color=member_casual)) + geom_point(aes(color=member_casual))



#Visualization of ridership data by user type and weekends (Number of rides on Monday,Tuesday,Wednesday,Thursday,Friday)
v3 %>% ggplot(aes(x=member_casual, y= number_of_rides_on_weekdays,fill= member_casual)) +geom_col()


#Visualization of ridership data by user type and weekdays (Average duration on Monday,Tuesday,Wednesday,Thursday,Friday)
v4 %>% ggplot(aes(x=member_casual, y= average_duration_on_weekdays,fill= member_casual)) +geom_col()



#Visualization of ridership data by user type and weekends (Number of rides on Saturday,Sunday)
v5 %>% ggplot(aes(x=member_casual, y= number_of_rides_on_weekends,fill= member_casual)) +geom_col()



#Visualization of ridership data by user type and weekends (Saturday,Sunday)
v6 %>% ggplot(aes(x=member_casual, y= average_duration_on_weekends,fill= member_casual)) +geom_col()



#Visualization of ridership data by user type for monthly basis (number of duration)
v7 %>% ggplot(aes(x=month, y= number_of_rides,group = member_casual)) +geom_line(aes(linetype = member_casual,color=member_casual)) + geom_point(aes(color=member_casual))


#Visualization of ridership data by user type for monthly basis (Average duration )
v8 %>% ggplot(aes(x=month, y= average_duration,group = member_casual)) +geom_line(aes(linetype = member_casual,color=member_casual)) + geom_point(aes(color=member_casual))



#Visualization of the stations most used by each user group (casual users)
v10 %>% ggplot(aes(x=start_station_name, y= number_of_rides,fill= start_station_name)) +geom_col() 

