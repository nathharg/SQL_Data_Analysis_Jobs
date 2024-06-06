SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
WHERE
    job_title_short LIKE '%Data%Analyst%' AND
    job_title LIKE '%Junior%' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
    LIMIT 10
; 

/* Important to note that this only includes postings 
where salary is not null ie not disclosed on the ad */

/* Null values in the salaries of many postings meant that  filtering Australian results would not provide useful insights.
I therefore specified American results to standardize the currency used for the results. */

