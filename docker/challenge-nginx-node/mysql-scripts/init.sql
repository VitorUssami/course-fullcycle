create table if not exists people
(
    id int not null auto_increment primary key,
    name varchar(255) not null
);

--insert into people (name) values ("Vitor");