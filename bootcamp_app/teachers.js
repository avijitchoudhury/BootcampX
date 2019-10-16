const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

pool.query(`
SELECT distinct cohorts.name as cohort, teachers.name as teacher, count(assistance_requests) as total_assistances
FROM cohorts
  JOIN students ON cohorts.id = cohort_id
  JOIN assistance_requests ON students.id = student_id
  JOIN teachers ON teachers.id = teacher_id
WHERE cohorts.name LIKE '%${process.argv[2] || 'JUL02'}%'
GROUP BY teachers.name, cohorts.name
ORDER BY teachers.name;
`)
.then(res => {
  res.rows.forEach(row => {
    console.log(`${row.cohort}: ${row.teacher}`)
  })
}).catch(err => console.error('query error', err.stack));

