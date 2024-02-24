use master;
go
drop database if  exists zadatak1zupanija;
go
create database zadatak1zupanija;
go
alter database zadatak1zupanija collate Croatian_CI_AS;
go
use zadatak1zupanija;


create table zupani(
sifra int not null primary key identity(1,1),
ime varchar(50) not null,
prezime varchar(50) not null
);

create table zupanije(
sifra int not null primary key identity(1,1),
naziv varchar(100) not null,
zupan int not null
);

create table opcine(
sifra int not null primary key identity(1,1),
naziv varchar(50) not null,
zupanija int not null
);

create table mjesta(
sifra int not null primary key identity(1,1),
naziv varchar(50) not null,
opcina int not null
);


alter table zupanije add foreign key (zupan) references zupani (sifra);
alter table opcine add foreign key (zupanija) references zupanije (sifra);
alter table mjesta add foreign key (opcina) references opcine (sifra);


insert into zupani (ime,prezime) values
('Mato','Lukić'),
('Antonija','Jozić'),
('Danijel','Marušić');

insert into zupanije (naziv,zupan) values
('Osječko-baranjska',1),
('Požeško-slavonska',2),
('Brodsko-posavska',3);

insert into opcine (naziv,zupanija) values
('Antunovac',1),
('Bilje',1),
('Velika',2),
('Jakšić',2),
('Bebrina',3),
('Bukovlje',3);

insert into mjesta (naziv, opcina) values
('Antunovac',1),
('Ivanovac',1),
('Lug',2),
('Tikveš',2),
('Toranj',3),
('Radovanci',3),
('Radnovac',4),
('Eminovci',4),
('Dubočac',5),
('Kaniža',5),
('Vranovci',6),
('Ježevik',6);


update mjesta set naziv='Kozjak' where sifra = 3;
update mjesta set naziv='Vardarac' where sifra = 4;
update mjesta set naziv='Draga' where sifra = 5;
update mjesta set naziv='Doljanci' where sifra = 6;
update mjesta set naziv='Korduševci' where sifra = 12;


select * from opcine;
select * from mjesta;

delete from mjesta where sifra = 1;
delete from mjesta where sifra = 2;
delete from mjesta where sifra = 3;
delete from mjesta where sifra = 4;

delete from opcine where sifra = 1;
delete from opcine where sifra = 2;
