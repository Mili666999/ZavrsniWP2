use master;
go
drop database if exists crvenkapica;
go
create database crvenkapica;
go
use crvenkapica;

create table prijave(
sifra int not null primary key identity(1,1),
imeDjeteta varchar(50) not null,
prezimeDjeteta varchar(50) not null,
prezimeRoditelja varchar(50) not null,
datumRodenjaDjeteta date,
kontakt varchar(150) not null
);

create table dogadanja(
sifra int not null primary key identity(1,1),
datum date not null,
naziv varchar(100) not null,
opis varchar(255)
);

create table odgojneSkupine(
sifra int not null primary key identity(1,1),
imeOdgojiteljice varchar(100),
naziv varchar(50) not null,
brojDjece int not null,
dijete int not null
);

create table galerije(
sifra int not null primary key identity(1,1),
naziv varchar(100) not null,
lokacija varchar(255) not null,
dogadanje int not null
);

create table djeca(
sifra int not null primary key identity(1,1),
prijava int not null,
zapazanje varchar(255)
);


alter table djeca add foreign key (prijava) references prijave(sifra);
alter table odgojneSkupine add foreign key (dijete) references djeca(sifra);
alter table galerije add foreign key (dogadanje) references dogadanja(sifra);