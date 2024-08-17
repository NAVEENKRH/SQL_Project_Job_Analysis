/* find the top 10 heigest paying remote(anywhere) jobs*/

select 
    name as company_name, 
    salary_year_avg, 
    job_posted_date :: date
from
     job_postings_fact
LEFT JOIN company_dim ON                  --just included job titles for reference
job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_title_short='Data Analyst' 
    AND job_location='Anywhere'
    AND salary_year_avg IS NOT NULL
order BY 
    salary_year_avg DESC
limit 10;