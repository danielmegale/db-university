--1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT `students`.`name`,`students`.`surname`,`degrees`.`name`
FROM `students`
JOIN `degrees`
ON `students`.`degree_id`=`degree_id`
WHERE `degrees`.`name` = 'corso di laurea in economia';

--2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze

SELECT * 
FROM `degrees`
JOIN `departments`
ON `degrees`.`department_id` = `departments`.`id`
WHERE `departments`.`name` = 'Dipartimento di Neuroscienze';

--3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT `courses`.`name`,`teachers`.`name`,`teachers`.`surname`,`teachers`.`id`
FROM `teachers`
JOIN `course_teacher`
ON `course_teacher`.`teacher_id`=`teachers`.`id`
JOIN `courses`
ON `courses`.`id`= `course_teacher`.`course_id`
WHERE `teachers`.`surname` = 'Amato'
AND `teachers`.`name` = 'Fulvio';

--4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome

SELECT `departments`.`name`,`degrees`.`name`,`students`.`surname`,`students`.`name`
FROM `students`
JOIN `degrees`
ON `degrees`.`id`= `students`.`degree_id`
JOIN `departments`
ON`departments`.`id`=`degrees`.`department_id`
ORDER BY `students`.`surname`,`students`.`name`;

--5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT `degrees`.`name`,`courses`.`name`,`teachers`.`name`,`degrees`.`id`
FROM `degrees`
JOIN `courses`
ON `courses`.`degree_id`=`department_id`
JOIN `course_teacher`
ON `course_teacher`.`course_id`= `courses`.`id`
JOIN `teachers`
ON `teachers`.id = `course_teacher`.`teacher_id`;

--6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)

SELECT  DISTINCT `teachers`.`id`,`teachers`.`name`,`teachers`.`surname`
FROM `departments`
JOIN `degrees`
ON `degrees`.`department_id`=`departments`.`id`
JOIN `courses`
ON `courses`.`degree_id`= `degrees`.`id`
JOIN `course_teacher`
ON `course_teacher`.`course_id`= `courses`.`id`
JOIN `teachers`
ON `course_teacher`.`teacher_id`=`teachers`.`id`
WHERE `departments`.`name` = 'Dipartimento di Matematica';

--7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami