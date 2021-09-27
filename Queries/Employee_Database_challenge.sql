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
