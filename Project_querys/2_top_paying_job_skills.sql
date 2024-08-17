/*The top paying jobs and the skills required for those jobs*/

WITH top_paying_jobs AS (
    SELECT	
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND 
        job_location = 'Anywhere' AND 
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;


/*Here are the top 10 most common skills required for top-paying jobs in the dataset:

SQL - 8 occurrences
Python - 7 occurrences
Tableau - 6 occurrences
R - 4 occurrences
Snowflake - 3 occurrences
Pandas - 3 occurrences
Excel - 3 occurrences
Azure - 2 occurrences
Bitbucket - 2 occurrences
Go - 2 occurrences*/


 /* company in banglore and there job count
    select 
    name,count(job_id) as job_count
     from job_postings_fact
    inner join company_dim on 
    job_postings_fact.company_id = company_dim.company_id
    WHERE job_location like'%Bengaluru%'
   group by name
   order by job_count DESC
   */