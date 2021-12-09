/* Populate database with sample data. */

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Agumon','2020-02-03',0,true,10.23);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Gabumon','2018-11-15',2,true,8);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Pikachu','2021-01-07',1,false,15.04);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Devimon','2017-05-12',5,true,11);
---INSERT INTO animals (name) VALUES ('Charlie');
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Charmander','2020-02-08',0,false,-11);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Plantmon','2022-11-15',2,true,-5.7);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Squirtle','1993-04-02',3,false,-12.13);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Angemon','2005-06-12',1,true,-45);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Boarmon','2005-06-07',7,true,20);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Blossom','1998-10-13',3,true,17);

BEGIN;

UPDATE animals SET species = 'unspecified';

ROLLBACK;

BEGIN;
UPDATE animals SET species ='digimon'  WHERE name LIKE '%mon';

UPDATE animals SET species ='pokemon'  WHERE species IS NULL;

COMMIT;

BEGIN;

DELETE FROM animals;

ROLLBACK;

BEGIN;
DELETE FROM animals WHERE date_of_birth >= '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg*(-1);

ROLLBACK TO SP1;

UPDATE animals SET weight_kg = weight_kg*(-1) WHERE weight_kg < 0;
COMMIT;

insert into owners (full_name,age) values('Sam Smith', 34);
insert into owners (full_name,age) values('Jennifer Orwell', 19);
insert into owners (full_name,age) values('Bob', 45);
insert into owners (full_name,age) values('Melody Pond', 77);
insert into owners (full_name,age) values('Dean Winchester', 14);
insert into owners (full_name,age) values('Jodie Whittaker ', 38);

insert into species(name) values('Pokemon');
insert into species(name) values('Digimon');

update animals set species_id = 2 where name like '%mon';
update animals set species_id = 1 where species_id is null;

update animals 
set owner_id =(select id from owners where full_name = 'Sam Smith') where name='Agumon';

update animals 
set owner_id =(select id from owners where full_name = 'Jennifer Orwell') 
where name='Gabumon' or name='Pikachu';

update animals 
set owner_id =(select id from owners where full_name = 'Bob') 
where name='Devimon' or name='Plantmon';

update animals 
set owner_id =(select id from owners where full_name = 'Melody Pond') 
where name='Charmander' or name='Squirtle' or name='Blossom';

update animals 
set owner_id =(select id from owners where full_name = 'Dean Winchester') 
where name='Angemon' or name='Boarmon';

