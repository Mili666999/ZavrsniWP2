use master;
go
drop database if exists odvjetnik;
go
create database odvjetnik;
go
use odvjetnik;


create table odvjetnici(
id int not null primary key identity(1,1),
ime varchar(50) not null
);

create table klijenti(
id int not null primary key identity(1,1),
ime varchar(50) not null,
odvjetnik int not null
);

create table suradnici(
id int not null primary key identity(1,1),
ime varchar(50) not null
);

create table obrane(
id int not null primary key identity(1,1),
klijent int not null
);

create table procesi(
id int not null primary key identity(1,1),
suradnik int not null,
obrana int not null
);


alter table klijenti add foreign key (odvjetnik) references odvjetnici (id);
alter table obrane add foreign key (klijent) references klijenti (id);
alter table procesi add foreign key (suradnik) references suradnici (id);
alter table procesi add foreign key (obrana) references obrane (id);