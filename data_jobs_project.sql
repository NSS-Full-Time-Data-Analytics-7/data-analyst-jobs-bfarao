--1.	How many rows are in the data_analyst_jobs table?
Select count(*)
from data_analyst_jobs;
--1793

--2.	Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
select *
from data_analyst_jobs
limit 10;
--ExxonMobil

--3.	How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
select count(title), count(location)
from data_analyst_jobs
where (location = 'TN' OR location = 'KY');
--21 postings in TN
--27 postings either TN or KY

--4.	How many postings in Tennessee have a star rating above 4?
select count(title), count(location)
from data_analyst_jobs
where location = 'TN'
AND star_rating >=4;
--4 postings 

--5.	How many postings in the dataset have a review count between 500 and 1000?
select count(title)
from data_analyst_jobs
where review_count BETWEEN 500 AND 1000;
--151 postings

--6.	Show the average star rating for companies in each state. 
--The output should show the state as `state` and the average rating for the state as `avg_rating`.
--Which state shows the highest average rating?
select location AS state, AVG(star_rating) AS avg_rating
from data_analyst_jobs
group by state
order by avg_rating DESC;
--NE with 4.199 star rating

--7.	Select unique job titles from the data_analyst_jobs table. How many are there?
select count (distinct (title))
from data_analyst_jobs;
--881

--8.	How many unique job titles are there for California companies?
select count (distinct (title))
from data_analyst_jobs
where location = 'CA';
--230

--9.	Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations.
--How many companies are there with more that 5000 reviews across all locations?
select company, star_rating AS avg_rating
from data_analyst_jobs
where review_count >5000;

--10.	Add the code to order the query in #9 from highest to lowest average star rating.
-- Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
select company, star_rating AS avg_rating
from data_analyst_jobs
where review_count >5000
order by avg_rating DESC;
--Microsoft with 4.199 rating

--11.	Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?
select count(title)
from data_analyst_jobs
where title LIKE '%Analyst%';
--1636

--12.	How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?
select title
from data_analyst_jobs
where title NOT ILIKE '%Analyst%' AND title NOT ILIKE '%Analytics%';
--there are 4 job titles and they have the word Tableau in common

--**BONUS:**
--You want to understand which jobs requiring SQL are hard to fill.
--Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. (23 jobs)
--Disregard any postings where the domain is NULL.
--Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top.
--Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?
select domain, days_since_posting, title
from data_analyst_jobs
where skill = 'SQL'
AND days_since_posting > 3
AND domain IS NOT NULL
order by days_since_posting DESC

--"Consulting and Business Services"	30	"GSI Analytics Analyst"
--"Consulting and Business Services"	30	"Senior Data Analyst"
--"Consumer Goods and Services"	        30	"Junior Data Analyst"
--"Consulting and Business Services"	30	"Lead Data Analyst and Mapper - Healthcare Provider"




