CREATE DATABASE IF NOT EXISTS Mkt_Analysis;

CREATE TABLE IF NOT EXISTS mkt_data(
Customer_ID INT NOT NULL PRIMARY KEY,
Income DECIMAL(7,0),
Kidhome INT,
Teenhome INT,
Days_Since_Purchase INT,
Wine_Spending INT,
Fruits_Spending INT,
Meat_Spending INT,
Fish_Spending INT,
Sweet_Spending INT,
Gold_Spending INT,
Regular_Prod_Spending INT,
Total_Spending INT,
Discount_Purchases INT,
Web_Purchases INT,
Catalog_Purchases INT,
InStore_Purchases INT,
Last_Month_Web_Visits INT,
Accptd_Camp1 TINYINT(1),
Accptd_Camp2 TINYINT(1),
Accptd_Camp3 TINYINT(1),
Accptd_Camp4 TINYINT(1),
Accptd_Camp5 TINYINT(1),
Complain TINYINT(1),
Accptd_LastCamp TINYINT(1),
Age INT NOT NULL,
Customer_Days INT,
marital_Divorced TINYINT(1),
marital_Married TINYINT(1),
marital_Single TINYINT(1),
marital_Together TINYINT(1),
marital_Widow TINYINT(1),
education_Unknown TINYINT(1),
education_Basic TINYINT(1),
education_Graduation TINYINT(1),
education_Master TINYINT(1),
education_PhD TINYINT(1),
Accptd_CampOverall INT



);

UPDATE mkt_data
SET Total_Spending = Total_Spending * 2;


-- -------------------------------------Generic Questions------------------------------------- --

-- 1. Which customers have spent the most across all product categories?

SELECT Customer_ID, Total_Spending FROM mkt_data
ORDER BY Total_Spending DESC
;


-- 2. What is the average income for each education level?

SELECT 
    CASE 
        WHEN education_Unknown = 1 THEN 'Unknown'
        WHEN education_Basic = 1 THEN 'Basic'
        WHEN education_Graduation = 1 THEN 'Graduation'
        WHEN education_Master = 1 THEN 'Master'
        WHEN education_PhD = 1 THEN 'PhD'
    END AS education_level,
    AVG(Income) AS Avg_income
FROM 
    mkt_data
GROUP BY 
    education_level;

-- 3. What percentage of customers accepted at least one campaign offer?

SELECT 
CONCAT((COUNT(CASE WHEN Accptd_CampOverall >= 1 THEN 1 END)*100) / COUNT(Accptd_CampOverall),'%') AS Percentage 
FROM mkt_data;


-- 4. How does spending vary by marital status?

SELECT 
  CASE
    WHEN marital_Divorced = 1 THEN 'Divorced'
    WHEN marital_Married = 1 THEN 'Married'
    WHEN marital_Single = 1 THEN 'Single'
    WHEN marital_Together = 1 THEN 'Together'
    WHEN marital_Widow = 1 THEN 'Widow'
END AS Marital_Status,
AVG(Total_Spending) AS Avg_Spending
FROM mkt_data
GROUP BY Marital_Status;

-- 5. What is the average age of customers who have accepted at least one campaign offer?

SELECT AVG(Age) AS Avg_age
FROM mkt_data
WHERE Accptd_CampOverall >= 1;

-- 6. How is income distributed across different marital statuses?

SELECT 
  CASE 
    WHEN marital_Divorced = 1 THEN 'Divorced'
    WHEN marital_Married = 1 THEN 'Married'
    WHEN marital_Single = 1 THEN 'Single'
    WHEN marital_Together = 1 THEN 'Together'
    WHEN marital_Widow = 1 THEN 'Widow'
END AS Marital_Status,
AVG(Income) AS Avg_income
FROM mkt_data
GROUP BY Marital_Status;

-- -------------------------------------Product-Specific Questions------------------------------------- --

-- 1. Which product categories are most popular based on total spending?


SELECT
SUM(Wine_Spending) AS 'Wine Total', 
SUM(Fruits_Spending) AS 'Fruits Total', 
SUM(Meat_Spending) AS 'Meat Total', 
SUM(Fish_Spending) AS 'Fish Total',
SUM(Sweet_Spending) AS 'Sweet Total',
SUM(Gold_Spending) AS 'Gold Total',
SUM(Regular_Prod_Spending) AS 'Regular Products Total'
FROM mkt_data
;
 
 
 #OR


SELECT 
    'Wine' AS 'Product Category', SUM(Wine_Spending) AS Total
FROM mkt_data
UNION ALL
SELECT 
    'Fruits' AS 'Product Category', SUM(Fruits_Spending) AS Total
FROM mkt_data
UNION ALL
SELECT 
    'Meat' AS 'Product Category', SUM(Meat_Spending) AS Total
FROM mkt_data
UNION ALL
SELECT 
    'Fish' AS 'Product Category', SUM(Fish_Spending) AS Total
FROM mkt_data
UNION ALL
SELECT 
    'Sweets' AS 'Product Category', SUM(Sweet_Spending) AS Total
FROM mkt_data
UNION ALL
SELECT 
    'Gold' AS 'Product Category', SUM(Gold_Spending) AS Total
FROM mkt_data
UNION ALL
SELECT 
    'Regular Products' AS 'Product Category', SUM(Regular_Prod_Spending) AS Total
FROM mkt_data
ORDER BY Total DESC;


-- 2. How does having kids or teenagers affect the total amount spent by customers?

SELECT 
    CASE 
        WHEN Kidhome >= 1 THEN 'Kids'
        ELSE 'No Kids'
    END AS Kid_Status,
    CASE 
        WHEN Teenhome >= 1 THEN 'Teenagers'
        ELSE 'No Teenagers'
    END AS Teen_Status,
    SUM(Total_Spending) AS Total_Spending
FROM 
    mkt_data
GROUP BY 
    Kid_Status, Teen_Status;

#OR

SELECT 
    IF(Kidhome >= 1, 'Kids', 'No Kids') AS Kid_Status,
    IF(Teenhome >= 1, 'Teenagers', 'No Teenagers') AS Teen_Status,
    SUM(Total_Spending) AS Total_Spending
FROM 
    mkt_data
GROUP BY 
    Kid_Status, Teen_Status;


-- 3. Do higher-income customers use discounts more or less frequently?

# SELECT AVG(Discount_Purchases) FROM mkt_data;  Avg discount used is 2.3184

SELECT Discount_Purchases, Income FROM mkt_data
ORDER BY Income DESC;


#SELECT Discount_Purchases, Income FROM mkt_data ORDER BY Income ; Lowest income use more discounts


-- -------------------------------------Customer Behaviour Questions------------------------------------- --


-- 1. Who are the customers with the most recent purchases?

SELECT Customer_ID, Days_Since_Purchase FROM mkt_data
ORDER BY Days_Since_Purchase;

-- 2. Which customers have visited the website the most in the last month?

SELECT Customer_ID, Last_Month_Web_Visits AS 'Amt of times customer visited website' FROM mkt_data
ORDER BY Last_Month_Web_Visits DESC;


-- 3. Which method of purchase (catalog or web or store) is more popular across all customers?


SELECT 
'Catalogue' AS `Method of Purchase`, SUM(Catalog_Purchases) AS Total
FROM mkt_data
UNION ALL
SELECT 
'Website' AS `Method of Purchase`, SUM(Web_Purchases) AS Total
FROM mkt_data
UNION ALL
SELECT
'Store' AS `Method of Purchase`, SUM(InStore_Purchases) AS Total
FROM mkt_data
ORDER BY Total DESC;

# Use ` or " for column aliases

-- 4. How does the success of marketing campaigns vary by age group?

# SELECT MAX(Age) FROM mkt_data - 80
# SELECT MIN(Age) FROM mkt_data - 24
# SELECT AVG(Age) FROM mkt_data - 51

ALTER TABLE mkt_data
ADD Age_Group VARCHAR(20) AFTER Age;

UPDATE mkt_data
SET Age_Group = 
  CASE
    WHEN Age BETWEEN 24 AND 35 THEN 'Young Adult'
    WHEN Age BETWEEN 36 AND 50 THEN 'Middle-aged'
    WHEN Age BETWEEN 51 AND 65 THEN 'Older Adult'
    WHEN Age BETWEEN 66 AND 80 THEN 'Senior'
    ELSE 'Unknown'
  END;


SELECT Age_Group, 
COUNT(CASE WHEN Accptd_CampOverall >= 1 THEN 1 END) AS Accepted_Campaign,
COUNT(CASE WHEN Accptd_CampOverall = 0 THEN 1 END) AS Declined_Campaign,
CONCAT(((COUNT(CASE WHEN Accptd_CampOverall >= 1 THEN 1 END)/COUNT(Accptd_CampOverall))*100),'%') AS Percentage_Acceptance
FROM mkt_data
GROUP BY Age_Group
ORDER BY Percentage_Acceptance DESC;


-- 5. What is the proportion of customers who have made complaints in the last 2 years?

SELECT CONCAT(((COUNT(CASE WHEN Complain =1 THEN 1 END)/COUNT(Complain))*100),'%') AS Percentage_of_Complains
FROM mkt_data;



