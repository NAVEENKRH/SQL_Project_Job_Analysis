/*The top paying jobs and the skills required for those jobs*/

WITH top_paying_jobs AS(
        select 
        job_id,
        job_title_short,
        salary_year_avg,
        name as company_name
    from
        job_postings_fact
    LEFT JOIN company_dim ON                 
    job_postings_fact.company_id = company_dim.company_id
    WHERE 
        job_title_short='Data Analyst' 
        AND job_location='Anywhere'
        AND salary_year_avg IS NOT NULL
    order BY 
        salary_year_avg DESC
        LIMIT 10
    )
    select top_paying_jobs.* ,
    skills
    from top_paying_jobs
    inner join skills_job_dim on 
    top_paying_jobs.job_id = skills_job_dim.job_id
    Inner join skills_dim on
    skills_job_dim.skill_id=skills_dim.skill_id
    order by salary_year_avg DESC


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