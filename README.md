# consumer-complaints--SQL-analysis

🏦 Bank of America Consumer Complaints Analysis
📌 Project Overview

This project analyzes consumer complaints data for Bank of America using SQL queries.
The goal is to extract insights on complaint trends, resolution status, product-level issues, and timeliness to help management improve customer experience and operational efficiency.

🎯 Objectives

Analyze complaints volume over time (monthly/yearly trends).

Identify top complaint products and common issues.

Track complaint resolution status and timeliness.

Measure effectiveness of complaint handling.

Provide actionable insights to improve customer satisfaction.

📂 Dataset

The dataset contains consumer complaints from 2017–2023 with the following key columns:
Data: https://github.com/yogini314555/consumer-complaints--SQL-analysis/blob/main/Consumer_Complaints_Cleaned.csv

Column	Description
complaint_id	Unique identifier for each complaint
date_received	Date the complaint was received
product	Type of product (e.g., Mortgage, Credit card, Bank account)
sub_product	Subcategory of the product
issue	The complaint issue
sub_issue	Detailed issue (if available)
company_response	Response provided by the company
timely_response	Whether the response was timely (Yes/No)
consumer_disputed	Whether the consumer disputed the response
state	US state where complaint originated

Download the dataset:

From this repository: 📄https://github.com/yogini314555/consumer-complaints--SQL-analysis/blob/main/Consumer_Complaints_Cleaned.csv



🔍 Analysis Performed
Using SQL

Data Cleaning & Preparation:

Remove duplicates and handle missing values.

Complaint Trend Analysis:

Total complaints by year, month, and state.

Trend of complaints over time to identify spikes.

Product-Level Analysis:

Top complaint products and sub-products.

Common issues reported per product.

Resolution Analysis:

Count of complaints resolved vs unresolved.

Average timeliness of response.

Consumer Dispute Analysis:

Complaints disputed by consumers by product.

📊 Tools & Technologies

SQL (MySQL / PostgreSQL / SQLite) → Data extraction, aggregation, and analysis

Database management system → Used for querying and visualization of results

📈 Key Insights

Mortgage and Credit Card complaints account for majority of complaints.

Certain states report higher complaint volumes, indicating regional challenges.

Most complaints are resolved timely, but a small percentage remains unresolved.

Common issues include loan servicing, billing disputes, and account management.

Consumer disputes are more frequent in complex product issues like mortgages.

💡 Recommendations

Focus on improving loan servicing processes to reduce complaints.

Strengthen billing dispute handling for credit card products.

Track complaint resolution timeliness by region to identify bottlenecks.

Provide customer education for common complaint areas to reduce disputes.

Regularly monitor top complaint products to preempt emerging issues.

🚀 How to Run

Clone the repository:

git clone https://github.com/your-username/boa-consumer-complaints.git


Load dataset into your SQL database:

-- Example for PostgreSQL
CREATE TABLE complaints (
    complaint_id SERIAL PRIMARY KEY,
    date_received DATE,
    product VARCHAR(100),
    sub_product VARCHAR(100),
    issue VARCHAR(255),
    sub_issue VARCHAR(255),
    company_response VARCHAR(255),
    timely_response VARCHAR(10),
    consumer_disputed VARCHAR(10),
    state VARCHAR(50)
);

COPY complaints FROM './data/Bank_of_America_Complaints.csv' DELIMITER ',' CSV HEADER;


Open https://github.com/yogini314555/consumer-complaints--SQL-analysis/blob/main/finalsqlconsumer%20complaints.sql to explore:

Complaint trends

Product-level insights

Resolution and dispute analysis

📌 Project Structure
boa-consumer-complaints/
│── data/                
│   └── Bank_of_America_Complaints.csv   # Raw dataset  
│
│── sql/                 
│   └── queries.sql                       # SQL queries for analysis  
│
│── images/              
│   └── charts/                          # Optional screenshots of query results  
│
│── README.md                              # Project documentation  

📸 Query Result Preview

<img width="1386" height="768" alt="image" src="https://github.com/user-attachments/assets/fdf94577-0a99-4a9a-a73b-20785b65e34e" />
<img width="1381" height="761" alt="image" src="https://github.com/user-attachments/assets/ca077a00-e74a-4d9c-98eb-3e69850302df" />



🙌 Acknowledgements

Dataset: Consumer Complaint Database

Tools: SQL only

Inspired by real-world banking analytics & customer experience management
