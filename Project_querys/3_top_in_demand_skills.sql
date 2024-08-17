/* Top in demand skills for data analyst*/


select 
    skills,
    count(skills_job_dim.job_id) as demand_skills
from 
    job_postings_fact
    inner join skills_job_dim on  job_postings_fact.job_id = skills_job_dim.job_id
    Inner join skills_dim on skills_job_dim.skill_id=skills_dim.skill_id
    where 
        job_title_short='Data Analyst'
    group by 
        skills
    order by 
        demand_skills DESC
limit 10




