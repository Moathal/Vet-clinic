DROP TABLE IF EXISTS animals;

CREATE TABLE animals (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	date_of_birth date NOT NULL,
	escape_attempts INT NOT NULL,
	neutered Boolean,
	weight_kg DECIMAL
);
