use master;
go
drop database if exists urar;
go
create database urar;
go
use urar;


create table urari(
id int not null primary key identity(1,1),
ime varchar(50),
strucnost varchar(10)
);

create table korisnici(
id int not null primary key identity(1,1),
ime varchar(50),
prezime varchar(50),
kontakt varchar(150) not null
);

create table satovi(
id int not null primary key identity(1,1),
vrsta varchar(50),
kvar varchar(255) not null,
korisnik int not null
);

create table popravak(
urar int not null,
sat int not null
);


alter table satovi add foreign key (korisnik) references korisnici (id);
alter table popravak add foreign key (urar) references urari (id);
alter table popravak add foreign key (sat) references satovi (id);