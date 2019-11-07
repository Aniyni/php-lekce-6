#####################
# Ukol 1:

SELECT * FROM teacher;

SELECT name FROM subject;

SELECT year, name FROM class;


#####################
# Ukol 2:

SELECT name, salary FROM teacher ORDER BY salary DESC, name;


#####################
# Ukol 3:

SELECT year, name FROM class WHERE year > 2;

SELECT id, year, name FROM class WHERE name IN ('A', 'C') ORDER BY year DESC;

SELECT name FROM teacher WHERE name IN ('Jesse', 'Alice', 'Larry') AND salary > 40000;


#####################
# Ukol 4:

SELECT COUNT(*), AVG(salary) FROM teacher;

SELECT name, MIN(year), MAX(year) FROM class GROUP BY name;

SELECT name, MIN(year), MAX(year) FROM class GROUP BY name ORDER BY MAX(year);


#####################
# Ukol 5:

SELECT COUNT(*) AS teachers_count, AVG(salary) AS avg_salary FROM teacher;

SELECT c.year AS class_year, c.name AS class_name, t.name AS teacher
FROM class c
         JOIN teacher t ON t.id = c.homeroom_teacher_id
ORDER BY c.year, c.name;

SELECT c.year AS class_year, c.name AS class_name, t.name AS teacher
FROM class c
         JOIN teacher t ON t.id = c.homeroom_teacher_id
WHERE t.name = 'Albert';

SELECT class.year, class.name, COUNT(*)
FROM class
         JOIN pupil ON pupil.class_id = class.id
GROUP BY class.year, class.name;


#####################
# Ukol 6:
SELECT c.year, c.name, t.name
FROM class c
         JOIN teacher t ON t.id = c.homeroom_teacher_id;

UPDATE class c
    JOIN teacher t ON t.id = c.homeroom_teacher_id
SET c.name = 'C'
WHERE t.name IN ('Albert', 'Susan');

SELECT c.year, c.name, t.name
FROM class c
         JOIN teacher t ON t.id = c.homeroom_teacher_id;

UPDATE class c
SET c.name = 'B'
WHERE c.name = 'C';

SELECT c.year, c.name, t.name
FROM class c
         JOIN teacher t ON t.id = c.homeroom_teacher_id;


#####################
# Ukol 7:

INSERT INTO teacher (name, salary) VALUES ('Alex', '28000'), ('Alex', '32000');

SELECT COUNT(*), AVG(salary)
FROM teacher
WHERE name = 'Alex'
GROUP BY name;

DELETE t
FROM teacher t
WHERE t.name = 'Alex'
  AND t.salary > 30000;

SELECT COUNT(*), AVG(salary)
FROM teacher
WHERE name = 'Alex'
GROUP BY name;

DELETE t
FROM teacher t
WHERE t.name = 'Alex';
