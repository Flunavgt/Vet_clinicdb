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
 
 ALTER TABLE animals ADD CONSTRAINT fk_animals FOREIGN KEY (species_id) REFERENCES species (id) ON DELETE CASCADE;
 ALTER TABLE animals ADD CONSTRAINT fk_species FOREIGN KEY (owner_id) REFERENCES owners (id) ON DELETE CASCADE;
