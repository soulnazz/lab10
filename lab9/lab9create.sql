create table tip_klient (
id_tip_klient int not null primary key identity(1,1),
tip_klient nvarchar(50) not null
);
create table rayon (
id_rayon int not null primary key identity(1,1),
rayon nvarchar(50) not null
);
create table klient_ (
id_klient int not null primary key identity(1,1),
fam nvarchar(50) not null,
imya nvarchar(50) not null,
otch nvarchar(50) not null,
passport nvarchar(12) not null,
pasword nvarchar(50) not null,
loginn nvarchar(50) not null,
mesto_raboty nvarchar(50) not null,
skidka nvarchar(50) not null,
id_rayon int foreign key references rayon(id_rayon) not null,
id_tip_klient int foreign key references tip_klient(id_tip_klient) not null
);
create table tip_kontaktov (
id_tip_kontaktov int not null primary key identity(1,1),
tip_kontaktov nvarchar(50) not null
);
create table kontakty (
id_kontakty int not null primary key identity(1,1),
kontakty nvarchar(50) not null,
id_klient int foreign key references klient_(id_klient) not null,
id_tip_kontaktov int foreign key references tip_kontaktov(id_tip_kontaktov) not null
);
create table tip_zakaza (
id_tip_zakaza int not null primary key identity(1,1),
tip_zakaza nvarchar(50) not null
);
create table tip_prodaj (
id_tip_prodaj int not null primary key identity(1,1),
tip_prodaj nvarchar(50) not null
);
create table sostoyanie (
id_sostoyanie int not null primary key identity(1,1),
sostoyanie nvarchar(50) not null
);
create table doljnist (
id_doljnist int not null primary key identity(1,1),
doljnist nvarchar(50) not null
);
create table sotrudnik (
id_sotrudnik int not null primary key identity(1,1),
fam nvarchar(50) not null,
imya nvarchar(50) not null,
otch nvarchar(50) not null,
id_doljnist int foreign key references doljnist(id_doljnist) not null
);
create table zakaz (
id_zakaz int not null primary key identity(1,1),
dataPos date not null,
nommer_doc nvarchar(50) not null,
comments nvarchar(50) not null,
id_klient int foreign key references klient_(id_klient) not null,
id_tip_zakaza int foreign key references tip_zakaza(id_tip_zakaza) not null,
id_sostoyanie int foreign key references sostoyanie(id_sostoyanie) not null,
id_tip_prodaj int foreign key references tip_prodaj(id_tip_prodaj) not null,
id_sotrudnik int foreign key references sotrudnik(id_sotrudnik) not null
);
create table vid_oplaty (
id_vid_oplaty int not null primary key identity(1,1),
vid_oplaty nvarchar(50) not null
);
create table oplata (
id_oplata int not null primary key identity(1,1),
dataOplati date not null,
summa float not null,
comments nvarchar(50) not null,
id_zakaz int foreign key references zakaz(id_zakaz) not null,
id_vid_oplaty int foreign key references vid_oplaty(id_vid_oplaty) not null
);
create table tip_tovara (
id_tip_tovara int not null primary key identity(1,1),
tip_tovara nvarchar(50) not null
);
create table tovar (
id_tovar int not null primary key identity(1,1),
tovar nvarchar(50) not null,
comments nvarchar(50) not null,
photo nvarchar(500) not null,
id_tip_tovara int foreign key references tip_tovara(id_tip_tovara) not null
);
create table price_list (
id_price_list int not null primary key identity(1,1),
cena float not null,
dataa date not null,
comments nvarchar(50) not null,
id_tovar int foreign key references tovar(id_tovar) not null
); 
create table tip_postavshika (
id_tip_postavshika int not null primary key identity(1,1),
tip_postavshika nvarchar(50) not null
); 
create table postavshik (
id_postavshik int not null primary key identity(1,1),
nazvanie nvarchar(50) not null,
fam nvarchar(50) not null,
imya nvarchar(50) not null,
otch nvarchar(50) not null,
id_tip_postavshika int foreign key references tip_postavshika(id_tip_postavshika) not null
);
create table tip_postavki (
id_tip_postavki int not null primary key identity(1,1),
tip_postavki nvarchar(50) not null
);
create table postavki (
id_postavki int not null primary key identity(1,1),
nomer_doc nvarchar(50) not null,
dataa date not null,
comments nvarchar(500) not null,
id_postavshik int foreign key references postavshik(id_postavshik) not null,
id_tip_postavki int foreign key references tip_postavki(id_tip_postavki) not null
);
create table oplataPostavki (
id_oplata int not null primary key identity(1,1),
dataOp date not null,
summa float not null,
comments nvarchar(500) not null,
id_postavki int foreign key references postavki(id_postavki) not null
);
create table spisok_postavki (
id_spisok_postavki int not null primary key identity(1,1),
id_postavki  int foreign key references postavki(id_postavki) not null,
ceana float not null,
kol_vo int not null,
srok_godnosti date not null
);
create table spisok_tovarov (
id_spisok_tovarov int not null primary key identity(1,1),
cena float not null,
kolichestvo int not null,
id_zakaz int foreign key references zakaz(id_zakaz) not null,
id_tovar int foreign key references tovar(id_tovar) not null,
id_spisok_postavki int foreign key references spisok_postavki(id_spisok_postavki) not null
);


