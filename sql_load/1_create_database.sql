select * from job_postings_fact limit 100;


SELECT 
job_id,
job_country,
    CASE
        when salary_year_avg > 300000 then 'High_salary'
        when salary_year_avg > 200000 then 'Mid_salary'
        when salary_year_avg > 100000 then 'Low_salary'
        else 'Not_paid'
        End as Salary_category
    from job_postings_fact
    where job_title = 'Data Analyst'
    ORDER BY Salary_category 

        select top 3 * from job_postings_fact;
      
        