---BrightTV User Profiles Data Exploration.
SELECT * FROM user_profiles
LIMIT 10;



---I will attempt to remove the spaces in the Name, Email and Social_Media_Handle fields.
UPDATE user_profiles
SET Social_Media_Handle = REPLACE(Social_Media_Handle, '  ', ''),
    Email = REPLACE(Email, '  ', ''),
    Name = REPLACE(Name, '  ', '');

---I will now use case statements to create age categories
SELECT
  MIN(Age) AS youngest_age,
  MAX(Age) AS oldest_age
FROM user_profiles;

SELECT 
    UserID,
    Name,
    Surname,
    Email,
    Gender,
    Race,
    Province,
    Social_Media_Handle,
    Age,
    CASE
        WHEN Age < 13 THEN 'Child'
        WHEN Age BETWEEN 13 AND 17 THEN 'Teen'
        WHEN Age BETWEEN 18 AND 34 THEN 'Young Adult'
        WHEN Age BETWEEN 35 AND 59 THEN 'Adult'
        ELSE 'Senior'
    END AS Age_Group,
    CASE
        WHEN Age < 18 THEN 'Under 18'
        WHEN Age BETWEEN 18 AND 24 THEN '18–24'
        WHEN Age BETWEEN 25 AND 34 THEN '25–34'
        WHEN Age BETWEEN 35 AND 44 THEN '35–44'
        WHEN Age BETWEEN 45 AND 54 THEN '45–54'
        WHEN Age BETWEEN 55 AND 64 THEN '55–64'
        ELSE '65+'
    END AS Age_Category
FROM user_profiles
LIMIT 10;

---I will now update the table permanently, to include these columns. 
---First, I add the actual columns.

ALTER TABLE user_profiles 
ADD COLUMNS (Age_Group STRING);

UPDATE user_profiles
SET Age_Group = CASE
    WHEN Age < 13 THEN 'Child'
    WHEN Age BETWEEN 13 AND 17 THEN 'Teen'
    WHEN Age BETWEEN 18 AND 34 THEN 'Young Adult'
    WHEN Age BETWEEN 35 AND 59 THEN 'Adult'
    ELSE 'Senior'
END;

ALTER TABLE user_profiles
ADD COLUMNS (Age_Category STRING);

UPDATE user_profiles
SET Age_Category = CASE
    WHEN Age < 18 THEN 'Under 18'
    WHEN Age BETWEEN 18 AND 24 THEN '18–24'
    WHEN Age BETWEEN 25 AND 34 THEN '25–34'
    WHEN Age BETWEEN 35 AND 44 THEN '35–44'
    WHEN Age BETWEEN 45 AND 54 THEN '45–54'
    WHEN Age BETWEEN 55 AND 64 THEN '55–64'
    ELSE '65+'
END;

-- Add the new column
ALTER TABLE user_profiles 
ADD COLUMNS (Full_Name STRING);

-- Populate the new column with Name + Surname
UPDATE user_profiles
SET Full_Name = CONCAT(Name, ' ', Surname);

---Test, I am organising the columns in a logical order, that looks and reads better.
SELECT
    UserID,
    Full_Name,
    Gender,
    Race,
    Age,
    Age_Group,
    Age_Category,
    Email,
    Social_Media_Handle,
    Province
FROM user_profiles;

