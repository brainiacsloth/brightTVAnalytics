# BrightTV Analytics

## Objectives of the Assessment
The goal of this assessment was to help **BrightTV’s leadership team** uncover insights to guide the **growth of their subscription base**. Specifically, the analysis focused on:

- Understanding **user and usage trends**  
- Identifying **factors influencing consumption**  
- Recommending **content strategies** to boost low-activity periods**  
- Suggesting **initiatives to grow the user base**

To achieve this, I worked with two key datasets: **Viewership Data** and **User Profiles Data**.  
The overall project plan and milestones were structured and tracked in **MIRO**.

---

## Viewership Data Work
The viewership dataset was transformed to reveal time-based and behavioural insights.

### Date and Time Handling
- Converted original date strings into proper **timestamps**.  
- Adjusted time zones from **UTC** to **SAST (South Africa Standard Time)**.  
- Split timestamps into separate fields: **Record_Date**, **Month_Name**, and **DayOfWeek**.  

### Day Classification
- Categorised days as **Weekday** or **Weekend** to reveal viewing behaviour differences.  

### Time Segmentation
- Extracted viewing times and grouped them into four buckets: **Morning**, **Afternoon**, **Evening**, and **Night**.  

### Channel Categorisation
- Grouped individual channels into broader categories such as **News**, **Sports**, **Music**, **Kids**, **Entertainment**, and **Other**.  

### Duration Cleanup
- Reformatted session duration into a standard `HH:mm:ss` format.  
- Extracted hours, minutes, and seconds to enable flexible analysis of viewing length.  

These transformations created a structured dataset that helped identify **when and what audiences watch**, and how **viewing behaviour differs between weekdays and weekends**.

---

## User Profiles Data Work
The user profile dataset contained demographic and personal details. I focused on cleaning and enriching it for better integration.

### Data Cleaning
- Removed unnecessary spaces from **Name**, **Email**, and **Social_Media_Handle** fields for consistency.  

### Age Grouping
- Created two layers of age classification for richer demographic segmentation:  
  - **Broad Age Groups:** Child, Teen, Young Adult, Adult, Senior  
  - **Detailed Age Categories:** Under 18, 18–24, 25–34, 35–44, 45–54, 55–64, 65+  

### Structural Enhancements
- Added new columns for **Age_Group** and **Age_Category**.  
- Created a **Full_Name** column by combining **Name** and **Surname**.  
- Reorganised the column order to improve readability and usability.  

These steps made the dataset more robust, enabling demographic insights to link directly to viewing behaviour.

---

## Dashboard Insights
The final analysis was visualised through a **two-page Databricks dashboard**, combining both datasets using a **Full Outer Join**.  
This ensured that **all users were represented**, including those with incomplete viewership data.

### Overview Page
- Displays **demographic distribution** and **engagement overview**.  
- Highlights that **Young Adults** and **Male viewers** dominate engagement.  
- Shows **Gauteng** and **Western Cape** as the top provinces.  
- Identifies **Sports** and **Entertainment** as the most-watched channel categories.  

### Engagement Insights Page
- Analyses **viewing patterns** by **Day of Week**, **Time Category**, and **Channel**.  
- Reveals that activity peaks in the **Afternoon** and **Evening**, particularly on **Weekends**.  
- Shows **Sports** content driving the **longest average viewing durations**.  

> **Note:** I did **not drop null values**, as they did not represent missing `UserID`s but other incomplete fields (e.g. age, email, or province).  
> These profiles likely represent **incomplete but valid accounts**, so retaining them ensures the analysis reflects the full user base.

---

## Project Planning in MIRO
Alongside the data work, an **end-to-end project plan** was created in **MIRO** that:

- Outlined the full process from **data exploration** to **final dashboard delivery**.  
- Mapped **task dependencies** to ensure a structured workflow.  
- Highlighted **key milestones** and **deliverables** for progress tracking.  

The MIRO plan ensured that all analytical steps aligned with **BrightTV’s strategic objective** of driving user growth through data-driven insights.
