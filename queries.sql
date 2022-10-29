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

SELECT 
a.id animal_id,
a.name AS animal,
v.id vet_id,
v.name AS visitor,
visits.date_of_visit
FROM visits
JOIN vets v 
ON visits.vets_id = v.id 
JOIN animals a
ON visits.animals_id = a.id
WHERE v.name = 'William Tatcher'
GROUP BY v.id, a.id, visits.date_of_visit 
ORDER BY visits.date_of_visit DESC
limit 1;

SELECT DISTINCT a.name 
FROM animals a
JOIN visits v
ON v.animals_id = a.id
JOIN vets 
ON vets.id = v.vets_id
WHERE vets.name = 'Stephanie Mendez';

SELECT v.name vet, sp.name speciality 
FROM vets v
LEFT JOIN specializations s
ON v.id = s.vets_id
LEFT JOIN species sp
ON sp.id = s.species_id;

SELECT a.id animals_id, a.name animal, vets.name vet, v.date_of_visit 
FROM animals a
JOIN visits v 
ON v.animals_id = a.id
JOIN vets 
ON vets.id = v.vets_id
WHERE vets.name = 'Stephanie Mendez' 
AND v.date_of_visit
BETWEEN '2020-04-01' AND '2020-08-30';

SELECT v.animals_id, a.name animal, COUNT(v.animals_id) visits
FROM visits v
JOIN animals a
ON a.id = v.animals_id
GROUP BY v.animals_id, a.name
ORDER BY visits DESC
LIMIT 1;

SELECT v.id vet_id, v.name vet, a.id animal_id, a.name animal, visits.date_of_visit visit_date
FROM animals a
JOIN visits
ON a.id = visits.animals_id
JOIN vets v
ON v.id = visits.vets_id
GROUP BY visit_date, v.id, a.id, a.name
ORDER BY visits.date_of_visit ASC
LIMIT 1;

SELECT a.name animal, a.date_of_birth birth, a.escape_attempts, a.neutered, a.weight_kg, 
s.name species,
vets.name vet,
vets.age vet_age,
vets.date_of_graduation graduation,
v.date_of_visit FROM visits v
JOIN animals a
ON v.animals_id = a.id
JOIN species s
ON a.species_id = s.id
JOIN vets
ON v.vets_id = vets.id
ORDER BY v.date_of_visit DESC
LIMIT 1;

SELECT 
v.animals_id, 
a.name animal, 
v.vets_id, vets.name vet, COUNT(v.animals_id)
FROM visits v
JOIN animals a
ON a.id = v.animals_id
LEFT JOIN specializations s
ON v.vets_id = s.vets_id
JOIN vets
ON v.vets_id = vets.id
GROUP BY v.vets_id, v.animals_id, a.name, vets.name 
ORDER BY COUNT(v.animals_id) DESC
LIMIT 1;

SELECT s.name speciality,
COUNT(v.animals_id) visits 
FROM visits v
JOIN vets
ON v.vets_id = vets.id
JOIN animals a
ON v.animals_id = a.id
JOIN species s
ON a.species_id = s.id
WHERE vets.name = 'Maisy Smith'
GROUP BY s.name, a.species_id
ORDER BY visits DESC
LIMIT 1;
