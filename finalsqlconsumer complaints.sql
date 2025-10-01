SELECT * FROM bank.consumer_complaints_cleaned;
#Seasonal Trends analysis.
#1.1 Are there any months when consumer complaints spike?
select count(*) as consumer_complaint,
monthname(`date submitted`) as months
from consumer_complaints_cleaned
group by months
order by consumer_complaint desc limit 1;
# 1.2 Can you identify patterns across years?
select count(*) as total_complaint,
year(`date submitted`) as complaint_year
from consumer_complaints_cleaned
where year(`date submitted`) between 2017 and 2023
GROUP BY YEAR(`Date submitted`)
ORDER BY complaint_year;
#Product-Level Insights:
#2.1 Which financial products receive the most complaints?
select * from consumer_complaints_cleaned;
select product, count(*) as total_complaint
from consumer_complaints_cleaned
group by product
order by total_complaint desc limit 1;
#2.2 What are the top 3 issues associated with the top product?

with top_product as (
	select product,count(*) as total
    from consumer_complaints_cleaned
    group by product
    order by  total desc limit 1
),
top_issue as (
		select issue,count(*) as issue_count
        from consumer_complaints_cleaned
        where Product = (select product from top_product)
        group by  issue
        order by issue_count desc limit 3
        
)
select * from top_issue;

#Section 3: Resolution and Timeliness 
#3.1 How are complaints typically resolved?
select count(*) compliants_resolved,
`Company response to consumer` as resolution_type
from consumer_complaints_cleaned
group by `Company response to consumer` 
order by compliants_resolved desc;
#3.2 What percentage of complaints receive untimely responses?
select round(sum(case when `Timely response?`='no' then 1 else 0 end)*100/count(*),2) as untimely_response
from consumer_complaints_cleaned;
#deeper insights 
#4.1 Are untimely responses more frequent for specific product types or issues?
#Untimely Responses by Product
select product,
count(*) as total_complaint,
sum(case when `Timely response?`='no' then 1 else 0 end) as untimely_count,
round(sum(case when `Timely response?`='no' then 1 else 0 end)*100/count(*),2) as percentage_count
from consumer_complaints_cleaned
group by product
order by percentage_count;
#✅ SQL Query: Untimely Responses by Issue
select Issue,
count(*) as total_complaint,
sum(case when `Timely response?`='no' then 1 else 0 end) as untimely_count,
round(sum(case when `Timely response?`='no' then 1 else 0 end)*100/count(*),2) as percentage_count
from consumer_complaints_cleaned
group by Issue
order by percentage_count;

SELECT 
    Issue,
    COUNT(*) AS total_complaints,
    SUM(CASE WHEN `Timely response?` = 'No' THEN 1 ELSE 0 END) AS untimely_count,
    ROUND(SUM(CASE WHEN `Timely response?` = 'No' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS untimely_percentage
FROM consumer_complaints_cleaned
GROUP BY Issue
HAVING COUNT(*) >= 10  -- optional: to avoid noise from rare issues
ORDER BY untimely_percentage DESC,untimely_count desc;
# 4.2 How does resolution type vary across complaint categories?
#Resolution by Product
select product,count(*) as total,
`Company response to consumer` as resolution_type
from consumer_complaints_cleaned
group by product,`Company response to consumer`
order by Product,total desc;

#Resolution by Issue
select Issue ,count(*) as total,
`Company response to consumer` as resolution_type
from consumer_complaints_cleaned
group by Issue,`Company response to consumer`
order by Issue,total desc;

#