---Finding the specific total duration one student spent on assignments
SELECT sum(duration) as total_duration
FROM assignment_submissions JOIN students
ON students.id = student_id
WHERE students.name = 'Ibrahim Schimmel';


---Finding the total duration of all students spent on the FEB 12 assignments
SELECT sum(duration) as total_duration
FROM assignment_submissions 
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name = 'FEB12';

SELECT students.name as students, count(assignment_submissions.*) as total_submissions
FROM assignment_submissions 
JOIN students ON students.id = student_id
WHERE students.end_date IS NULL
GROUP BY students.name
HAVING count(assignment_submissions.*) < 100;