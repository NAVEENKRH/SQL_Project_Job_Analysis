/* Optimal jobs are those that have hiegst salary and 
high demnd */



select 
    skills_dim.skills,
    Round(AVG(salary_year_avg),0) AVG_salary,
    count(skills_job_dim.job_id) as demand_skills
from job_postings_fact
    inner join skills_job_dim on  job_postings_fact.job_id = skills_job_dim.job_id
    Inner join skills_dim on skills_job_dim.skill_id=skills_dim.skill_id
where 
    job_title_short= 'Data Analyst' 
    and salary_year_avg is not NULL
    AND job_work_from_home = TRUE
GROUP BY 
    skills_dim.skill_id
HAVING
     count(skills_job_dim.job_id)>10
order BY
     AVG_salary DESC,
    demand_skills DESC
LIMIT 10;
