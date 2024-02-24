
use master;
go
drop database if exists djelatnici;
go
create database djelatnici;
go
alter database edunovawp2 collate Croatian_CI_AS;
go
use djelatnici;


create table fotografije(
id int not null primary key identity(1,1),
datum date not null,
djelatnik int not null
);

create table dokumenti(
id int not null primary key identity(1,1),
naziv varchar(100),
datum date not null,
djelatnik int not null
);

create table djelatnici(
id int not null primary key identity(1,1),
ime varchar(50) not null,
prezime varchar(50) not null,
email varchar(150) not null,
mobitel varchar(20) not null,
oib char(11) not null,
iban varchar(50) not null
);


alter table fotografije add foreign key (djelatnik) references djelatnici(id);
alter table dokumenti add foreign key (djelatnik) references djelatnici(id);


--Unos Djelatnika
insert into djelatnici (ime,prezime,email,mobitel,oib,iban) values
('Ana','Horvat','anahorvat@firma.hr','0912345678','48807033063','HR48807033063'),
('Filip','Petrović','filippetrovic@firma.hr','092/456-4321','75942713307','HR75942713307'),
('Ivan','Kovačić','ivankovacic@firma.hr','+385959876543','03430120955','HR03430120955'),
('Lara','Marković','laramarkovic@firma.hr','099-516-879','82712977132','HR82712977132'),
('Lea','Šimić','leasimic@firma.hr','098/987/6543','97732515526','HR97732515526'),
('Luka','Novak','lukanovak@firma.hr','+3870123456789','85299208009','HR85299208009'),
('Marko','Vuković','markovukovic@firma.hr','+385-91-234-5678','27954351006','HR27954351006'),
('Mateo','Tomić','mateotomic@firma.hr','095*789*9876','09282353996','HR09282353996'),
('Mia','Jurić','miajuric@firma.hr','092 567 8910','00486563817','HR00486563817'),
('Petra','Kovač','petrakovac@firma.hr','+385/097/147/3698','56031664672','HR56031664672');


--Unos Fotografija
INSERT INTO fotografije (datum, djelatnik)
VALUES ('2023-01-01', 1);

INSERT INTO fotografije (datum, djelatnik)
VALUES ('2023-02-02', 2);

INSERT INTO fotografije (datum, djelatnik)
VALUES ('2023-03-03', 3);

INSERT INTO fotografije (datum, djelatnik)
VALUES ('2023-04-04', 4);

INSERT INTO fotografije (datum, djelatnik)
VALUES ('2023-05-05', 5);

INSERT INTO fotografije (datum, djelatnik)
VALUES ('2023-06-06', 6);

INSERT INTO fotografije (datum, djelatnik)
VALUES ('2023-07-07', 7);

INSERT INTO fotografije (datum, djelatnik)
VALUES ('2023-08-08', 8);

INSERT INTO fotografije (datum, djelatnik)
VALUES ('2023-09-09', 9);

INSERT INTO fotografije (datum, djelatnik)
VALUES ('2023-10-10', 10);


--Unos Dokumenata
INSERT INTO dokumenti (naziv, datum, djelatnik) VALUES 
('AnaHorvatUgovor', '2023-01-01', 1),
('AnaHorvatZivotopis', '2023-01-01', 1),
('FilipPetrovicUgovor', '2023-02-02', 2),
('FilipPetrovicZivotopis', '2023-02-02', 2),
('IvanKovacicUgovor', '2023-03-03', 3),
('IvanKovacicZivotopis', '2023-03-03', 3),
('LaraMarkovicUgovor', '2023-04-04', 4),
('LaraMarkovicZivotopis', '2023-04-04', 4),
('LeaSimicUgovor', '2023-05-05', 5),
('LeaSimicZivotopis', '2023-05-05', 5),
('LukaNovakUgovor', '2023-06-06', 6),
('LukaNovakZivotopis', '2023-06-06', 6),
('MarkoVukovicUgovor', '2023-07-07', 7),
('MarkoVukovicZivotopis', '2023-07-07', 7),
('MateoTomicUgovor', '2023-08-08', 8),
('MateoTomicZivotopis', '2023-08-08', 8),
('MiaJuricUgovor', '2023-09-09', 9),
('MiaJuricZivotopis', '2023-09-09', 9),
('PetraKovacUgovor', '2023-10-10', 10),
('PetraKovacZivotopis', '2023-10-10', 10);

select * from dokumenti;