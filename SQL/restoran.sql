use master;
go
drop database if exists restoran;
go
create database restoran;
go
use restoran;


create table kategorije(
id int not null primary key identity(1,1),
naziv varchar(100) not null
);

create table jela(
id int not null primary key identity(1,1),
naziv varchar(100) not null,
kategorija int not null
);

create table pica(
id int not null primary key identity(1,1),
naziv varchar(100) not null 
);

create table obrok(
jelo int not null,
pice int not null
);


alter table jela add foreign key (kategorija) references kategorije (id);
alter table obrok add foreign key (jelo) references jela (id);
alter table obrok add foreign key (pice) references pica (id);