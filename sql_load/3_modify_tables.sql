COPY company_dim
FROM 'D:\DATA ANALYSIS\SQL\SQL_Project_Job_Analysis\csv_files\company_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_dim
FROM 'D:\DATA ANALYSIS\SQL\SQL_Project_Job_Analysis\csv_files\skills_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY job_postings_fact
FROM 'D:\DATA ANALYSIS\SQL\SQL_Project_Job_Analysis\csv_files\job_postings_fact.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_job_dim
FROM 'D:\DATA ANALYSIS\SQL\SQL_Project_Job_Analysis\csv_files\skills_job_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
INSERT INTO january_jobs (
    job_id,
    company_id,
    job_title_short,
    job_title,
    job_location,
    job_via,
    job_schedule_type,
    job_work_from_home,
    search_location,
    job_posted_date,
    job_no_degree_mention,
    job_health_insurance,
    job_country,
    salary_rate,
    salary_year_avg,
    salary_hour_avg
  )
VALUES (
    job_id:integerINSERT INTO january_jobs (
        job_id,
        company_id,
        job_title_short,
        job_title,
        job_location,
        job_via,
        job_schedule_type,
        job_work_from_home,
        search_location,
        job_posted_date,
        job_no_degree_mention,
        job_health_insurance,
        job_country,
        salary_rate,
        salary_year_avg,
        salary_hour_avg
      )
    VALUES (
        job_id:integer,
        company_id:integer,
        'job_title_short:character varying',
        'job_title:text',
        'job_location:text',
        'job_via:text',
        'job_schedule_type:text',
        job_work_from_home:boolean,
        'search_location:text',
        'job_posted_date:timestamp without time zone',
        job_no_degree_mention:boolean,
        job_health_insurance:boolean,
        'job_country:text',
        'salary_rate:text',
        salary_year_avg:numeric,
        salary_hour_avg:numeric
      );,
    company_id:integer,
    'job_title_short:character varying',
    'job_title:text',
    'job_location:text',
    'job_via:text',
    'job_schedule_type:text',
    job_work_from_home:boolean,
    'search_location:text',
    'job_posted_date:timestamp without time zone',
    job_no_degree_mention:boolean,
    job_health_insurance:boolean,
    'job_country:text',
    'salary_rate:text',
    salary_year_avg:numeric,
    salary_hour_avg:numeric
  );

 Create TABLE January_jobs AS
    select * 
    from job_postings_fact
    where EXTRACT(MONTH from job_posted_date) = 1

CREATE TABLE February_jobs AS
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

CREATE TABLE March_jobs AS
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;



