use master;
go
drop database if exists taxisluzba;
go
create database taxisluzba;
go
use taxisluzba;

create table vozilo(
id int not null primary key identity(1,1),
marka varchar(20) not null,
model varchar(20) not null,
vin varchar(50) not null,
vozac int not null
);

create table vozac(
id int not null primary key identity(1,1),
ime varchar(50) not null,
prezime varchar(50) not null,
oib char(11) not null
);

create table voznja(
id int not null primary key identity(1,1),
datum datetime not null,
oddo varchar(100) not null,
vozac int not null
);

create table putnik(
id int not null primary key identity(1,1),
ime varchar(50),
prezime varchar(50),
kontakt varchar(150) not null
);

create table voznjaputnik(
voznja int not null,
putnik int not null
);

alter table vozilo add foreign key (vozac) references vozac(id);
alter table voznja add foreign key (vozac) references vozac(id);
alter table voznjaputnik add foreign key (voznja) references voznja(id);
alter table voznjaputnik add foreign key (putnik) references putnik(id);