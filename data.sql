INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
		('Agumon','2020-02-03', 0, true, 10.23),
		('Gabumon', '2018-11-15', 2, true, 8),
		('Pikachu', '2021-01-07', 1, false, 15.04),
		('Devimon', '2017-05-12', 5, true, 11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES	
		('Charmander','2020-2-08', 0, false, -11),
		('Plantmon','2021-11-15', 2, true, -5.7),
		('Squirtle', '1993-04-02', 3, false, -12.13),
		('Angemon', '2005-06-12', 1, true, -45),
		('Boarmon', '2005-06-07', 7, true, 20.4),
		('Blossom', '1998-10-13', 3, true, 17),
		('Ditto', '2022-05-14', 4, true, 22);

INSERT INTO owners(Full_name, age)
VALUES  ('Sam Smith', 34),
		('Jennifer Orwell', 19),
		('Bob', 45),
		('Melody Pond', 77),
		('Dean Winchester', 14),
		('Jodie Whittaker', 38);
SELECT * FROM owners;

INSERT INTO species(name)
VALUES  ('Pokemon'),
		('Digimon');
SELECT * FROM species;

UPDATE animals SET species_id = (CASE
WHEN name LIKE '%mon' THEN 2
ELSE 1
END);
SELECT * FROM animals

UPDATE animals SET owners_id = (
	CASE
	WHEN name = 'Agumon' THEN 7
	WHEN name = 'Gabumon'  OR name = 'Pikachu' THEN 8
	WHEN Name = 'Devimon' OR name = 'Plantmon' THEN 9
	WHEN Name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom' THEN 10
	WHEN Name = 'Angemon' OR name = 'Boarmon' THEN 11
	END);
SELECT * FROM animals;
