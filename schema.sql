DROP TABLE IF EXISTS animals;

CREATE TABLE animals (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	date_of_birth date NOT NULL,
	escape_attempts INT NOT NULL,
	neutered Boolean,
	weight_kg DECIMAL
);

ALTER TABLE animals 
ADD COLUMN species VARCHAR;

CREATE TABLE owners (
	id SERIAL PRIMARY KEY,
	full_name VARCHAR,
	age INTEGER);
SELECT * FROM owners;

CREATE TABLE species (
	id SERIAL PRIMARY KEY,
	name VARCHAR);
SELECT * FROM species;

ALTER TABLE animals 
DROP COLUMN species;
SELECT * FROM animals;

ALTER TABLE animals 
ADD COLUMN species_id INTEGER REFERENCES species (id),
ADD COLUMN owners_id INTEGER REFERENCES owners (id);
SELECT * FROM animals;
