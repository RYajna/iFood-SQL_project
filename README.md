# iFood Data Analysis Project

## About
This project aims to explore the iFood sales data in order to find valuable insights so as to improve and optimize sales strategies.
The dataset can be found on [Github](https://github.com/nailson/ifood-data-business-analyst-test/tree/master).

"Consider a well-established company operating in the retail food sector. Presently they have
around several hundred thousands of registered customers and serve almost one million
consumers a year. They sell products from 5 major categories: wines, rare meat products, exotic
fruits, specially prepared fish and sweet products. These can further be divided into gold and
regular products. The customers can order and acquire products through 3 sales channels: physical
stores, catalogs and company’s website. Globally, the company had solid revenues and a healthy
bottom line in the past 3 years, but the profit growth perspectives for the next 3 years are not
promising... For this reason, several strategic initiatives are being considered to invert this
situation. One is to improve the performance of marketing activities, with a special focus on
marketing campaigns."

## Purpose of the project
The main aim of this project is to understand the data, find business opportunities & insights and to propose
any data driven action to optimize the campaigns results & generate value to the company.

## About Data

Previous Column name | New Column name | Description 
--- | --- | ---
Customer_ID | - 
Income | - | Customer's yearly income
Kidhome | - | # of kids in customer's household 
Teenhome | - | # of teenagers in customer's household 
Recency | Days_Since_Purchase | # of days since last purchase 
MntWines | Wine_Spending | amt spent on wine in last 2 years  
MntFruits | Fruits_Spending | amt spent on fruits in last 2 years  
MntMeatProducts | Meat_Spending | amt spent on Meat Products in last 2 years 
MntFishProducts | Fish_Spending | amt spent on Fish Products in last 2 years  
MntSweetProducts | Sweet_Spending | amt spent on Sweet Products in last 2 years 
MntGoldProducts | Gold_Spending | amt spent on Gold Products in last 2 years 
MntRegularProds | Regular_Prod_Spending  | amt spent on Regular Products in last 2 years 
MntTotal | Total_Spending | total amt spent last year  
NumDealsPurchases | Discount_Purchases | # of purchases made using discount 
NumWebPurchases | Web_Purchases | # of purchases made through company's website 
NumCatalogPurchases | Catalog_Purchases | # of purchases made using catalogue  
NumStorePurchases | InStore_Purchases | # of purchases made directly in stores  
NumWebVisitsMonth | Last_Month_Web_Visits | # of visits to company's website in the last month  
AcceptedCmp1 | Accptd_Camp1 | 1 If customer accepted offer in 1st campaign, 0 otherwise 
AcceptedCmp2 | Accptd_Camp2 | 1 If customer accepted offer in 2nd campaign, 0 otherwise  
AcceptedCmp3 | Accptd_Camp3 | 1 If customer accepted offer in 3rd campaign, 0 otherwise 
AcceptedCmp4 | Accptd_Camp4 | 1 If customer accepted offer in 4th campaign, 0 otherwise 
AcceptedCmp5 | Accptd_Camp5 | 1 If customer accepted offer in 5th campaign, 0 otherwise 
Complain | - | 1 If customer complained in last 2 years, 0 otherwise 
Z_CostContact | - | Unknown  
Z_Revenue | - | Unknown 
Response | Accptd_LastCamp | 1 If customer accepted offer in last campaign, 0 otherwise  
Age | - | Customer's Age  
Customer_Days | - | Unknown  
Marital_Divorced/Married/Single/Together/widow | - | Customer's marital status 
education_2n Cycle | education_Unknown | Unknown 
education_Basic/Graduation/Master/PhD | - | Customer's education level 
AcceptedCmpOverall | Accptd_CampOverall | # of times customer accepts campaign 





### Issues spotted:
1. No Primary Key --> Added Customer_ID column
2. Several column headings were not meaningful --> Changed Column headings
3. Some columns added no value to the dataset (e.g Z_CostContact only contained value 3) --> columns dropped
4. Wrong type for columns containing spendings (Wine_Spending, Fruits_Spending,...) --> Changed type to currency
5. Column Regular_Prod_Spending had 3 negative values (Perhaps customers were refunded)
6. A quick auto sum on excel of all the spending columns (Wine + Fruits + Meat + Fish + Sweets +Gold + Regular Products) revealed that the Spending is not equal to Total_Spending:

- Verification:

   I summed all the spendings in a column
   
   I then divided the spendings with Total_Spending to find that it was indeed twice the amount.

- Another interesting observation:
   
  Wine + Fruits + Meat + Fish + Sweets = Total_Spending
  
  Gold + Regular Products = Total_Spending

List of questions 

Here are the questions without the column names:


### **Questions**
1. **Total Spendings by Customer**: 
   - Which customers have spent the most across all product categories?
   
2. **Average Income by Education Level**: 
   - What is the average income for each education level?

3. **Campaign Acceptance Rate**: 
   - What percentage of customers accepted at least one campaign offer?

4. **Spending Based on Marital Status**: 
   - How does spending vary by marital status?
  
5. **Income Distribution by Marital Status**: 
   - How is income distributed across different marital statuses?

6. **Income vs Spending**: 
   - How does income and spending correlate based on marrital status?


7. **Average Age of Campaign Participants**: 
   - What is the average age of customers who have accepted at least one campaign offer?

8. **Age Group**: 
   - What is the proportion of customers in each age group?
  
     
9. **Top Product Preferences**: 
   - Which product categories are most popular based on total spending?

10. **Teen and Kid Influence on Spending**: 
   - How does having kids or teenagers affect the total amount spent by customers?

11. **Discount Usage vs. Income**: 
   - Do higher-income customers use discounts more or less frequently?


12. **Recent Customers**: 
   - Who are the customers with the most recent purchases?

13. **Customer Engagement on Website**: 
   - Which customers have visited the website the most in the last month?

14. **Method of Purchases**: 
   - Which method of purchase (catalog or web or store) is more popular across all customers/different age groups?

15. **Campaign Success by Age Group**: 
   - How does the success of marketing campaigns vary by age group?

16. **Customer Complaints**: 
   - What is the proportion of customers who have made complaints?

