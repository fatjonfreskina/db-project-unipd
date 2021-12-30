-- Connect to the database.
\c dbmsdb

-- Insert roles.
INSERT INTO role VALUES
('Seller'),
('Mechanic'),
('Financial');

-- Insert the car dealer branches.
INSERT INTO branch (name, city, phone, fax, address) VALUES
('Motorsport', 'Padova', '0497867801', '0492727225', 'Viale dei Giardini 2'),
('Unicar', 'Milano', '0259162579', '0252856087', 'Via Zane 5'),
('Automania', 'Verona', '0453183789', '0457631961', 'Via Garibaldi 15');

-- Insert the employees.
INSERT INTO employee (tc, name, surname, email, password, roleid, branchid) VALUES
('RSSMRA74E23G224P', 'Mario', 'Rossi', 'mario.rossi@gmail.com', 'e5fa44f2b31c1fb553b6021e7360d07d5d91ff5e', 'Seller', 'Motorsport'),
('PRIRSS85P29L900N', 'Piero', 'Russo', 'piero.russo@msn.com', '7448d8798a4380162d4b56f9b452e2f6f9e24e7a', 'Mechanic', 'Motorsport'),
('CLMGLI90E41G224E', 'Giulia', 'Colombo', 'giulia.colombo@gmail.com', 'a3db5c13ff90a36963278c6a39e4ee3c22e2a436', 'Seller', 'Motorsport'),
('SNTRRT70B69L736R', 'Roberta', 'Santoro', 'roberta.santoro.3@gmail.com', '9c6b057a2b9d96a4067a749ee3b3b0158d390cf1', 'Financial', 'Motorsport'),
('BNVZZE18P16C377F', 'Zete', 'Beneventano', 'zete.beneventano@gmail.com', '5d9474c0309b7ca09a182d888f73b37a8fe1362c', 'Mechanic', 'Motorsport'),
('SYLDNM04C47B947T', 'Adelina Maria', 'Sylla', 'aelina.sylla@gmail.com', 'ccf271b7830882da1791852baeca1737fcbe4b90', 'Seller', 'Motorsport'),
('PLNRMR33A62M271C', 'Rosmeri', 'Plantone', 'rosmeri.plantone@hotmail.com', 'd3964f9dad9f60363c81b688324d95b4ec7c8038', 'Financial', 'Motorsport'),
('PRRMTH10E53D682J', 'Martha Jazmina', 'Parrinello', 'martha.parrinello@gmail.com', '136571b41aa14adc10c5f3c987d43c02c8f5d498', 'Seller', 'Unicar'),
('MRTMST90A46F980M', 'Mariastella Cristina', 'Martari', 'mariastella.martari@gmail.com', 'b6abd567fa79cbe0196d093a067271361dc6ca8b', 'Financial', 'Unicar'),
('CRRLDE88M13A735I', 'Ledio', 'Carrozzo', 'ledio.carrozzo.4@gmail.com', '4143d3a341877154d6e95211464e1df1015b74bd', 'Mechanic', 'Unicar'),
('GHTMLT08H54D548U', 'Maria Altomare', 'Ghita', 'maria.ghita@alice.it', '29581e412c0981bffd7d0f4a9cdd9b114fb80947', 'Seller', 'Unicar'),
('BSCLRT83C10G997N', 'Alberto', 'Boschetti', 'albero.boschetti.2@gmail.com', 'c6112fc247276d82a57cc9b56a41999dbba4b169', 'Mechanic', 'Unicar'),
('BNCLNZ95R13I181C', 'Lorenzo', 'Bianchi', 'bianchi.lorenzo@gmail.com', '97ea7ec8a6bb8ab9049d86bc39b5be2b0800b14b', 'Mechanic', 'Unicar'),
('BGLGLI09B14E415X', 'Giulio', 'Boglione', 'giulio.boglione.10@gmail.com', '22980f6cd0807e719d7f1b7cf25edc9df659ba1f', 'Seller', 'Unicar'),
('PCTLGU93P15F748V', 'Luigi', 'Pacotto', 'luigi.pacotto@gmail.com', '69340613d824dc2a0f66fef2b97214550b6ae248', 'Mechanic', 'Automania'),
('CSCGTA94T45I290X', 'Agata', 'Ceschini', 'agata.ceschini@hotmail.com', '37e3ecf5f468d8af8698ba15797184523a4b401c', 'Seller', 'Automania'),
('CZZLLN10C71F401D', 'Liliana', 'Cozzolino', 'liliana.cozzolino@yahoo.com', 'eeec021898eec14f9c7c888c5899a81ad4dbf1ae', 'Seller', 'Automania'),
('SCCNNA13B57M332A', 'Anna', 'Siccardi', 'anna.siccardi.2@gmail.com', '45c20f2147e030b02a9a42080890a9183c054eba', 'Financial', 'Automania'),
('GVZLNE62D67H544S', 'Elena', 'Gavazza', 'gavazza.elena@gmail.com', '5bf6e5357bd42a6b1d2a3a040e16a91490064d26', 'Financial', 'Automania'),
('VCCMRA81D09C537Q', 'Mario', 'Vecchiatti', 'mario.vecchiatti.6@gmail.com', '02ede1eec131f84e860e69c181f01c93b2ff6d76', 'Mechanic', 'Automania');

-- Insert the customers.
INSERT INTO customer (tc, name, surname, phone, address) VALUES
('ZDCSBT84D96V439Z', 'Mario', 'Fumagalli', '3938065232', 'Via Garibaldi 2, Brescia'),
('XFKVFA20N06I270H', 'Leonardo', 'Urietti', '3348132175', 'Via Mazzini 160, Padova'),
('FROHVS03Y31Z372K', 'Maria', 'Compagni', '3471069829', 'Via Fermi 31, Verona'),
('FPOMKO55E27M241C', 'Paola', 'Feno', '3375151678', 'Via Dante 1, Vigonza'),
('ITQFWR28S88Y708C', 'Fioretta', 'Giovanetti', '3904089468', 'Via Svezia 15, Milano'),
('MJTIVC50U54C200B', 'Alberto', 'Bagarini', '3595872628', 'Viale dei Giardini, Roma'),
('TJVHSI68C02P347G', 'Franco', 'Borcoi', '3646455934', 'Piazza del Duomo, Milano'),
('YSOOUM39V36Q049N', 'Rosa', 'Alfieri', '3724483031', 'Via Piave, Mestre'),
('ZOHWSS89B32H213P', 'Tizio', 'Cheneso', '3466786545', 'Via Padova, Padova');

-- Insert the models.
INSERT INTO model (brand, name) VALUES
('Fiat', 'Panda'),
('Fiat', '500'),
('Ford', 'Focus Wagon'),
('Alfa Romeo', 'Mito'),
('Lancia', 'Ypsilon'),
('Mini', 'Cooper'),
('Opel', 'Corsa'),
('Toyota', 'Yaris'),
('Peugeot', 'Expert'),
('RangeRover', 'Velar'),
('Porsche', 'Panamera'),
('Citroen', 'Picasso'),
('Mercedes', 'C220');

-- Insert the cars.
INSERT INTO car (lp, status, type, category, price, km, year, name, brand) VALUES
('FZ286JY', 'Available', 'New', 'ForSale', 16200.00, 0, 2021, 'Ypsilon', 'Lancia'),
('FW680RN', 'Available', 'New', 'ForSale', 22000.00, 0, 2021, 'Yaris', 'Toyota'),
('FN885VO', 'Rented', 'Used', 'ForSaleRental', 7800.00, 30000, 2019, 'Corsa', 'Opel'),
('DI229PJ', 'Rented', 'Used', 'ForSaleRental', 1500.00, 180000, 2009, 'Corsa', 'Opel'),
('DG080OB', 'UnderMaintenance', 'Used', 'ForSaleRental', 2000.00, 180000, 2009, 'Yaris', 'Toyota'),
('FX020NR', 'UnderMaintenance', 'New', 'ForSale', 17000.00, 0, 2021, '500', 'Fiat'),
('DL654NV', 'Rented', 'Used', 'ForSaleRental', 3000.00, 180000, 2009, 'Cooper', 'Mini'),
('DO360GM', 'UnderMaintenance', 'Used', 'ForSaleRental', 4500.00, 165000, 2010, 'Focus Wagon', 'Ford'),
('EI946PC', 'UnderMaintenance', 'Used', 'ForSaleRental', 6000.00, 105000, 2014, 'Mito', 'Alfa Romeo'),
('DZ002TP', 'Available', 'Used', 'ForSaleRental', 4700.00, 135000, 2012, 'Mito', 'Alfa Romeo'),
('DS025UY', 'Available', 'Used', 'ForSaleRental', 3200.00, 110000, 2011, 'Panda', 'Fiat'),
('DO362QR', 'Available', 'Used', 'ForSaleRental', 4300.00, 120000, 2010, 'Focus Wagon', 'Ford'),
('DH185CM', 'UnderMaintenance', 'Used', 'ForSaleRental', 1700.00, 145000, 2009, '500', 'Fiat'),
('EX524YC', 'Rented', 'Used', 'ForSaleRental', 8000.00, 75000, 2016, 'Cooper', 'Mini'),
('EM606QA', 'UnderMaintenance', 'Used', 'ForSaleRental', 4200.00, 105000, 2014, 'Panda', 'Fiat'),
('DJ269JO', 'UnderMaintenance', 'Used', 'ForSaleRental', 1300.00, 150000, 2009, 'Yaris', 'Toyota'),
('FP495LS', 'Available', 'Used', 'ForSaleRental', 11000.00, 15000, 2020, 'Ypsilon', 'Lancia'),
('FE756EY', 'Rented', 'Used', 'ForSaleRental', 8800.00, 45000, 2018, 'Corsa', 'Opel'),
('DK237DR', 'Rented', 'Used', 'ForSaleRental', 1800.00, 150000, 2009, 'Panda', 'Fiat'),
('FY168KZ', 'Available', 'New', 'ForSale', 15000.00, 0, 2021, 'Corsa', 'Opel');

-- Insert CustomerCar
INSERT INTO CustomerCar (lp, year , name, brand, customer) VALUES
('OX512LY' , 2008 , 'Expert', 'Peugeot' , 'ZDCSBT84D96V439Z'),
('SI028FY' , 2014 , 'Focus Wagon', 'Ford' , 'XFKVFA20N06I270H'),
('MV871FX' , 2018 , 'Corsa', 'Opel' , 'FROHVS03Y31Z372K'),
('XF505QK' , 2017 , 'Corsa', 'Opel' , 'FPOMKO55E27M241C'),
('YV798RF' , 2016 , 'Velar', 'RangeRover' , 'ITQFWR28S88Y708C'),
('FJ549TY' , 2008 , 'Panamera', 'Porsche' , 'ZOHWSS89B32H213P'),
('HD842VB' , 2016 , 'Picasso', 'Citroen' , 'MJTIVC50U54C200B'),
('PA092PA' , 2012 , 'Focus Wagon', 'Ford' , 'TJVHSI68C02P347G'),
('VB408OO' , 2002 , 'Corsa', 'Opel' , 'YSOOUM39V36Q049N'),
('PI685YC' , 2008 , 'Panda', 'Fiat' , 'ZDCSBT84D96V439Z'),
('QS475SU' , 2018 , 'Expert', 'Peugeot', 'FROHVS03Y31Z372K'),
('AJ588VX' , 2019 , 'C220', 'Mercedes' , 'FPOMKO55E27M241C'),
('RC495ZK' , 2016 , 'C220', 'Mercedes' , 'ITQFWR28S88Y708C'),
('TX671BX' , 2000 , 'Yaris', 'Toyota' , 'ZDCSBT84D96V439Z'),
('CT378MY' , 2009 , 'Cooper', 'Mini' , 'ITQFWR28S88Y708C');

-- Insert Sale
INSERT INTO Sale (date, price, employee, lp, customer) VALUES 
('2020-09-17', 7000.00, 'RSSMRA74E23G224P', 'FZ286JY', 'ZDCSBT84D96V439Z'),
('2017-06-19', 15000.00, 'CLMGLI90E41G224E', 'FW680RN', 'XFKVFA20N06I270H'),
('2018-04-24', 10000.00, 'PRRMTH10E53D682J', 'DZ002TP', 'FROHVS03Y31Z372K'),
('2021-09-28', 20000.00, 'SYLDNM04C47B947T', 'DO362QR', 'FPOMKO55E27M241C');

-- Insert Rental
INSERT INTO rental (start_date, end_date, deal_date, price, employee, customer, lp) VALUES 
('2020-08-11', '2022-07-11', '2020-08-11', 900, 'RSSMRA74E23G224P', 'FROHVS03Y31Z372K', 'FN885VO'),
('2020-06-04', '2023-07-04', '2020-06-04', 630, 'BGLGLI09B14E415X', 'FROHVS03Y31Z372K', 'DI229PJ'),
('2020-06-08', '2022-08-08', '2020-06-08', 530, 'CZZLLN10C71F401D', 'FPOMKO55E27M241C', 'DL654NV'),
('2020-06-06', '2022-08-06', '2020-06-06', 200, 'RSSMRA74E23G224P', 'MJTIVC50U54C200B', 'EX524YC'),
('2019-07-07', '2025-07-07', '2019-07-07', 820, 'BGLGLI09B14E415X', 'FROHVS03Y31Z372K', 'FE756EY'),
('2019-11-18', '2023-04-18', '2019-11-18', 330, 'CZZLLN10C71F401D', 'ITQFWR28S88Y708C', 'DK237DR'),
('2020-09-11', '2025-09-11', '2020-09-11', 600, 'BGLGLI09B14E415X', 'XFKVFA20N06I270H', 'FN885VO'),
('2019-09-17', '2027-09-17', '2019-09-17', 120, 'CSCGTA94T45I290X', 'XFKVFA20N06I270H', 'DI229PJ'),
('2020-05-30', '2022-11-30', '2020-05-28', 610, 'RSSMRA74E23G224P', 'FROHVS03Y31Z372K', 'DL654NV'),
('2019-09-01', '2023-04-01', '2019-09-01', 660, 'CSCGTA94T45I290X', 'XFKVFA20N06I270H', 'EX524YC');

-- Insert Repair
INSERT INTO Repair (date, price, hours, employee) VALUES
('2021-11-06', 2549.14, 7, 'PRIRSS85P29L900N'),
('2020-12-17', 6850.61, 30, 'VCCMRA81D09C537Q'),
('2021-06-24', 5065.35, 33, 'BNVZZE18P16C377F'),
('2021-10-17', 4106.15, 98, 'PRIRSS85P29L900N'),
('2021-11-09', 2799.37, 46, 'BSCLRT83C10G997N'),
('2021-04-23', 7616.73, 72, 'PRIRSS85P29L900N'),
('2021-09-06', 2812.5, 76, 'BNVZZE18P16C377F'),
('2021-05-22', 8042.78, 58, 'BNVZZE18P16C377F'),
('2021-04-02', 2218.69, 31, 'BSCLRT83C10G997N'),
('2021-10-14', 7968.18, 62, 'CRRLDE88M13A735I');

-- Insert CustomerCarRepair
INSERT INTO CustomerCarRepair (lp, repair ) VALUES
('OX512LY' , 1 ),
('SI028FY' , 2 ),
('MV871FX' , 3 ),
('XF505QK' , 4 ),
('YV798RF' , 5 );

-- Insert CarRepair
INSERT INTO CarRepair (lp, repair ) VALUES
('DS025UY', 6 ),
('DO362QR', 7 ),
('DH185CM', 8 ),
('EX524YC', 9 );

-- Insert Supplier
INSERT INTO Supplier (name, phone) VALUES
('AllstarAuto', 3376890987),
('MotorHigh', 3376890987),
('EngineShop', 3376890987);

-- Insert PartKind
INSERT INTO PartKind (name, category ) VALUES
('E9X Rear Suspension', 'Suspension'),
('Primary Tree 4085089', 'Tree'),
('JE Piston 244871-1', 'Piston'),
('ASUPERMALL 300mm', 'Mirror');

-- Insert Supplies
INSERT INTO Supplies (supplier, partkind, catalog_price ) VALUES
('AllstarAuto', 'E9X Rear Suspension', 200.00),
('AllstarAuto', 'JE Piston 244871-1', 1256.40),
('AllstarAuto', 'Primary Tree 4085089', 390.00),
('MotorHigh', 'E9X Rear Suspension', 235.00),
('MotorHigh', 'JE Piston 244871-1', 194.00),
('MotorHigh', 'Primary Tree 4085089', 378.00),
('EngineShop', 'JE Piston 244871-1', 789.9),
('EngineShop', 'ASUPERMALL 300mm', 74.90),
('EngineShop', 'E9X Rear Suspension', 289.99);

-- Insert Replacement
INSERT INTO Replacement ( partkind, price, supplier, repair ) VALUES
('ASUPERMALL 300mm', 70.00, 'EngineShop', 1),
('JE Piston 244871-1', 1200.00, 'AllstarAuto', 2),
('JE Piston 244871-1', 1300.00, 'AllstarAuto', 6);



