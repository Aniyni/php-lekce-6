
-- Vypište všechny učitele kteří neučí žádný předmět
SELECT teacher_name FROM (
SELECT t.name AS teacher_name, cs.id AS cs_id
FROM teacher t
LEFT OUTER JOIN class_subject cs ON cs.teacher_id = t.id
) teacher_class
WHERE cs_id IS NULL
ORDER BY teacher_name;

--Vypište všechny žáky, kteří mají alespoň jednu 5 a zároveň vypište kolik jich mají
SELECT p.name AS pupil_name,
COUNT(*) kolik_5
FROM pupil p
JOIN pupil_subject ps ON ps.pupil_id = p.id
WHERE ps.grade = 5
GROUP BY p.name;

--Vypište průměr pro každou třídu
SELECT CONCAT(c.year, c.name) AS trida,
AVG(ps.grade) AS prumer FROM class c
JOIN pupil p ON p.class_id = c.id
JOIN pupil_subject ps ON ps.pupil_id = p.id
GROUP BY c.id;

--Vypiště průměr pro každý ročník
SELECT (c.year) AS rocnik,
AVG(ps.grade) AS prumer FROM class c
JOIN pupil p ON p.class_id = c.id
JOIN pupil_subject ps ON ps.pupil_id = p.id
GROUP BY c.year

--Vypište všechny učitele, kteří učí svojí třídu alespoň na jeden předmět
SELECT t.name AS jmeno_ucitele, CONCAT (c.name, c.year) AS trida, s.name AS predmet
FROM class_subject cs
JOIN teacher t ON t.id = cs.teacher_id
JOIN class c ON c.id = cs.class_id
JOIN subject s ON s.id = cs.subject_id
WHERE c.homeroom_teacher_id = t.id;

--Vypište průměrnou známku pro každý předmět a ročník
SELECT s.name AS predmet, c.year, AVG(ps.grade) as prumer
FROM class c
JOIN pupil p ON p.class_id = c.id
JOIN pupil_subject ps ON ps.pupil_id = p.id
JOIN subject s ON s.id = ps.subject_id
GROUP BY c.year, s.id;

--Vypište hitpárádu 5 lidumilů a 5 drsňáků, tj. 5 učitelů s nejlepší průměrem známek na předmětech, které učí a 5 učitelů s nejhorším průměrem známek)
SELECT t.name AS lidumil, AVG(ps.grade) AS prumer
FROM teacher t
JOIN class_subject cs ON cs.teacher_id = t.id
JOIN subject s ON s.id = cs.subject_id
JOIN pupil_subject ps ON ps.subject_id = s.id
GROUP BY t.id
ORDER BY prumer
LIMIT 5;

SELECT t.name AS drsnak, AVG(ps.grade) AS prumer
FROM teacher t
JOIN class_subject cs ON cs.teacher_id = t.id
JOIN subject s ON s.id = cs.subject_id
JOIN pupil_subject ps ON ps.subject_id = s.id
GROUP BY t.id
ORDER BY prumer DESC
LIMIT 5;




