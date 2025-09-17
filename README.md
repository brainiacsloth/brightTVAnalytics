# BrightTV Analytics

## 📌 Objectives of the Assessment
The goal of this assessment was to help BrightTV’s leadership team uncover insights that would guide the growth of the subscription base. Specifically, the analysis focused on:

- Understanding **user and usage trends**  
- Identifying the **factors influencing consumption**  
- Recommending **content strategies** to boost consumption during low-activity periods**  
- Suggesting **initiatives to grow the user base**

To achieve this, I worked with two key datasets: **Viewership data** and **User Profiles data**. I also mapped the workflow and project milestones using **MIRO**.

---

## 📊 Viewership Data Work
I began by exploring the viewership dataset and applied several transformations to make it more insightful:

- **Date and Time Handling**  
  - Converted the original date strings into proper timestamps.  
  - Adjusted time from UTC to South African Standard Time (SAST).  
  - Split these timestamps into separate fields: date, month name, and day of week.  

- **Day Classification**  
  - Categorised days as **Weekday** or **Weekend** to reveal viewing behaviour differences.  

- **Time Segmentation**  
  - Extracted session times and grouped them into four buckets: **Morning, Afternoon, Evening, and Night**.  

- **Channel Categorisation**  
  - Grouped individual channels into broader categories such as **News, Sports, Music, Kids, Entertainment, and Other**.  

- **Duration Cleanup**  
  - Reformatted session duration into a standard `HH:mm:ss` format.  
  - Extracted hours, minutes, and seconds separately to allow more flexible analysis of viewing lengths.  

These changes provided a structured dataset that made it easier to identify trends, such as which content categories dominate evenings, or how weekends differ from weekdays.

---

## 👤 User Profiles Data Work
The user profiles dataset contained demographic and personal details. I focused on cleaning and enriching it:

- **Data Cleaning**  
  - Removed unnecessary spaces from name, email, and social media handle fields for consistency.  

- **Age Grouping**  
  - Created two layers of age classification:  
    - **Broad Age Groups**: Child, Teen, Young Adult, Adult, Senior  
    - **Detailed Age Categories**: Under 18, 18–24, 25–34, 35–44, 45–54, 55–64, 65+  

- **Structural Enhancements**  
  - Added new columns for `Age_Group` and `Age_Category` to the dataset.  
  - Created a `Full_Name` column by combining first and last names.  
  - Reorganised the column order to improve readability and usability.  

The result was a cleaned and enriched dataset that allows demographic insights to be connected more directly with viewing behaviour.

---

## 🗂️ Project Planning in MIRO
Alongside the data work, I built an **extensive project plan in MIRO**. This plan:  

- Outlined the steps of the BrightTV case study, from initial data exploration to final presentation.  
- Mapped dependencies between tasks to ensure the project was structured and efficient.  
- Highlighted key milestones and deliverables to manage timelines effectively.  

The MIRO plan provided a clear roadmap that ensured all data analysis steps aligned with BrightTV’s strategic goal of subscription growth.

---

## 🚀 Outcomes
With both datasets cleaned and transformed, the foundation is now set to:

- Identify **when and what users are watching**  
- Connect **demographics to viewing habits**  
- Spot **patterns across days, times, and content categories**  

These structured insights will directly support BrightTV in designing content strategies and initiatives aimed at increasing user engagement and growing the subscription base.
