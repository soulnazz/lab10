INSERT INTO tip_tovara (tip_tovara) 
VALUES 
('Appliances'),
('Clothing'),
('Furniture'),
('Dishes');
INSERT INTO tovar (tovar, comments, photo, id_tip_tovara)
VALUES
('Fridge', 'Latest model,sensory', 'fridge.jpg', 1),
('Dress', 'Stylish and comfortable', 'dress.jpg', 2),
('Sofa', 'Comfortable and spacious', 'sofa.jpg', 3),
('Сoffee pot', 'Powerful and easy to use', 'coffee.jpg', 4);
INSERT INTO price_list (cena, dataa, comments, id_tovar)
VALUES 
(999.99, '2022-12-01', 'Launch price', 1),
(39.99, '2022-06-01', 'Summer collection', 2),
(499.99, '2022-08-01', 'Limited offer', 3),
(79.99, '2022-09-01', 'Fall collection', 4);
INSERT INTO tip_postavshika (tip_postavshika)
VALUES 
('Manufacturer'),
('Retailer'),
('Distributor'),
('Wholesaler');
INSERT INTO postavshik (nazvanie, fam, imya, otch, id_tip_postavshika)
VALUES 
('LG.', 'Ku', 'Kwang', 'Mo', 1),
('PINKO', 'Raskin', 'Denis ', 'Yurievich', 2),
('Lina', 'Asanov', 'Tagdyr', 'Mirbekovich', 3),
('Moka', 'Ladokha', 'Mikhail', 'Alexandrovich', 4);
INSERT INTO tip_postavki (tip_postavki)
VALUES
('Наземная перевозка грузов'),
('2-дневная доставка'),
('Доставка на следующий день'),
('Международный доставка');
INSERT INTO postavki (nomer_doc, dataa, comments, id_postavshik, id_tip_postavki)
VALUES 
('P0001', '2022-01-01', 'Первая поставка отLG', 1, 1),
('P0002', '2022-02-01', 'Ежемесячная отгрузка от  PINKO', 2, 2),
('P0003', '2022-03-01', 'Еженедельная отгрузка от LINA', 3, 3),
('P0004', '2022-04-01', 'Ежемесячная отгрузка от Moka', 4, 4);
INSERT INTO oplataPostavki (dataOp, summa, comments, id_postavki)
VALUES 
('2022-01-05', 1000, 'Оплата за отгрузку P0001', 1),
('2022-02-01', 2000, 'Оплата за отгрузку P0002', 2),
('2022-03-10', 1500, 'Оплата за отгрузку P0003', 3),
('2022-04-15', 2500, 'Оплата за отгрузку P0004', 4);
INSERT INTO spisok_postavki (id_postavki, ceana, kol_vo, srok_godnosti)
VALUES 
(1, 20, 50, '2022-12-31'),
(2, 30, 40, '2023-05-31'),
(3, 25, 60, '2023-07-31'),
(4, 35, 70, '2023-10-31');
INSERT INTO rayon(rayon)
VALUES 
('Центральный'),
('Пригородный'),
('Сельский');
INSERT INTO tip_klient(tip_klient)
VALUES 
('Retail'),
('Wholesale'),
('Private');
INSERT INTO klient_(fam, imya, otch, passport, pasword, loginn, mesto_raboty, skidka, id_rayon, id_tip_klient)
VALUES 
('Kutmanbek kyzy', 'Dilnaz', 'Kutmanbek', 'dili', 'password1', 'soulnazz', 'Microsoft', 10, 1, 1),
('Tileshbaeva', 'Ainazik', 'Zhyrgalbekovna', 'naziko', 'password2', 'nnazikk', 'Google', 20, 2, 2),
('Baatyrbaeva', 'Asel', 'Nurkamilovna', 'aselya', 'password3', '', 'gulasel', 30, 3, 3);
INSERT INTO tip_kontaktov(tip_kontaktov)
VALUES ('email'), ('phone'), ('skype'), ('viber'), ('whatsapp');
INSERT INTO kontakty(kontakty, id_klient, id_tip_kontaktov)
VALUES 
('kutmanbekkyzydilnaz@gmail.com', 1, 1),
('0779285195', 2, 2),
('Dilnaz@skype', 3, 3);	
INSERT INTO sostoyanie (sostoyanie)
VALUES ('active'), ('inactive'), ('suspended');
INSERT INTO tip_zakaza (tip_zakaza)
VALUES ('Retail'), ('Wholesale'), ('Bulk');
INSERT INTO tip_prodaj (tip_prodaj)
VALUES ('Retail'), ('Wholesale'), ('Online');
INSERT INTO doljnist (doljnist)
VALUES ('Manager'), ('Developer'), ('Sales representative'), ('Accountant'), ('Secretary');
INSERT INTO sotrudnik (fam, imya, otch, id_doljnist)
VALUES 
('Attokurov', 'Tilek', 'Nooruzbaev', 1),
('Otkurbekov', 'Abdumalik', 'Bakytovich', 3),
('Manasova', 'Amina', 'Belekovich', 4);
INSERT INTO vid_oplaty (vid_oplaty)
VALUES ('cash'), ('non-cash'), ('credit card');
INSERT INTO zakaz (dataPos, nommer_doc, comments, id_klient, id_tip_zakaza, id_sostoyanie, id_tip_prodaj, id_sotrudnik)
VALUES ('2023-02-11', '0001', 'comment 1', 1, 1, 1, 1, 1),
       ('2023-02-12', '0002', 'comment 2', 2, 2, 2, 2, 2),
       ('2023-02-13', '0003', 'comment 3', 3, 3, 3, 3, 3);
INSERT INTO oplata (dataOplati, summa, comments, id_zakaz, id_vid_oplaty)
VALUES
('2022-01-01', 1000, 'Payment for order 1', 5, 1),
('2022-02-01', 500, 'Payment for order 2', 6, 2),
('2022-03-01', 800, 'Payment for order 3', 7, 3);
INSERT INTO spisok_tovarov(cena, kolichestvo, id_zakaz, id_tovar, id_spisok_postavki)
VALUES (100, 2, 5, 1, 1),
(200, 3, 6, 2, 2),
(150, 4, 7, 3, 3);
