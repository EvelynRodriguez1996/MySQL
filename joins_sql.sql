USE generation;
SHOW tables;
SELECT * FROM students;
SELECT * FROM countries;
SELECT * FROM idtypes;

-- Join. Una clausula JOIN se usa para seleccionar datos de dos o mas tablas, en funcion de la relacion entre tablas
-- INNER JOIN / JOIN natural. Selecciona registros que tienen valores que coinciden en ambas tablas.
-- A intersección begin

SELECT students.countries
FROM students
JOIN countries
ON students.nationality = countries.idCountries;

-- Mostrando informacion estructurada
SELECT
	CONCAT(students.name,' ', students.last_name) AS 'Nombre completo',
    CONCAT(students.address, ', ', contries.name) AS 'Direccion',
    students.birthdate AS 'Fecha de nacimiento'
FROM students
JOIN countries
ON students.nationaly = countries.idCountries;

-- Conocer el total de estudiantes de USA
SELECT
COUNT(countries.name)
FROM students
JOIN countries
ON students.nationality = countries.idCountries
WHERE countries.name ='United States of America';


 -- Encontrar a todo estudiante que tenga como nacionalidad el país 33, mostrando su nombre, apellido, y nacionalidad 
 select 
	students.name, 
	students.last_name, 
    countries.Name 
from students 
join countries 
on students.nationality = countries.idCountries 
where students.nationality = 33;
 
 
  -- Encontrar a todo estudiante en paises que inicien con CA 
 select 
	students.name, 
    countries.Name 
from students 
join countries 
on students.nationality = countries.idCountries 
where countries.name  
like 'ca%';
 
 
  -- Encontrar informacion de estudiantes y obtener el codigo del curso que esten cursando 
 select 
	students.name, 
    students.last_name, 
    courses.name 
 from students 
 join courses_has_students 
 on students.idStudent = courses_has_students.students_id_student 
 join courses 
 on courses_has_students.course_code = courses.code;


SELECT 
	concat(students.name, ' ', student.last_name) AS 'Nombre completo',
	concat(students.adress, ' ', countries.name) AS 'Dirección',
	students.birthdate AS 'Fecha de nacimiento',
	countries.name AS 'país'
FROM students
right join countries
on students.nacionality = countries.idCountries;

SELECT 
	concat(students.name, ' ', student.last_name) AS 'Nombre completo',
	concat(students.adress, ' ', countries.name) AS 'Dirección',
	students.birthdate AS 'Fecha de nacimiento',
	countries.name AS 'país'
FROM countries 
left join students 
on students.nacionality = countries.idCountries;