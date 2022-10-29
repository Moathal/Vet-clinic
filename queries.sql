SELECT * FROM animals
where name like '%mon';

SELECT * FROM animals
where date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT * FROM animals
where neutered = true AND escape_attempts < 3;

SELECT date_of_birth FROM animals
where name = 'Agumon' OR name = 'Pikachu';

SELECT name, escape_attempts FROM animals
where weight_kg > 10.5;

SELECT * FROM animals
where neutered = true;

SELECT * FROM animals
WHERE NOT name = 'Gabumon';

SELECT * FROM animals
WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
select * from animals;
RollBack;

BEGIN;
UPDATE animals SET species = (CASE
WHEN name LIKE '%mon' THEN 'digimon'
ELSE 'pokemon'
END);
SELECT * FROM animals
ORDER BY id;
COMMIT;

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

SELECT a.name, a.id FROM animals AS a
JOIN owners ON owners_id = owners.id
WHERE owners.full_name = 'Melody Pond';

SELECT a.id, a.name, s.name FROM animals AS a
JOIN species as s ON a.species_id = s.id
WHERE s.name = 'Pokemon';

SELECT o.id, o.full_name, a.id, a.name 
FROM owners AS o
LEFT JOIN animals as a 
ON o.id = a.owners_id;

SELECT s.name, COUNT(a.name) 
FROM animals AS a
JOIN species as s
ON s.id = a.species_id
GROUP BY s.name;

SELECT o.full_name, a.id AS animal_id, a.name AS animal, s.name AS animal_type
FROM animals AS a
JOIN species as s
ON a.species_id = s.id
JOIN owners o 
ON a.owners_id = o.id
WHERE o.full_name = 'Jennifer Orwell' AND s.name = 'Digimon';

SELECT o.full_name, a.id AS animal_id, a.name AS animal
FROM animals AS a
JOIN owners o 
ON a.owners_id = o.id
WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts = 0;

SELECT o.full_name, COUNT(a.owners_id) AS animals_num
FROM animals AS a
JOIN owners o 
ON a.owners_id = o.id
GROUP BY o.full_name
ORDER BY animals_num DESC
LIMIT 1;
