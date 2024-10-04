# iFood-project

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


### **Generic Questions**
1. **Total Spendings by Customer**: 
   - Which customers have spent the most across all product categories?
   
2. **Average Income by Education Level**: 
   - What is the average income for each education level?

3. **Campaign Acceptance Rate**: 
   - What percentage of customers accepted at least one campaign offer?

4. **Spending Based on Marital Status**: 
   - How does spending vary by marital status?

5. **Average Age of Campaign Participants**: 
   - What is the average age of customers who have accepted at least one campaign offer?



6. **Income Distribution by Marital Status**: 
   - How is income distributed across different marital statuses?


### **Product-Specific**
1. **Top Product Preferences**: 
   - Which product categories are most popular based on total spending?

2. **Teen and Kid Influence on Spending**: 
   - How does having kids or teenagers affect the total amount spent by customers?

3. **Discount Usage vs. Income**: 
   - Do higher-income customers use discounts more or less frequently?

### **Customer Behavior**
1. **Recent Customers**: 
   - Who are the customers with the most recent purchases?

2. **Customer Engagement on Website**: 
   - Which customers have visited the website the most in the last month?

3. **Catalog vs. Web Purchases**: 
   - Which method of purchase (catalog or web) is more popular across all customers?

4. **Campaign Success by Age Group**: 
   - How does the success of marketing campaigns vary by age group?

5. **Customer Complaints**: 
   - What is the proportion of customers who have made complaints?

