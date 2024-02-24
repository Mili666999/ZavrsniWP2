use master;
go
drop database if exists frizerskisalon;
go
create database frizerskisalon;
go
use frizerskisalon;

create table djelatnici(
id int not null primary key identity(1,1),
ime varchar(50) not null,
prezime varchar(50) not null,
oib char(11) not null,
iban varchar(50) not null
);

create table korisnici(
id int not null primary key identity(1,1),
ime varchar(50),
prezime varchar(50),
kontakt varchar(150) not null
);

create table usluge(
id int not null primary key identity(1,1),
naziv varchar(100) not null,
cijena decimal(6,2)
);

create table posjeta(
datum datetime,
djelatnik int not null,
korisnik int not null,
usluga int not null
);

alter table posjeta add foreign key (djelatnik) references djelatnici (id);
alter table posjeta add foreign key (korisnik) references korisnici (id);
alter table posjeta add foreign key (usluga) references usluge (id);