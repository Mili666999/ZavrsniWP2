use master;
go
drop database if exists udrugazzz;
go

create database udrugazzz;
go
alter database udrugazzz collate Croatian_CI_AS;
go
use udrugazzz;


create table osobe(
id int not null primary key identity(1,1),
ime varchar(50) not null,
prezime varchar(50) not null,
kontakt varchar(150) not null
);

create table zivotinje(
id int not null primary key identity(1,1),
vrsta varchar(50) not null,
spol varchar(6) not null,
ime varchar(50) not null,
prostor int not null
);

create table prostori(
id int not null primary key identity(1,1),
oznaka varchar (50) not null,
povrsina int
);

create table briga(
osoba int not null,
zivotinja int not null
);

alter table zivotinje add foreign key (prostor) references prostori(id);
alter table briga add foreign key (osoba) references osobe(id);
alter table briga add foreign key (zivotinja) references zivotinje(id);