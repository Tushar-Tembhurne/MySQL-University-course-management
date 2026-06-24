# MySQL-University-course-management
A MySQL-based University Management System featuring relational schema designs and practical data analysis queries for student-course insights.  

# University Course Management System (MySQL)

## 📌 Project Overview

This project establishes a relational database model for a **University Management System** using MySQL. The schema is structured to capture relationships between students, academic departments, instructors, course offerings, and registration enrollments.

In addition to the database architecture, the project includes an analytical query suite designed to mimic real-world administrative reporting—such as tracking faculty workloads, evaluating GPA metrics, and auditing course demand.


## 🏗️ Database Architecture (Schema Design)

The database comprises **5 relational tables** interconnected through primary keys and foreign key constraints to maintain strict data integrity:

 **`Students`**: Tracks student profiles, their respective academic majors, and registration years.


**`Courses`**: Catalogues available classes, credit weights, and offering departments.


 **`Instructors`**: Maintains faculty information mapped to their specific departments.


**`Sections`**: Bridges courses and instructors, detailing when (`Semester`/`Year`) and where (`Room`) a specific class takes place.


**`Enrollments`**: Records individual student registrations into sections alongside final earned letter grades.



## 🔍 Core Analytical Capabilities

The project features 10 advanced SQL queries targeting operational insights. Key database logic implemented includes:

 **Multi-Table Joins:** Linking up to 4 tables simultaneously to extract contextual student and course data.


 **Dynamic Data Transformation:** Utilizing `CASE WHEN` logic to map alphanumeric letter grades (`A`, `B`, `C`, etc.) to a standard $4.0$ numeric scale for GPA analysis.


 **Data Aggregation (`GROUP BY` & `HAVING`):** Evaluating performance metrics like average course grades, calculating total student credits, and isolating high-achieving students with a GPA $> 3.5$.


 **Subqueries (`NOT IN`):** Identifying database gaps, such as active courses that currently have zero student enrollments.

