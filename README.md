# Google_Data_Analytics_Capstone: Cyclistic
## <u> Case Background </u>


As a junior data analyst, working in the marketing analyst team at Cyclistic (a bike-share company in Chicago), I have been assigned with a task for finding out how do annual members and casual riders use Cyclistic bikes differently? The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. From these insights, our team will design a new marketing strategy to convert casual riders into annual members and providing recommendations which are backed up with compelling data insights and professional data visualizations.

## <u> Scope of Work </u>


<img src="https://github.com/srushtidesaii/Google_Data_Analytics_Capstone/blob/master/Scope_of_Work.png" width="800" height="700">

## <u> Define and discuss the project statement </u>

### Business Background
<p style='text-align: left;'> 
Business Model:

- Product: bike-sharing geotracked and network locked bikes across Chicago <br>
- Customer types and revenue model: members (annual subscribers) and casual riders (single-ride and full-day purchasers)<br>
- Competitive advantages: Bicycle variety (broad consumer segments) and pricing flexibility<br>
</p>


Product Background:

- 5,824 bicycles and 692 docking stations <br>
- More than 50% of riders select traditional bikes <br>
- 8% of riders opt for the assistive bike options <br>
- 30% of users bike to commute to work each day <br>
- Users are more likely to ride for leisure <br>
- Casual riders have chosen Cyclistic for their mobility needs <br>

### Problem Statement

Cyclistic  is no longer able to solely rely on their traditional marketing strategies of  appealing to a variety of needs with flexible price points and diverse product choices. In the interest of company growth, the director of marketing believes that Cyclistic should capitalize on the profit margins of annual subscribers by persuading casual customers to become yearly subscribers. Considering this, we need to analyze how and why Cyclistic casual bikers and members differ to check any evidence, opportunities and barriers to any future conversion strategy.


## <u> Extract and Prepare data for Data Expoloration  </u>

The data that we will be using is Cyclistic’s historical trip data from last 12 months (December-2020 to November-2021). The data has been made available by Motivate International Inc. on this [link](https://divvy-tripdata.s3.amazonaws.com/index.html).

The dataset consists of 12 CSV files (each for a month) with 13 columns and more than 4 million rows.

ROCCC approach is used to determine the credibility of the data

- Reliable – It is complete and accurate and it represents all bike rides taken in the city of Chicago for the selected duration of our analysis.
- Original - The data is made available by Motivate International Inc. which operates the city of Chicago’s Divvy bicycle sharing service which is powered by Lyft.
- Comprehensive - the data includes all information about ride details including starting time, ending time, station name, station ID, type of membership and many more.
- Current – It is up-to-date as it includes data until end of November 2021
- Cited - The data is cited and is available under Data License Agreement.

### Data Limitation

A quick filtering and checking data for completeness shows that “start station name and ID” and “end station name and ID” for some rides are missing. Further observations suggest that the most missing data about “start station name” belongs to “electric bikes” as 201,975 out of 888,490 electric ride shares have missing data and it accounts for 22% of total electric-bike ride shares.

This limitation could slightly affect our analysis for finding stations where most electric-bikes are taken but we can use “end station names” to locate our customers and this can be used for further analysis and potential marketing campaigns. 



## <u> Process the data for analysis  </u>
Before starting the analysis phase, it is necessary to make sure data is clean, free of error and in the right format.
- Click [here](https://github.com/srushtidesaii/Google_Data_Analytics_Capstone/blob/master/Analysis%20%26%20Visualization(Using%20R)/Data_Cleaning_Script.R) to view the Data Cleaning Script in R programmning language

## <u> Analyzing Data  </u>
Performed data aggregation and data analysis using R Programming.

- Click [here](https://github.com/srushtidesaii/Google_Data_Analytics_Capstone/blob/master/Analysis%20%26%20Visualization(Using%20R)/Data_Analyzing_Visualization_Script.R) to view the R script and the summary of complete analysis process

Further analysis were carried out to perform calculations, identify trends and relationships using PivotTable and Charts using Microsoft Excel.

- Click [here](https://github.com/srushtidesaii/Google_Data_Analytics_Capstone/tree/master/Visualization%20(Excel)/) to view individual Excel files used for analysis and visualization

## <u> Share key findings with stakeholders  </u>

Tableau Public is used for data visualization and sharing key findings.
- Click [here](https://public.tableau.com/views/CyclistCaseStudy_16411305889710/Dashboard1?:language=en-US&:display_count=n&:origin=viz_share_link) to view the Tableau Dashboard

## <u> Act on key findings  </u>

Summary of key findings from Tableau visualization
- Casual riders take less number of rides but for longer durations on weekdays.
- Casual Riders are most active on weekends, and for the months of July and August.
- The top station visit by casual riders mostly are tourist locations which implies that the casual riders can most likely are students, tourists, or family.

Here are my top 3 recommendations based on above key insights :

- On becoming a member, we can offer rewards/discounts to users who takes longer rides

- Designing seasonal packages especially during the months of July and August or weekend only membership which allows flexibility and encourages casual riders to get membership for specific periods

- Planning logical and practical marketing strategies by targeting casual riders at the busiest times and stations:

    Days: Weekends <br>
    Months:  June, July and August<br>
    Stations: Streeter Dr & Grand Ave, Millennium Park and Michigan Ave & Oak Street
