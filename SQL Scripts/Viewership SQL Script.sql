SELECT *
FROM viewership
LIMIT 10;

---I have two things I want to do, 1. extract the days and time, and 2. seperate the date and time columns. 
---Since RecordDate2 is a string, first I need to covert it into a timestamp and then extract the time as segmented as I want it. 

SELECT
    UserID,
    Channel2,
    --- I use case statements to categorise Channel2 into broader channel groups.
    CASE
        WHEN Channel2 IN ('CNN', 'BBC', 'Sky News', 'eNCA') THEN 'News'
        WHEN Channel2 IN ('ESPN', 'SuperSport', 'Sky Sports', 'SuperSport Blitz', 'Supersport Live Events', 'ICC Cricket World Cup 2011') THEN 'Sports'
        WHEN Channel2 IN ('MTV', 'Channel O', 'Trace TV') THEN 'Music'
        WHEN Channel2 IN ('Cartoon Network', 'Disney', 'Nickelodeon', 'Boomerang') THEN 'Kids'
        WHEN Channel2 IN ('HBO', 'Netflix', 'M-Net', 'Showmax', 'Africa Magic', 'Vuzu', 'E! Entertainment', 'KykNet','M-Net') THEN 'Entertainment'
        ELSE 'Other'
    END AS Channel_Category,

    RecordDate2,

    --- I covert to timestamp and adjust from UTC to SAST (date related columns).
    DATE_FORMAT(from_utc_timestamp(to_timestamp(RecordDate2, 'yyyy/MM/dd HH:mm'), 'Africa/Johannesburg'), 'yyyy-MM-dd') AS Record_Date,
    DATE_FORMAT(from_utc_timestamp(to_timestamp(RecordDate2, 'yyyy/MM/dd HH:mm'), 'Africa/Johannesburg'), 'MMMM') AS Month_Name,
    DATE_FORMAT(from_utc_timestamp(to_timestamp(RecordDate2, 'yyyy/MM/dd HH:mm'), 'Africa/Johannesburg'), 'EEEE') AS DayOfWeek,

--- I use case statements to categorise dates as Weekend and Weekday categories. 
    CASE 
        WHEN DATE_FORMAT(from_utc_timestamp(to_timestamp(RecordDate2, 'yyyy/MM/dd HH:mm'), 'Africa/Johannesburg'), 'EEEE') IN ('Saturday', 'Sunday') THEN 'Weekend'
        ELSE 'Weekday'
    END AS Day_Type,

--- I covert to timestamp and adjust from UTC to SAST (time related columns).
    DATE_FORMAT(from_utc_timestamp(to_timestamp(RecordDate2, 'yyyy/MM/dd HH:mm'), 'Africa/Johannesburg'), 'HH:mm') AS Record_Time,

--- I use case statements to categories time into Morning, Afternoon, Evenings & Night.  
    CASE 
        WHEN HOUR(from_utc_timestamp(to_timestamp(RecordDate2, 'yyyy/MM/dd HH:mm'), 'Africa/Johannesburg')) BETWEEN 5 AND 11 THEN 'Morning'
        WHEN HOUR(from_utc_timestamp(to_timestamp(RecordDate2, 'yyyy/MM/dd HH:mm'), 'Africa/Johannesburg')) BETWEEN 12 AND 16 THEN 'Afternoon'
        WHEN HOUR(from_utc_timestamp(to_timestamp(RecordDate2, 'yyyy/MM/dd HH:mm'), 'Africa/Johannesburg')) BETWEEN 17 AND 20 THEN 'Evening'
        ELSE 'Night'
    END AS Time_Category,

    Duration2,

--- I use this segment to get the actual duration because the Duration2 column is a bit too long.
    DATE_FORMAT(Duration2, 'HH:mm:ss') AS Duration_Clean,
    HOUR(Duration2) AS Hours,
    MINUTE(Duration2) AS Minutes,
    SECOND(Duration2) AS Seconds

FROM viewership;
