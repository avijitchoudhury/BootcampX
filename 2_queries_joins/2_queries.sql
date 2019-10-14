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