use master;
go
drop database if exists osnovnaskola;
go
create database osnovnaskola;
go
use osnovnaskola;


create table radionice(
id int not null primary key identity(1,1),
naziv varchar(150) not null,
trajanje time,
uciteljica int not null
);

create table djeca(
id int not null primary key identity(1,1),
ime varchar(50) not null,
dob int,
);

create table uciteljice(
id int not null primary key identity(1,1),
ime varchar(50) not null,
struka varchar(150)
);

create table aktivnost(
radionica int not null,
dijete int not null
);


alter table radionice add foreign key (uciteljica) references uciteljice (id);
alter table aktivnost add foreign key (radionica) references radionice (id);
alter table aktivnost add foreign key (dijete) references djeca (id);