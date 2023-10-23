USE business;
SHOW tables;
SELECT * FROM bonus;
SELECT * FROM employee;
SELECT * FROM title;

 -- FUNCTIONS.
 -- MIN (). Nos permite obtener el valor minimo de una columna
 SELECT MIN(salary) AS 'Salario menor'
 FROM employee;
 
 SELECT MIN(last_name) AS 'Apellido menor (ASCII)'  -- Para caracteres con respecto a la tabla ASCII. 
 FROM employee;
 
  -- MAX (). Nos permite obtener el valor maximo de una columna
 SELECT MAX(salary) AS 'Salario mayor'
 FROM employee;
 
 SELECT MAX(last_name) AS 'Apellido mayor (ASCII)'  -- Para caracteres con respecto a la tabla ASCII. 
 FROM employee;
 
 -- GROUP BY. Agrupar informacion de diferentes columnas o de una misma columna. No podemos agrupar datos únicos como PK y IDs
SELECT salary, department FROM employee 
GROUP BY salary, department; 

-- WHERE > IN. Regresa datos donde exista coincidencia con lo que le proporcionamos, entre parentesis
-- ASC Ordena los valores del menor al mayor
-- DESC Ordena los valores del mayor al menor 
 SELECT * FROM employee
 WHERE employee_id IN (6, 1, 7, 3)
 ORDER BY salary DESC; 
 
SELECT * FROM employee
WHERE salary < 200000
ORDER BY first_name DESC; 

SELECT department, AVG(salary) 
FROM employee
WHERE salary < 200000
GROUP BY department
ORDER BY department;
 
-- LIKE intenta hacer coincider un String. 
SELECT * FROM employee 
WHERE first_name LIKE '%a'; -- registros que finalizan con la letra a

SELECT * FROM employee 
WHERE first_name LIKE 'v%';  -- registros que inician con la letra v

SELECT * FROM employee 
WHERE first_name LIKE '%y%';  -- que tenga la letra y en cualquier lugar de la palabra

SELECT 
	CONCAT (employee.first_name, ' ', employee.last_name) AS 'Nombre Completo', 
    salary AS 'Salario'
FROM employee
ORDER BY salary ASC;

-- AVERAGE AVG() 
SELECT AVG (salary) AS 'Salario'
FROM employee;

-- Count Nos permite contar los valores que se encuentran en una columna
SELECT COUNT(salary) AS 'Numero de registro de salarios'
FROM employee;

SELECT 
	department AS 'Departamento', 
    SUM(salary) AS 'Total de salario', 
    AVG(salary) AS 'Promedio de salario',
    min(salary) AS 'Salario menor',
    max(salary) AS'Salario mayor',
    COUNT(salary) AS 'Numero de registros'
FROM employee
WHERE salary < 200000
GROUP BY department
ORDER BY department;