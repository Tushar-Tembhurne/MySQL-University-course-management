Create database University_course ;
use university_course;


Create table Students
(Student_id int primary key, Stud_name varchar(40) not null, Stud_major varchar(100) not null, Enrollment_year year);
desc students;

Create table Courses
(Course_id int primary key, Course_name varchar(50) not null, Credits tinyint, Department varchar(70));
desc courses;

Create table Instructors
(Instructor_id int primary key, Instructor_name varchar(50) not null, Department varchar(70));
desc instructors;

Create table Sections
(Section_id int primary key, Course_id int, Instructor_id int, Semester varchar(30), Year smallint, Room varchar(30),
foreign key(course_id) references Courses(course_id),
foreign key(instructor_id) references Instructors(instructor_id));

desc sections;

Create table Enrollments
(Enrollment_id int primary key, Student_id int, Section_id int, Grade varchar(2),
foreign key(student_id) references Students(student_id),
foreign key(section_id) references Sections(section_id));

desc enrollments;


INSERT INTO Students 
(Student_id, Stud_name, Stud_major, Enrollment_year) VALUES
(1, 'Aarav Sharma', 'Computer Science', 2023),
(2, 'Ishani Verma', 'Mathematics', 2022),
(3, 'Arjun Nair', 'Computer Science', 2023),
(4, 'Diya Gupta', 'Physics', 2021),
(5, 'Rohan Mehta', 'Computer Science', 2023),
(6, 'Ananya Iyer', 'Electrical Engineering', 2022),
(7, 'Kabir Singh', 'Computer Science', 2024),
(8, 'Meera Joshi', 'Economics', 2021),
(9, 'Vivaan Reddy', 'Computer Science', 2023),
(10, 'Sana Khan', 'Biology', 2022),
(11, 'Aditya Das', 'Computer Science', 2024),
(12, 'Tara Malhotra', 'Chemistry', 2023),
(13, 'Reyansh Goel', 'Data Science', 2023),
(14, 'Kyra Bose', 'Computer Science', 2022),
(15, 'Sai Prasad', 'Mechanical Engineering', 2021);



INSERT INTO Courses 
(Course_id, Course_name, Credits, Department) VALUES
(101, 'Data Structures', 4, 'Computer Science'),
(102, 'Database Systems', 3, 'Computer Science'),
(103, 'Calculus I', 4, 'Mathematics'),
(104, 'Quantum Physics', 3, 'Physics'),
(105, 'Machine Learning', 4, 'Computer Science'),
(106, 'Microeconomics', 3, 'Economics'),
(107, 'Organic Chemistry', 4, 'Chemistry'),
(108, 'Digital Electronics', 3, 'Electrical Engineering'),
(109, 'Operating Systems', 4, 'Computer Science'),
(110, 'Genetics', 3, 'Biology'),
(111, 'Artificial Intelligence', 4, 'Computer Science'),
(112, 'Linear Algebra', 3, 'Mathematics'),
(113, 'Thermodynamics', 3, 'Mechanical Engineering'),
(114, 'Computer Networks', 4, 'Computer Science'),
(115, 'Sociology 101', 2, 'Humanities');



INSERT INTO Instructors
 (Instructor_id, Instructor_name, Department) VALUES
(501, 'Dr. Amit Rao', 'Computer Science'),
(502, 'Dr. Priya Kulkarni', 'Mathematics'),
(503, 'Dr. Sanjay Deshmukh', 'Physics'),
(504, 'Prof. Vikram Seth', 'Computer Science'),
(505, 'Dr. Neha Patil', 'Economics'),
(506, 'Dr. Rajesh Khanna', 'Chemistry'),
(507, 'Dr. Sunil Gavaskar', 'Electrical Engineering'),
(508, 'Dr. Anjali Menon', 'Computer Science'),
(509, 'Prof. Rahul Dravid', 'Biology'),
(510, 'Dr. Smriti Mandhana', 'Mathematics'),
(511, 'Dr. Hardik Pandya', 'Mechanical Engineering'),
(512, 'Dr. Mithali Raj', 'Computer Science'),
(513, 'Dr. Jasprit Bumrah', 'Physics'),
(514, 'Dr. Shreya Ghoshal', 'Humanities'),
(515, 'Dr. A.R. Rahman', 'Computer Science');



INSERT INTO Sections 
(Section_id, Course_id, Instructor_id, Semester, Year, Room) VALUES
(201, 101, 501, 'Fall', 2023, 'C-101'),
(202, 102, 504, 'Fall', 2023, 'C-102'),
(203, 103, 502, 'Fall', 2023, 'M-201'),
(204, 105, 508, 'Spring', 2024, 'C-103'),
(205, 109, 512, 'Fall', 2023, 'C-104'),
(206, 111, 515, 'Spring', 2024, 'C-105'),
(207, 104, 503, 'Fall', 2023, 'P-301'),
(208, 106, 505, 'Fall', 2023, 'E-401'),
(209, 101, 501, 'Spring', 2024, 'C-101'),
(210, 114, 504, 'Spring', 2024, 'C-102'),
(211, 112, 510, 'Fall', 2023, 'M-202'),
(212, 108, 507, 'Fall', 2023, 'EL-501'),
(213, 113, 511, 'Spring', 2024, 'ME-101'),
(214, 115, 514, 'Fall', 2023, 'H-110'),
(215, 102, 508, 'Spring', 2024, 'C-102');


INSERT INTO Enrollments 
(Enrollment_id, Student_id, Section_id, Grade) VALUES
(1001, 1, 201, 'A'),
(1002, 3, 201, 'B'),
(1003, 1, 202, 'A'),
(1004, 5, 202, 'A'),
(1005, 2, 203, 'B'),
(1006, 9, 205, 'A'),
(1007, 14, 205, 'C'),
(1008, 4, 207, 'A'),
(1009, 8, 208, 'B'),
(1010, 6, 212, 'A'),
(1011, 12, 214, 'B'),
(1012, 1, 209, 'A'),
(1013, 11, 206, 'A'),
(1014, 7, 210, 'B'),
(1015, 13, 215, 'A');



 -- 1. List all students enrolled in the "Computer Science" department courses --

Select distinct s.student_id, s.stud_name,c.department from students s
join enrollments e on s.student_id = e.student_id
join sections ss on e.section_id = ss.section_id
join courses c on ss.course_id = c.course_id
where c.department = 'Computer Science' 
order by s.student_id;


 -- 2. Find the average grade per course --

Select 
 c.course_name, AVG(Case
 when e.grade = 'A' THEN 4
 when e.grade = 'B' THEN 3
 when e.grade = 'C' THEN 2
 when e.grade = 'D' THEN 1
 when e.grade = 'F' THEN 0 
 ELSE NULL 
    END ) AS AVG_grade 
from courses c
join sections ss on c.course_id = ss.course_id 
join enrollments e on ss.section_id = e.section_id
group by c.course_id ,c.course_name;

-- 3. Count the number of students taught by each instructor --

Select i.Instructor_id,i.Instructor_name, count(e.Student_id) as total_students from instructors i 
join sections ss on i.Instructor_id = ss.Instructor_id
join enrollments e on ss.Section_id = e.Section_id
group by i.Instructor_id,Instructor_name ;


-- 4. List all courses offered in the 'Fall 2023' semester --

 Select c.course_id, c.course_name from courses c 
 join sections s on c.Course_id = s.course_id
 where s.semester = 'FALL'
 AND s.year = 2023;
 
 
--  5. Find the instructor with the most sections taught --

select i.instructor_id,Instructor_name, count(s.section_id) as total_sections from instructors i
join sections s on i.Instructor_id = s.Instructor_id 
group by Instructor_name,Instructor_id
order by total_sections desc limit 1;


-- 6. Calculate the total number of credit hours each student is enrolled in for the semester --
 
 select s.student_id, s.stud_name, sum(c.credits)  as total_credits from students s 
 join enrollments e on s.Student_id = e.Student_id
 join sections ss on e.Section_id = ss.Section_id
 join courses c on ss.Course_id = c.Course_id 
 group by s.student_id, s.stud_name
order by student_id;
 
 
-- 7. identify students who have a grade average above 3.5 (on a 4.0 scale) --

Select s.student_id,s.stud_name,
 round  (AVG(Case
 when e.grade = 'A' then  4
 when e.grade = 'B' then  3
 when e.grade = 'C' then 2
 when e.grade = 'D' then 1
 when e.grade = 'F' then 0 
 ELSE NULL 
  END ),2 ) AS AVG_grade 
  
From students s
JOIN  enrollments e on  s.student_id = e.student_id
Group by s.student_id 
having AVG_GRADE>3.5
order by student_id;


-- 8. Find courses that have no enrolled students --

Select Course_id, Course_name 
from Courses 
where Course_id NOT IN
( select distinct ss.Course_id 
From Sections ss
Join Enrollments e ON ss.Section_id = e.Section_id );


 -- 9. List the top 5 students with the highest overall GPA --
 
 SELECT s.student_id,s.stud_name,
 MAX(Case
 when e.grade = 'A' then 4
 when e.grade = 'B' then 3
 when e.grade = 'C' then 2
 when e.grade = 'D' then 1
 when e.grade = 'F' then 0 
 ELSE NULL 
 END) AS highest_gpa
  FROM students s 
  Join enrollments e on s.student_id =  e.student_id
  Group by s.student_id,s.stud_name
  Order by highest_gpa DESC
  Limit 5;
  
  
  -- 10.Show the grade distribution (number of A, B, C, etc.) for a specific course-- 
  
  select distinct  c.course_id, c.course_name, e.grade  from enrollments e
  join sections ss on e.section_id = ss.section_id
  join courses c on ss.course_id = c.course_id
  group by c.course_id ,c.course_name, e.grade
  order by grade ;
  
  
  
  
 
 