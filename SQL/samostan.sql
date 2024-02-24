use master;
go
drop database if exists samostan;
go

create database samostan;
go
alter database samostan collate Croatian_CI_AS;
go
use samostan;

create table svecenici(
id int not null primary key identity(1,1),
ime varchar(100) not null,
nadredjeni int not null
);

create table poslovi(
id int not null primary key identity(1,1),
opisposla varchar(255)
);

create table rad(
svecenik int not null,
posao int not null
);

alter table svecenici add foreign key (nadredjeni) references svecenici (id);
alter table rad add foreign key (svecenik) references svecenici (id);
alter table rad add foreign key (posao) references poslovi (id);