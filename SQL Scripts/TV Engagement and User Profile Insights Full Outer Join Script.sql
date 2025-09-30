---I am using a full outter join as my primary data source for the dashboard.
--- I have combined the processed BrightTV User Profiles and Viewership Data

SELECT 
    -- USER PROFILE DETAILS
    up.UserID,
    CONCAT(up.Name, ' ', up.Surname) AS Full_Name,
    up.Gender,
    up.Race,
    up.Age,
    CASE
        WHEN up.Age < 13 THEN 'Child'
        WHEN up.Age BETWEEN 13 AND 17 THEN 'Teen'
        WHEN up.Age BETWEEN 18 AND 34 THEN 'Young Adult'
        WHEN up.Age BETWEEN 35 AND 59 THEN 'Adult'
        ELSE 'Senior'
    END AS Age_Group,
    CASE
        WHEN up.Age < 18 THEN 'Under 18'
        WHEN up.Age BETWEEN 18 AND 24 THEN '18–24'
        WHEN up.Age BETWEEN 25 AND 34 THEN '25–34'
        WHEN up.Age BETWEEN 35 AND 44 THEN '35–44'
        WHEN up.Age BETWEEN 45 AND 54 THEN '45–54'
        WHEN up.Age BETWEEN 55 AND 64 THEN '55–64'
        ELSE '65+'
    END AS Age_Category,
    REPLACE(up.Email, '  ', '') AS Clean_Email,
    REPLACE(up.Social_Media_Handle, '  ', '') AS Clean_Handle,
    REPLACE(up.Name, '  ', '') AS Clean_Name,
    up.Province,

    -- ACCOUNT ACTIVITY STATUS
    CASE 
        WHEN vw.UserID IS NOT NULL THEN 'Active'
        ELSE 'Inactive'
    END AS Account_Status,

    -- VIEWERSHIP DETAILS
    vw.Channel2,
    CASE
        WHEN vw.Channel2 IN ('CNN', 'BBC', 'Sky News', 'eNCA') THEN 'News'
        WHEN vw.Channel2 IN ('ESPN', 'SuperSport', 'Sky Sports', 'SuperSport Blitz', 'Supersport Live Events', 'ICC Cricket World Cup 2011') THEN 'Sports'
        WHEN vw.Channel2 IN ('MTV', 'Channel O', 'Trace TV') THEN 'Music'
        WHEN vw.Channel2 IN ('Cartoon Network', 'Disney', 'Nickelodeon', 'Boomerang') THEN 'Kids'
        WHEN vw.Channel2 IN ('HBO', 'Netflix', 'M-Net', 'Showmax', 'Africa Magic', 'Vuzu', 'E! Entertainment', 'KykNet', 'M-Net') THEN 'Entertainment'
        ELSE 'Other'
    END AS Channel_Category,

    vw.RecordDate2,
    DATE_FORMAT(from_utc_timestamp(to_timestamp(vw.RecordDate2, 'yyyy/MM/dd HH:mm'), 'Africa/Johannesburg'), 'yyyy-MM-dd') AS Record_Date,
    DATE_FORMAT(from_utc_timestamp(to_timestamp(vw.RecordDate2, 'yyyy/MM/dd HH:mm'), 'Africa/Johannesburg'), 'MMMM') AS Month_Name,
    DATE_FORMAT(from_utc_timestamp(to_timestamp(vw.RecordDate2, 'yyyy/MM/dd HH:mm'), 'Africa/Johannesburg'), 'EEEE') AS DayOfWeek,

    CASE 
        WHEN DATE_FORMAT(from_utc_timestamp(to_timestamp(vw.RecordDate2, 'yyyy/MM/dd HH:mm'), 'Africa/Johannesburg'), 'EEEE') IN ('Saturday', 'Sunday') THEN 'Weekend'
        ELSE 'Weekday'
    END AS Day_Type,

    DATE_FORMAT(from_utc_timestamp(to_timestamp(vw.RecordDate2, 'yyyy/MM/dd HH:mm'), 'Africa/Johannesburg'), 'HH:mm') AS Record_Time,

    CASE 
        WHEN HOUR(from_utc_timestamp(to_timestamp(vw.RecordDate2, 'yyyy/MM/dd HH:mm'), 'Africa/Johannesburg')) BETWEEN 5 AND 11 THEN 'Morning'
        WHEN HOUR(from_utc_timestamp(to_timestamp(vw.RecordDate2, 'yyyy/MM/dd HH:mm'), 'Africa/Johannesburg')) BETWEEN 12 AND 16 THEN 'Afternoon'
        WHEN HOUR(from_utc_timestamp(to_timestamp(vw.RecordDate2, 'yyyy/MM/dd HH:mm'), 'Africa/Johannesburg')) BETWEEN 17 AND 20 THEN 'Evening'
        ELSE 'Night'
    END AS Time_Category,

    vw.Duration2,
    DATE_FORMAT(vw.Duration2, 'HH:mm:ss') AS Duration_Clean,
    HOUR(vw.Duration2) AS Hours,
    MINUTE(vw.Duration2) AS Minutes,
    SECOND(vw.Duration2) AS Seconds

FROM user_profiles AS up
FULL OUTER JOIN viewership AS vw
    ON up.UserID = vw.UserID;
