SELECT day, count(*) as total_assignments
FROM assignments
GROUP BY day
ORDER BY day

SELECT day, count(*) as total_assignments
FROM assignments
GROUP BY day
HAVING count(*) >= 10
ORDER BY day;

SELECT cohorts.name as cohort_name, count(students.*) as student_count
FROM cohorts 
JOIN students ON cohorts.id = cohort_id
GROUP BY cohort_name
HAVING count(cohorts.*) >= 18
ORDER BY student_count;

SELECT cohorts.name as cohort, count(assignment_submissions.*) as total_submissions
FROM cohorts
JOIN students ON cohorts.id = cohort_id
JOIN assignment_submissions ON students.id = student_id
GROUP BY cohort
ORDER BY total_submissions DESC;

SELECT students.name as student, avg(assignment_submissions.duration) as average_assignment_duration
FROM students
JOIN assignment_submissions ON students.id = student_id
WHERE students.end_date IS NULL
GROUP BY student
ORDER BY average_assignment_duration DESC;

SELECT students.name as student, avg(assignment_submissions.duration) as average_assignment_duration, avg(assignments.duration) as average_estimated_duration
FROM students
JOIN assignment_submissions ON students.id = student_id
JOIN assignments ON assignment_id = assignments.id
WHERE students.end_date IS NULL 
GROUP BY student
HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
ORDER BY average_assignment_duration ASC;