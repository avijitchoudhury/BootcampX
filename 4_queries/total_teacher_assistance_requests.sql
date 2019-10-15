SELECT count(assistance_requests.*) as total_assistances, teachers.name as teachers
FROM assistance_requests
JOIN teachers ON teachers.id = teacher_id
WHERE teachers.name = 'Waylon Boehm'
GROUP BY teachers;