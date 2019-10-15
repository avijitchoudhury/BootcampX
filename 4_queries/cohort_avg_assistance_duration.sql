SELECT AVG(total_duration)
FROM (
SELECT sum(completed_at - started_at) as total_duration
FROM assistance_requests
JOIN students on students.id = student_id
JOIN cohorts on cohorts.id = cohort_id
GROUP BY cohorts.id) as average_total_duration;