/* Populate database with sample data. */

INSERT INTO animals (name) VALUES ('Luna');
INSERT INTO animals (name) VALUES ('Daisy');
INSERT INTO animals (name) VALUES ('Charlie');

INSERT INTO animals 
(name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Agumon', '02-03-2020', 0, TRUE, 10.23),

INSERT INTO animals (
name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES 
('Gabumon', '11-15-2018', 2, TRUE, 8), 
('Pikachu', '01-07-2021', 1, FALSE, 15.04), 
('Devimon', '05-12-2017', 5, TRUE, 11);
