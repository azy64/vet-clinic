/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id int GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    date_of_birth date,
    escape_attempts int,
    neutered boolean, 
    weight_kg real,
    primary key(id)
);
alter table animals add species varchar(100);

create table owners (
    id int primary key GENERATED ALWAYS as IDENTITY,
    full_name varchar(100),
    age int
);

create table species (
    id int primary key GENERATED ALWAYS as IDENTITY,
    name varchar(100)
);

ALTER TABLE animals drop species;
ALTER TABLE animals 
add species_id int references species(id);

ALTER TABLE animals 
add owner_id int references owners(id);
