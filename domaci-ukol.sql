# 1
SELECT teacher_name FROM (
                             SELECT t.name AS teacher_name, cs.id AS cs_id
                             FROM teacher t
                                      LEFT OUTER JOIN class_subject cs ON cs.teacher_id = t.id
                         ) teacher_class
WHERE cs_id IS NULL
ORDER BY teacher_name;

# 2
SELECT p.name AS pupil_name, COUNT(*) number_of_fives
FROM pupil p
         JOIN pupil_subject ps ON ps.pupil_id = p.id
WHERE ps.grade = 5
GROUP BY p.name;

# 3
SELECT CONCAT(c.year, c.name) AS class, AVG(ps.grade) AS avg_grade
FROM class c
         JOIN pupil p ON p.class_id = c.id
         JOIN pupil_subject ps ON ps.pupil_id = p.id
GROUP BY c.id
ORDER BY class;

# 4
SELECT c.year, AVG(ps.grade) AS avg_grade
FROM class c
         JOIN pupil p ON p.class_id = c.id
         JOIN pupil_subject ps ON ps.pupil_id = p.id
GROUP BY c.year
ORDER BY c.year;

# 5
SELECT t.name AS teacher_name, CONCAT(c.year, c.name) AS class, s.name AS subject
FROM class_subject cs
         JOIN teacher t ON t.id = cs.teacher_id
         JOIN class c ON c.id = cs.class_id
         JOIN subject s ON s.id = cs.subject_id
WHERE c.homeroom_teacher_id = t.id;

# 6
SELECT s.name AS subject, c.year, AVG(ps.grade) AS avg_grade
FROM class c
         JOIN pupil p ON p.class_id = c.id
         JOIN pupil_subject ps ON ps.pupil_id = p.id
         JOIN subject s ON s.id = ps.subject_id
GROUP BY c.year, s.id
ORDER BY subject, year;

# 7
SELECT t.name AS teacher, AVG(ps.grade) AS avg_grade
FROM teacher t
         JOIN class_subject cs ON cs.teacher_id = t.id
         JOIN subject s ON s.id = cs.subject_id
         JOIN pupil_subject ps ON ps.subject_id = s.id
GROUP BY t.id
ORDER BY avg_grade
LIMIT 5;

SELECT t.name AS teacher, AVG(ps.grade) AS avg_grade
FROM teacher t
         JOIN class_subject cs ON cs.teacher_id = t.id
         JOIN subject s ON s.id = cs.subject_id
         JOIN pupil_subject ps ON ps.subject_id = s.id
GROUP BY t.id
ORDER BY avg_grade DESC
LIMIT 5;
