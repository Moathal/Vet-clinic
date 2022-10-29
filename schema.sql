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

CREATE TABLE vets (
	id SERIAL PRIMARY KEY,
	name VARCHAR,
	age INTEGER,
	date_of_graduation DATE);
SELECT * FROM vets;

CREATE TABLE specializations (
	vets_id INTEGER REFERENCES vets(id),
	species_id INTEGER REFERENCES species (id)
);

CREATE TABLE visits (
	vets_id INTEGER REFERENCES vets(id),
	animals_id INTEGER REFERENCES animals (id),
	date_of_visit DATE
);
