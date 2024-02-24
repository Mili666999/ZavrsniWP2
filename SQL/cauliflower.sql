use master;
go
drop database if exists cauliflower;
go

create database cauliflower;
go
alter database cauliflower collate Croatian_CI_AS;
go
use cauliflower;


create table autori(
id int not null primary key identity(1,1),
ime varchar(50) not null,
prezime varchar(50),
);

create table umjetnine(
id int not null primary key identity(1,1),
prodaja int not null,
prodavac int not null,
autor int not null,
naziv varchar(100) not null,
pocetnaCijena decimal(20,2) not null
);

create table aukcije(
id int not null primary key identity(1,1),
datumOdrzavanja datetime not null
);

create table prodavaci(
id int not null primary key identity(1,1),
ime varchar(50) not null,
prezime varchar(50) not null,
kontakt varchar(150) not null
);

create table prodaje(
id int not null primary key identity(1,1),
aukcija int not null,
kupac int,
posrednik int,
zavrsnaCijena decimal(20,2) not null
);

create table kupci(
id int not null primary key identity(1,1),
ime varchar(50) not null,
prezime varchar(50) not null,
kontakt varchar(150) not null
);

create table posrednici(
id int not null primary key identity(1,1),
ime varchar(50) not null,
prezime varchar(50) not null,
kontakt varchar(150) not null
);

create table posredovanje(
kupac int not null,
posrednik int not null
);


alter table umjetnine add foreign key (autor) references autori (id);
alter table umjetnine add foreign key (prodavac) references prodavaci (id);
alter table umjetnine add foreign key (prodaja) references prodaje (id);

alter table prodaje add foreign key (aukcija) references aukcije (id);
alter table prodaje add foreign key (kupac) references kupci (id);
alter table prodaje add foreign key (posrednik) references posrednici (id);

alter table posredovanje add foreign key (kupac) references kupci (id);
alter table posredovanje add foreign key (posrednik) references posrednici (id);
