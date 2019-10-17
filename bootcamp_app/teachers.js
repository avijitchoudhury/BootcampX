const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const argv = process.argv[2];
const values = [`%${argv || 'JUL02'}`]

const queryString =`
SELECT distinct cohorts.name as cohort, teachers.name as teacher, count(assistance_requests) as total_assistances
FROM cohorts
  JOIN students ON cohorts.id = cohort_id
  JOIN assistance_requests ON students.id = student_id
  JOIN teachers ON teachers.id = teacher_id
WHERE cohorts.name LIKE $1
GROUP BY teachers.name, cohorts.name
ORDER BY teachers.name;
`;

pool.query(queryString, values)
.then(res => {
  res.rows.forEach(row => {
    console.log(`${row.cohort}: ${row.teacher}`)
  })
}).catch(err => console.error('query error', err.stack));