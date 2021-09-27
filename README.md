# **Pewlett Hackard Analysis**

## **Overview** 
As many current employees reach retirement age, the company Pewlett Hackard has given us the task to determine the number of retiring employees per job title, and identify all employees who are eligible to participate in a mentorship program. We have received large amounts of [data](https://github.com/annaS000/Pewlett-Hackard-Analysis/tree/main/Data/Resources) for the companies current employees and departments to organize and analyze. To do this we will be using pgAdmin to create a SQL Database to store and manipulate the employee data. Once we have collected the necessary tables and information, we must write a report that summarizes our analysis and help the company's manager prepare for the “silver tsunami”.

---

## **Entity Relationship Diagram**
![ERD](https://github.com/annaS000/Pewlett-Hackard-Analysis/blob/main/lessons/EmployeeDBnew.png?raw=true)
>This the entity relationship diagram (ERD) used throughout the assignment to help guide us when writing SQL queries to create the tables for our analysis. 

---

## **Results** 
Once we have determined the relationships between our files we were able to create a [schema](https://github.com/annaS000/Pewlett-Hackard-Analysis/blob/main/lessons/schema.sql) and the write our [queries](https://github.com/annaS000/Pewlett-Hackard-Analysis/blob/main/Queries/Employee_Database_challenge.sql) to find our results.

---

### **Deliverable 1**
*  For the first part of our analysis, we have found the list of employees and their unique titles (to avoid duplicates when counting them later) and stored this information in a csv file. This allows us to see how many employees the company may potentially have to replace in the near future.
    ##### **Unique Titles**
    ![unique](https://github.com/annaS000/Pewlett-Hackard-Analysis/blob/main/Data/unique_titles.png?raw=true)
    > Here is a screenshot of our output of unique retiring employees and their titles.
    ##### **Retiring Titles**
    ![retiring_titles](https://github.com/annaS000/Pewlett-Hackard-Analysis/blob/main/Data/retiring_titles.png?raw=true)
    > After collecting all employees able to retire along with their titles we were able to create a table that shows how many employees may retire by title. Additionally, using 
    `SUM()` on retiring_titles we can see that the overall total of potential retiring employees is **90,398**. That is quite the hit for the company.

* To get a better picture of how big of a loss this would actually be we can create a chart to show how many employees there are per title currently.
    ##### **Employee Counts**
    ![](https://github.com/annaS000/Pewlett-Hackard-Analysis/blob/main/Data/all_titles.png?raw=true)

    > The table on the left shows us the overall total amount of employees by title. Pewlett Hackard is a large company with **240,124** current employees but, the retiring employees take up almost 38% percent of those positions. 

### **Deliverable 2**
* Next, we had to collect information on how many employees are eligible to participate in a mentorship program.
    ##### **Mentorship Eligibilty**
    ![mentors](https://github.com/annaS000/Pewlett-Hackard-Analysis/blob/main/Data/mentorship_eligibilty.png?raw=true)
    > Here is a screenshot of the table of all names and titles of the eligible mentors for the company. Using the `COUNT()` function, we found that there are only **1,549** employees that would be able to mentor new employees.   

* After finding our eligible mentors, we can see how many there are for each title.
    ##### **Mentor Count**
    ![mentor count](https://github.com/annaS000/Pewlett-Hackard-Analysis/blob/main/Data/mentortitles.png?raw=true)
    > We can see that there not many employees for each title that will the availability for the mentorship program according to the current criteria. Furthermore, we can even see there are no employees able to mentor for the Manager positions.

---

## **Summary** 

All exported cvs files from the analysis can be found in the [Data](https://github.com/annaS000/Pewlett-Hackard-Analysis/tree/main/Data) folder. 

* How many roles will need to be filled as the "silver tsunami" begins to make an impact?

    From our results above, we found that there are **90,398** employees that could potentially retire from Pewlett Hackard. This could be a difficult task if the company were to have to fill all those positions at once.

    ![retire salaries](https://github.com/annaS000/Pewlett-Hackard-Analysis/blob/main/Data/retiring_salaries.png?raw=true)
    > I was interested in the salaries of these positions so I added a salary column to the unique titles table. I then used this table to make the chart below that shows the average salaries for the retiring employees by their position title.

    ![avg salaries](https://github.com/annaS000/Pewlett-Hackard-Analysis/blob/main/Data/avg_salaries.png?raw=true)
    > Perhaps salaries would have an effect on whether or not an employee will retire. It also might be valuable for the company to look into the salaries of the employees that may leave to see how much money will be available for new hires.

* Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

    Our results showed there are only **1,549** employees that are eligible for the mentorship program. Compared to the amount of employees that may leave the company in the upcoming years, there is a severe imbalance in how many mentors are needed to help the replacement process. With this knowledge, the company may have to reconsider their criteria for this program. Being more lenient with which employees are allowed mentor others will help even out the mentor to new hire ratio.

    ![new mentors](https://github.com/annaS000/Pewlett-Hackard-Analysis/blob/main/Data/new_mentors.png?raw=true)

    >Here is a new chart of eligible mentors where the birthdate was extended to January 1, 1960 and December 31, 1965.

    ![new mentor count](https://github.com/annaS000/Pewlett-Hackard-Analysis/blob/main/Data/ment_count.png?raw=true)

    >This gives the company many more individuals that can mentor new employees when employees start to retire which would alleviate the pressure for company during the hiring process.