--Create a Retirement Titles table
SELECT e.emp_no, 
       e.first_name, 
       e.last_name,
       t.title,
       t.from_date,
       t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no

--Create a Unique Titles table
SELECT DISTINCT ON (r.emp_no) r.emp_no,
                               r.first_name,
                               r.last_name,
                               r.title
INTO unique_titles
FROM retirement_titles as r
ORDER BY r.emp_no, r.to_date DESC;

--Create a Retiring Titles table
SELECT COUNT(u.emp_no), u.title
INTO retiring_titles
FROM unique_titles as u
GROUP BY u.title
ORDER BY COUNT (u.emp_no) DESC;

--Create a Mentorship Eligibility table
SELECT DISTINCT ON (emp_no) e.emp_no, 
                            e.first_name, 
                            e.last_name,
                            e.birth_date,
                            d.from_date,
                            d.to_date,
                            t.title
INTO mentorship_eligibilty
FROM employees as e
    INNER JOIN dept_employee as d
        ON (e.emp_no = d.emp_no)
    INNER JOIN titles as t
        ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (d.to_date = '9999-01-01')
ORDER BY e.emp_no;

SELECT * FROM mentorship_eligibilty;
SELECT * FROM retirement_titles;
SELECT * FROM unique_titles;
SELECT * FROM retiring_titles;

--Create table for all current employees
SELECT DISTINCT ON (t.emp_no) t.emp_no, t.title, t.to_date
INTO unique_all
FROM titles as t
WHERE (t.to_date = '9999-01-01')
ORDER BY t.emp_no, t.to_date DESC;

--Create table for current employee count per title
SELECT COUNT(u.emp_no), u.title
INTO all_titles
FROM unique_all as u
GROUP BY u.title
ORDER BY COUNT (u.emp_no) DESC;

--Create chart of the difference
SELECT rt.title, at.count - rt.count as "Difference"
INTO title_diff
FROM   all_titles as at
JOIN   retiring_titles as rt 
ON at.title = rt.title
ORDER BY at.count DESC;

--Table of eligible mentors by title
SELECT COUNT(m.emp_no), m.title
--INTO mentors_title
FROM mentorship_eligibilty as m
GROUP BY m.title
ORDER BY COUNT (m.emp_no) DESC;

--Salaries for unique titles
SELECT  u.emp_no,
	u.first_name, 
    u.last_name,
	u.title,
	s.salary
FROM unique_titles as u
INNER JOIN salaries as s
ON (u.emp_no = s.emp_no)
ORDER BY u.emp_no, s.to_date DESC;

--Average salary for each unique title
SELECT ROUND(AVG(u.salary),0), u.title
INTO avg_salaries
FROM retiring_salaries as u
GROUP BY u.title
ORDER BY AVG(u.salary) DESC;

--All female employees
SELECT DISTINCT ON (e.emp_no) e.emp_no, 
       t.title
INTO emp_female
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (t.to_date = '9999-01-01')
AND (e.gender = 'F')
ORDER BY e.emp_no, t.to_date DESC;

--All male employees
SELECT DISTINCT ON (e.emp_no) e.emp_no, 
       t.title
INTO emp_male
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (t.to_date = '9999-01-01')
AND (e.gender = 'M')
ORDER BY e.emp_no, t.to_date DESC;

--New mentorship criteria
SELECT DISTINCT ON (emp_no) e.emp_no, 
                            e.first_name, 
                            e.last_name,
                            e.birth_date,
                            d.from_date,
                            d.to_date,
                            t.title
INTO new_mentorship
FROM employees as e
    INNER JOIN dept_employee as d
        ON (e.emp_no = d.emp_no)
    INNER JOIN titles as t
        ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1960-01-01' AND '1965-12-31')
AND (d.to_date = '9999-01-01')
ORDER BY e.emp_no;

SELECT COUNT(m.emp_no), m.title
INTO new_mentors
FROM new_mentorship as m
GROUP BY m.title
ORDER BY COUNT (m.emp_no) DESC;