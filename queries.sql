/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'Luna';

SELECT * FROM animals WHERE name LIKE '%mon%';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered=TRUE AND escape_attempts <3;
SELECT date_of_birth from animals WHERE name='Agumon' OR name='Pikachu';
SELECT name, escape_attempts from animals WHERE  weight_kg>10.5;
SELECT * from animals WHERE neutered=true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg>=10.4 AND weight_kg<=17.3;

/* second day activities */

BEGIN;
UPDATE animals SET species='unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

UPDATE animals SET species='digimon' WHERE name LIKE '%mon%';
SELECT * FROM animals;
UPDATE animals SET species='pokemon' WHERE name NOT LIKE '%mon%';
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth >= '2022-01-01';
SAVEPOINT save1;
UPDATE animals SET weight_kg = weight_kg*-1;
SELECT * FROM animals;
ROLLBACK TO save1;
SELECT * FROM animals;

UPDATE animals SET weight_kg = weight_kg*-1 WHERE weight_kg<0;
COMMIT;
SELECT * FROM animals;


SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts=0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, AVG(escape_attempts) FROM animals GROUP BY neutered ORDER BY AVG DESC LIMIT 1;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

/* day 3 */
Select *
from animals INNER JOIN owners 
ON owners.id = animals.owner_id 
WHERE owners.full_name = 'Melody Pond';

SELECT *
FROM animals INNER JOIN species 
ON species.id = animals.species_id 
WHERE species.name = 'Pokemon';

SELECT owners.full_name, animals.name 
FROM owners LEFT JOIN animals 
ON animals.owner_id = owners.id;

SELECT species.name, count(species.name) 
FROM animals INNER JOIN species 
on animals.species_id = species.id 
GROUP BY species.name;

SELECT owners.full_name,animals.name 
FROM animals INNER JOIN owners 
ON owners.id = animals.owner_id 
WHERE owners.full_name='Jennifer Orwell' AND animals.species_id=2;

SELECT owners.full_name, animals.name, animals.escape_attempts 
FROM animals INNER JOIN owners 
ON owners.id = animals.owner_id 
WHERE owners.full_name='Dean Winchester' AND animals.escape_attempts=0;

SELECT owners.full_name, count(animals.owner_id) 
FROM animals INNER JOIN owners on owners.id = animals.owner_id 
GROUP BY owners.full_name
ORDER BY count DESC LIMIT 1;
