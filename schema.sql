/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
  id int generated always as identity,
  name char(30),
  date_of_birth date,
  escape_attempts int,
  neutered boolean,
  weight_kg decimal,
  PRIMARY KEY(id)
);

/* Day 2:
Alter table insert column. */

ALTER TABLE animals ADD COLUMN species VARCHAR(50);


/* day 3:
add multiple tables. */

CREATE TABLE owners (id int GENERATED ALWAYS AS IDENTITY, full_name varchar(40), age int, PRIMARY KEY(id));
CREATE TABLE species (id int GENERATED ALWAYS AS IDENTITY, name varchar(40), PRIMARY KEY(id));
\d

ALTER TABLE animals DROP COLUMN species;
SELECT * FROM animals;

ALTER TABLE animals ADD COLUMN species_id int;
ALTER TABLE animals ADD COLUMN owner_id int;
 
ALTER TABLE animals 
ADD CONSTRAINT fk_animals FOREIGN KEY (species_id) 
REFERENCES species (id) ON DELETE CASCADE;

ALTER TABLE animals 
ADD CONSTRAINT fk_species FOREIGN KEY (owner_id) 
REFERENCES owners (id) ON DELETE CASCADE;

/* day 4 */

CREATE TABLE vets
(id int GENERATED BY DEFAULT AS IDENTITY,
name char(40),
age int,
date_of_graduation date,
PRIMARY KEY(id));

CREATE TABLE specializations
(vet_id int,
species_id int,
PRIMARY KEY(vet_id, species_id));

CREATE TABLE visits 
(animal_id INT,
vet_id INT,
date_of_visit date,
PRIMARY KEY(animal_id, vet_id, date_of_visit));

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

ALTER TABLE visits ALTER COLUMN date_of_visit SET DATA TYPE TIMESTAMP WITH TIME ZONE;

CREATE INDEX visits_animals ON visits(animal_id);
CREATE INDEX idx_owners_email ON owners(email DESC);
CREATE INDEX visits_vet ON visits(vet_id DESC);

