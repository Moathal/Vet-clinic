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
