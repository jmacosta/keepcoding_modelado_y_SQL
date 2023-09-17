create schema IF NOT exists vehiculos; 

-- Create tables

CREATE table IF NOT exists vehiculos.coches (
	bastidor VARCHAR(50)  null,
	matricula VARCHAR(50) NULL,
	grupo VARCHAR(50) NULL,
	marca VARCHAR(50) NULL,
	modelo VARCHAR(50) NULL,
	fecha_compra VARCHAR(50) NULL,
	color VARCHAR(50) NULL,
	aseguradora VARCHAR(50) NULL,
	n_poliza INT4 NULL,
	fecha_alta_seguro VARCHAR(50) NULL,
	importe_revision FLOAT4 NULL,
	moneda VARCHAR(50) NULL,
	kms_revision int4 NULL,
	fecha_revision VARCHAR(50) NULL,
	kms_totales INT4 NULL
);

create table IF NOT exists vehiculos.color (
	id serial primary key, 
	color VARCHAR(30) not null
); 

create table IF NOT exists vehiculos.modelo (
	id serial primary key,
	modelo VARCHAR(50) not null
);

create table IF NOT exists vehiculos.marca (
	id serial primary key, 
	marca VARCHAR(30) not null, 
	id_grupo_empresarial SMALLINT not null
);

create table IF NOT exists vehiculos.grupoEmpresarial (
	id serial primary key, 
	grupo_empresarial VARCHAR (70) not null
);
create table IF NOT exists vehiculos.polizas(
	id serial primary key, 
	fecha_alta DATE not null,
	id_aseguradora SMALLINT not null
);

create table IF NOT exists vehiculos.aseguradora (
	id serial primary key, 
	aseguradora VARCHAR (70) not null
);
create table  IF NOT exists vehiculos.revisiones(
	id serial primary key, 
	id_bastidor VARCHAR(15) not null, 
	fecha_revision DATE not null, 
	kms INT not null, 
	importe FLOAT not null, 
	id_divisa SMALLINT not null
);

create table IF NOT exists vehiculos.moneda(
	id serial primary key,
	divisa VARCHAR(30) not null
);

create table IF NOT exists vehiculos.polizaVehiculos (
	id serial primary key, 
	id_bastidor VARCHAR(15) not null, 
	id_poliza INT not null
);

create table IF NOT exists vehiculos.vehiculos(
	bastidor VARCHAR(15) primary key,
	fecha_compra DATE not null,
	matricula VARCHAR(7) not null, 
	km_total INTEGER not null, 
	id_marca SMALLINT not null, 
	id_modelo SMALLINT not null, 
	id_color SMALLINT not null
);

-- Add constraints to tables 

alter table vehiculos.polizas add constraint pk_polizas_aseguradora foreign key(id_aseguradora) references vehiculos.aseguradora(id);
alter table vehiculos.marca add constraint pk_marca_grupo_empresarial foreign key (id_grupo_empresarial) references vehiculos.grupoEmpresarial(id);
alter table vehiculos.polizaVehiculos add constraint pk_polizaVehiculos_Poliza foreign key (id_poliza) references vehiculos.polizas(id);
alter table vehiculos.polizaVehiculos add constraint pk_polizaVehiculos_vehiculos foreign key (id_bastidor) references vehiculos.vehiculos(bastidor);
alter table vehiculos.revisiones add constraint pk_revisiones_vehiculos foreign key (id_bastidor) references vehiculos.vehiculos(bastidor);
alter table vehiculos.revisiones add constraint pk_revisiones_moneda foreign key (id_divisa) references vehiculos.moneda(id);

-- Populate data to tables

INSERT INTO vehiculos.coches (bastidor,matricula,grupo,marca,modelo,fecha_compra,color,aseguradora,n_poliza,fecha_alta_seguro,importe_revision,moneda,kms_revision,fecha_revision,kms_totales) VALUES
	 ('127656155570917','6010JXB','Hyundai Motor Group','Kia','Ceed','30/06/2017','Negro','Mapfre',117329,'05/06/2018',8854.8,'Peso Mexicano',19345,'09/07/2018',46520),
	 ('135513162918994','9024CVP','Renault-Nissan-Mitsubishi Alliance','Nissan','Qashqai','15/01/2004','Verde','Allianz',62061,'15/01/2004',2668560.5,'Peso Colombiano',13470,'18/03/2014',25161),
	 ('137138897170611','7631GCM','PSA Peugeot S.A.','Citroën','DS4','17/09/2011','Negro','Allianz',63946,'17/09/2011',830.0,'Euro',15837,'16/11/2021',31372),
	 ('139087318616921','3313GGW','PSA Peugeot S.A.','Citroën','DS4','01/04/2013','Rojo','Mapfre',85225,'01/04/2013',1884.0,'Peso Mexicano',17187,'13/12/2017',35823),
	 ('142669829381661','3230KTX','Renault-Nissan-Mitsubishi Alliance','Nissan','Qashqai','16/04/2019','Negro','Generali',146739,'16/04/2019',4898.4,'Peso Mexicano',25879,'13/05/2019',69200),
	 ('142669829381661','3230KTX','Renault-Nissan-Mitsubishi Alliance','Nissan','Qashqai','16/04/2019','Negro','Axa',127909,'18/09/2020',688.2,'Dólar',44068,'02/02/2023',69200),
	 ('157575764772588','0007HHR','Hyundai Motor Group','Kia','Rio','30/03/2014','Verde','Allianz',131987,'03/10/2015',817784.7,'Peso Colombiano',23034,'22/02/2021',37686),
	 ('160215509039860','4896HCC','Renault-Nissan-Mitsubishi Alliance','Nissan','Qashqai','19/05/2014','Negro','Generali',8576,'19/05/2014',7536.0,'Peso Mexicano',27814,'01/05/2020',45887),
	 ('172152446290159','7136BCS','PSA Peugeot S.A.','Peugeot','206','09/02/2001','Blanco','Generali',6062,'09/02/2001',595.2,'Dólar',22625,'29/10/2003',43363),
	 ('179804031897745','0390DRK','PSA Peugeot S.A.','Citroën','DS4','27/03/2007','Verde','Axa',121129,'01/05/2008',6594.0,'Peso Mexicano',22339,'01/12/2015',38651);
INSERT INTO vehiculos.coches (bastidor,matricula,grupo,marca,modelo,fecha_compra,color,aseguradora,n_poliza,fecha_alta_seguro,importe_revision,moneda,kms_revision,fecha_revision,kms_totales) VALUES
	 ('182573199324355','4221JXR','Hyundai Motor Group','Kia','Rio','19/03/2018','Azul','Generali',174298,'19/03/2018',50.0,'Euro',18380,'08/06/2018',50166),
	 ('182573199324355','4221JXR','Hyundai Motor Group','Kia','Rio','19/03/2018','Azul','Generali',109846,'11/03/2019',204.6,'Dólar',38809,'22/05/2022',50166),
	 ('185884440553577','5648JTZ','Hyundai Motor Group','Kia','Ceed','14/04/2016','Verde','Allianz',189152,'14/04/2016',16390.8,'Peso Mexicano',22988,'12/11/2017',61124),
	 ('185884440553577','5648JTZ','Hyundai Motor Group','Kia','Ceed','14/04/2016','Verde','Axa',117439,'21/11/2017',946908.6,'Peso Colombiano',47336,'20/06/2019',61124),
	 ('192871713552229','1567JPK','Hyundai Motor Group','Kia','Ceed','03/12/2016','Gris Plateado','Generali',19347,'03/12/2016',301289.1,'Peso Colombiano',28259,'12/05/2017',54278),
	 ('203304597549257','3274CYM','Renault-Nissan-Mitsubishi Alliance','Nissan','Qashqai','13/03/2004','Negro','Axa',39780,'13/03/2004',11869.2,'Peso Mexicano',17619,'15/04/2022',31210),
	 ('203304597549256','3306GYM','Renault-Nissan-Mitsubishi Alliance','Nissan','Leaf','19/12/2011','Verde','Generali',174969,'19/12/2011',1463404.2,'Peso Colombiano',18060,'17/04/2012',76024),
	 ('203304597549256','3306GYM','Renault-Nissan-Mitsubishi Alliance','Nissan','Leaf','19/12/2011','Verde','Generali',174969,'19/12/2011',16767.6,'Peso Mexicano',37513,'10/01/2013',76024),
	 ('203304597549256','3306GYM','Renault-Nissan-Mitsubishi Alliance','Nissan','Leaf','19/12/2011','Verde','Axa',173030,'18/02/2013',14883.6,'Peso Mexicano',58378,'16/06/2019',76024),
	 ('211693234075243','9157JVM','PSA Peugeot S.A.','Citroën','Berlingo','18/09/2017','Blanco','Allianz',96770,'18/09/2017',390.6,'Dólar',21421,'29/12/2020',41539);
INSERT INTO vehiculos.coches (bastidor,matricula,grupo,marca,modelo,fecha_compra,color,aseguradora,n_poliza,fecha_alta_seguro,importe_revision,moneda,kms_revision,fecha_revision,kms_totales) VALUES
	 ('217645189043628','2835JQN','Renault-Nissan-Mitsubishi Alliance','Renault','Kangoo','16/11/2016','Rojo','Allianz',144448,'16/11/2016',1695.6,'Peso Mexicano',18893,'05/05/2018',61510),
	 ('217645189043628','2835JQN','Renault-Nissan-Mitsubishi Alliance','Renault','Kangoo','16/11/2016','Rojo','Allianz',108872,'12/05/2018',669.6,'Dólar',45588,'01/08/2021',61510),
	 ('237468182644167','2890DSR','Hyundai Motor Group','Kia','Ceed','13/07/2006','Gris Plateado','Allianz',16848,'13/07/2006',213.9,'Dólar',13864,'23/07/2014',28530),
	 ('244145738554564','8217BCW','PSA Peugeot S.A.','Citroën','DS4','18/12/2001','Rojo','Mapfre',194490,'13/07/2003',620.0,'Euro',25009,'08/05/2020',43385),
	 ('260864048120648','6756GXW','PSA Peugeot S.A.','Peugeot','206','19/07/2011','Negro','Mapfre',142266,'19/07/2011',3615469.2,'Peso Colombiano',21955,'19/01/2012',112881),
	 ('260864048120648','6756GXW','PSA Peugeot S.A.','Peugeot','206','19/07/2011','Negro','Mapfre',142266,'19/07/2011',697.5,'Dólar',50738,'02/04/2012',112881),
	 ('260864048120648','6756GXW','PSA Peugeot S.A.','Peugeot','206','19/07/2011','Negro','Mapfre',142266,'19/07/2011',11869.2,'Peso Mexicano',74499,'28/06/2012',112881),
	 ('260864048120648','6756GXW','PSA Peugeot S.A.','Peugeot','206','19/07/2011','Negro','Generali',159753,'22/10/2012',3579.6,'Peso Mexicano',94670,'24/06/2013',112881),
	 ('263200500868873','0326HRM','PSA Peugeot S.A.','Peugeot','5008','28/06/2014','Gris Plateado','Axa',179156,'28/06/2014',827.7,'Dólar',20625,'30/05/2015',105374),
	 ('263200500868873','0326HRM','PSA Peugeot S.A.','Peugeot','5008','28/06/2014','Gris Plateado','Axa',179156,'28/06/2014',548.7,'Dólar',46451,'11/06/2015',105374);
INSERT INTO vehiculos.coches (bastidor,matricula,grupo,marca,modelo,fecha_compra,color,aseguradora,n_poliza,fecha_alta_seguro,importe_revision,moneda,kms_revision,fecha_revision,kms_totales) VALUES
	 ('263200500868873','0326HRM','PSA Peugeot S.A.','Peugeot','5008','28/06/2014','Gris Plateado','Axa',179156,'28/06/2014',350.0,'Euro',62529,'18/06/2015',105374),
	 ('268342458471240','9209KGR','PSA Peugeot S.A.','Peugeot','5008','02/03/2020','Rojo','Generali',174043,'02/03/2020',2637.6,'Peso Mexicano',12808,'15/08/2021',58260),
	 ('268342458471240','9209KGR','PSA Peugeot S.A.','Peugeot','5008','02/03/2020','Rojo','Axa',118686,'02/09/2021',210.0,'Euro',31259,'16/08/2023',58260),
	 ('279069308111975','4761CVL','Hyundai Motor Group','Hyundai','Tucson','08/04/2003','Rojo','Allianz',94565,'08/04/2003',2109023.8,'Peso Colombiano',21369,'16/08/2016',35224),
	 ('286006297099450','2066BYF','PSA Peugeot S.A.','Citroën','Berlingo','14/03/1999','Gris Plateado','Axa',105112,'14/03/1999',1162115.1,'Peso Colombiano',14097,'04/09/1999',57697),
	 ('286006297099450','2066BYF','PSA Peugeot S.A.','Citroën','Berlingo','14/03/1999','Gris Plateado','Generali',126373,'12/01/2000',559536.9,'Peso Colombiano',28378,'14/05/2014',57697),
	 ('289035674929410','6642GZP','Hyundai Motor Group','Hyundai','Tucson','21/04/2010','Verde','Mapfre',151249,'21/04/2010',3228097.5,'Peso Colombiano',21563,'06/01/2011',97183),
	 ('289035674929410','6642GZP','Hyundai Motor Group','Hyundai','Tucson','21/04/2010','Verde','Mapfre',151249,'21/04/2010',83.7,'Dólar',49405,'04/05/2011',97183),
	 ('289035674929410','6642GZP','Hyundai Motor Group','Hyundai','Tucson','21/04/2010','Verde','Axa',169829,'01/12/2011',1507.2,'Peso Mexicano',69454,'11/03/2023',97183),
	 ('292715765723372','2907GNT','Hyundai Motor Group','Hyundai','i30','08/11/2012','Negro','Mapfre',92532,'08/11/2012',753.3,'Dólar',25366,'09/03/2016',51508);
INSERT INTO vehiculos.coches (bastidor,matricula,grupo,marca,modelo,fecha_compra,color,aseguradora,n_poliza,fecha_alta_seguro,importe_revision,moneda,kms_revision,fecha_revision,kms_totales) VALUES
	 ('294822116472801','5188DWK','Hyundai Motor Group','Hyundai','i30','07/12/2007','Azul','Axa',161477,'07/12/2007',3572428.0,'Peso Colombiano',23426,'16/06/2008',74494),
	 ('294822116472801','5188DWK','Hyundai Motor Group','Hyundai','i30','07/12/2007','Azul','Axa',161477,'07/12/2007',670.0,'Euro',37800,'25/09/2008',74494),
	 ('294822116472801','5188DWK','Hyundai Motor Group','Hyundai','i30','07/12/2007','Azul','Generali',157749,'12/03/2009',4898.4,'Peso Mexicano',60028,'20/08/2023',74494),
	 ('296403192400494','7457BFT','Renault-Nissan-Mitsubishi Alliance','Nissan','Qashqai','24/11/2000','Negro','Mapfre',35103,'24/11/2000',90.0,'Euro',16226,'24/09/2018',39949),
	 ('297335252464241','1323DQL','Renault-Nissan-Mitsubishi Alliance','Renault','Kangoo','22/01/2006','Negro','Mapfre',172309,'22/01/2006',3012891.0,'Peso Colombiano',26924,'11/02/2006',107492),
	 ('297335252464241','1323DQL','Renault-Nissan-Mitsubishi Alliance','Renault','Kangoo','22/01/2006','Negro','Mapfre',172309,'22/01/2006',590.0,'Euro',49644,'02/12/2006',107492),
	 ('297335252464241','1323DQL','Renault-Nissan-Mitsubishi Alliance','Renault','Kangoo','22/01/2006','Negro','Mapfre',172309,'22/01/2006',3701551.8,'Peso Colombiano',62371,'03/01/2007',107492),
	 ('297335252464241','1323DQL','Renault-Nissan-Mitsubishi Alliance','Renault','Kangoo','22/01/2006','Negro','Generali',176268,'07/01/2007',3572428.0,'Peso Colombiano',90278,'23/11/2007',107492),
	 ('301841543600194','9775BVC','Hyundai Motor Group','Hyundai','i30','14/03/2001','Gris Plateado','Generali',64092,'14/03/2001',1936858.5,'Peso Colombiano',11436,'27/04/2001',29962),
	 ('302551314389863','7764GTD','Hyundai Motor Group','Hyundai','Tucson','01/10/2012','Verde','Generali',125045,'01/10/2012',510.0,'Euro',16201,'25/10/2013',54522);
INSERT INTO vehiculos.coches (bastidor,matricula,grupo,marca,modelo,fecha_compra,color,aseguradora,n_poliza,fecha_alta_seguro,importe_revision,moneda,kms_revision,fecha_revision,kms_totales) VALUES
	 ('302551314389863','7764GTD','Hyundai Motor Group','Hyundai','Tucson','01/10/2012','Verde','Allianz',136882,'28/01/2014',1162115.1,'Peso Colombiano',39865,'30/03/2015',54522),
	 ('313828373426856','2430FDP','PSA Peugeot S.A.','Citroën','Berlingo','23/06/2008','Negro','Generali',118284,'23/06/2008',530.0,'Euro',29114,'10/07/2009',91570),
	 ('313828373426856','2430FDP','PSA Peugeot S.A.','Citroën','Berlingo','23/06/2008','Negro','Generali',118284,'23/06/2008',3228097.5,'Peso Colombiano',53723,'21/08/2009',91570),
	 ('313828373426856','2430FDP','PSA Peugeot S.A.','Citroën','Berlingo','23/06/2008','Negro','Generali',137325,'14/10/2009',770.0,'Euro',66643,'06/11/2011',91570),
	 ('326510108374793','3122DZN','Renault-Nissan-Mitsubishi Alliance','Dacia','Duster','01/12/2007','Blanco','Axa',113718,'19/11/2008',16202.4,'Peso Mexicano',27367,'06/05/2022',50250),
	 ('331836513241361','7295DHG','Renault-Nissan-Mitsubishi Alliance','Nissan','Leaf','17/10/2006','Azul','Mapfre',55403,'17/10/2006',850.0,'Euro',20272,'01/06/2009',34938),
	 ('333575364076767','5899CLW','Hyundai Motor Group','Hyundai','Tucson','02/03/2003','Verde','Allianz',187586,'18/05/2004',2109023.8,'Peso Colombiano',18724,'10/09/2013',35922),
	 ('334795120675076','7938HXH','Hyundai Motor Group','Hyundai','Tucson','24/10/2015','Gris Plateado','Mapfre',163498,'24/10/2015',186.0,'Dólar',20157,'08/09/2016',53342),
	 ('334795120675076','7938HXH','Hyundai Motor Group','Hyundai','Tucson','24/10/2015','Gris Plateado','Axa',105002,'04/10/2016',590.0,'Euro',34833,'23/10/2017',53342),
	 ('341180326353581','7987FXL','Hyundai Motor Group','Kia','Rio','23/01/2009','Blanco','Generali',32844,'23/01/2009',730.0,'Euro',11140,'04/12/2021',24726);
INSERT INTO vehiculos.coches (bastidor,matricula,grupo,marca,modelo,fecha_compra,color,aseguradora,n_poliza,fecha_alta_seguro,importe_revision,moneda,kms_revision,fecha_revision,kms_totales) VALUES
	 ('351839394078116','2633GJF','PSA Peugeot S.A.','Peugeot','206','19/02/2011','Rojo','Mapfre',124027,'19/04/2012',3055932.2,'Peso Colombiano',25614,'13/07/2023',41129),
	 ('357657805291731','9281BNK','Hyundai Motor Group','Hyundai','Tucson','06/04/2002','Gris Plateado','Mapfre',88106,'06/04/2002',9043.2,'Peso Mexicano',15082,'06/10/2003',35517),
	 ('387684597384220','8718CJT','Renault-Nissan-Mitsubishi Alliance','Nissan','Qashqai','23/08/2005','Negro','Allianz',20640,'23/08/2005',460.0,'Euro',25928,'11/09/2005',46682),
	 ('409507219223974','2428HYB','Renault-Nissan-Mitsubishi Alliance','Renault','Megane','04/12/2014','Verde','Generali',181054,'04/12/2014',269.7,'Dólar',17526,'09/12/2014',87006),
	 ('409507219223974','2428HYB','Renault-Nissan-Mitsubishi Alliance','Renault','Megane','04/12/2014','Verde','Generali',181054,'04/12/2014',610.0,'Euro',40875,'05/09/2015',87006),
	 ('409507219223974','2428HYB','Renault-Nissan-Mitsubishi Alliance','Renault','Megane','04/12/2014','Verde','Generali',181054,'04/12/2014',290.0,'Euro',59896,'23/09/2015',87006),
	 ('409507219223974','2428HYB','Renault-Nissan-Mitsubishi Alliance','Renault','Megane','04/12/2014','Verde','Axa',161471,'15/10/2015',399.9,'Dólar',72001,'24/05/2016',87006),
	 ('426242703271331','0366CKQ','PSA Peugeot S.A.','Peugeot','5008','10/04/2003','Gris Plateado','Axa',172546,'10/04/2003',13941.6,'Peso Mexicano',24801,'28/04/2003',118687),
	 ('426242703271331','0366CKQ','PSA Peugeot S.A.','Peugeot','5008','10/04/2003','Gris Plateado','Axa',172546,'10/04/2003',590.0,'Euro',51615,'26/07/2003',118687),
	 ('426242703271331','0366CKQ','PSA Peugeot S.A.','Peugeot','5008','10/04/2003','Gris Plateado','Axa',172546,'10/04/2003',83.7,'Dólar',74997,'27/04/2004',118687);
INSERT INTO vehiculos.coches (bastidor,matricula,grupo,marca,modelo,fecha_compra,color,aseguradora,n_poliza,fecha_alta_seguro,importe_revision,moneda,kms_revision,fecha_revision,kms_totales) VALUES
	 ('426242703271331','0366CKQ','PSA Peugeot S.A.','Peugeot','5008','10/04/2003','Gris Plateado','Allianz',111429,'29/05/2004',548.7,'Dólar',90943,'04/06/2009',118687),
	 ('437495331058971','7221BJG','Hyundai Motor Group','Kia','Ceed','30/09/1999','Blanco','Allianz',112320,'30/09/1999',1162115.1,'Peso Colombiano',12066,'18/05/2000',70197),
	 ('437495331058971','7221BJG','Hyundai Motor Group','Kia','Ceed','30/09/1999','Blanco','Mapfre',135515,'05/04/2001',800.0,'Euro',41764,'24/05/2008',70197),
	 ('441617289859814','8706FTV','Hyundai Motor Group','Hyundai','Tucson','16/05/2008','Verde','Mapfre',91503,'16/05/2008',3658510.5,'Peso Colombiano',25843,'07/12/2011',53733),
	 ('459689708262604','4325KMF','PSA Peugeot S.A.','Citroën','DS4','13/04/2020','Blanco','Mapfre',12534,'13/04/2020',7912.8,'Peso Mexicano',20410,'08/07/2022',49476),
	 ('465574697635420','6708BTB','Renault-Nissan-Mitsubishi Alliance','Renault','Kangoo','17/07/2001','Rojo','Generali',124038,'12/12/2002',7347.6,'Peso Mexicano',27720,'18/01/2007',44027),
	 ('470251369126386','0922JVF','PSA Peugeot S.A.','Peugeot','5008','06/07/2017','Negro','Mapfre',104210,'06/07/2017',602578.2,'Peso Colombiano',25300,'25/11/2018',97321),
	 ('470251369126386','0922JVF','PSA Peugeot S.A.','Peugeot','5008','06/07/2017','Negro','Mapfre',104210,'06/07/2017',6594.0,'Peso Mexicano',49167,'06/12/2018',97321),
	 ('470251369126386','0922JVF','PSA Peugeot S.A.','Peugeot','5008','06/07/2017','Negro','Mapfre',182094,'02/01/2019',8478.0,'Peso Mexicano',76863,'08/05/2023',97321),
	 ('475528947185972','9412DTS','PSA Peugeot S.A.','Citroën','DS4','31/01/2007','Negro','Generali',82043,'31/01/2007',46.5,'Dólar',24707,'30/05/2015',54013);
INSERT INTO vehiculos.coches (bastidor,matricula,grupo,marca,modelo,fecha_compra,color,aseguradora,n_poliza,fecha_alta_seguro,importe_revision,moneda,kms_revision,fecha_revision,kms_totales) VALUES
	 ('487520996394595','9314JHS','Renault-Nissan-Mitsubishi Alliance','Nissan','Qashqai','10/10/2017','Negro','Allianz',67577,'10/10/2017',14695.2,'Peso Mexicano',24441,'04/09/2019',41064),
	 ('489261074156764','9666FZC','Renault-Nissan-Mitsubishi Alliance','Nissan','Leaf','03/03/2008','Blanco','Allianz',79841,'03/03/2008',344330.4,'Peso Colombiano',19543,'13/12/2017',39533),
	 ('491233451263824','6016FWX','Renault-Nissan-Mitsubishi Alliance','Dacia','Lodgy','29/04/2008','Gris Plateado','Mapfre',54681,'29/04/2008',817784.7,'Peso Colombiano',15657,'25/02/2014',27713),
	 ('506282682344983','8540DXG','Hyundai Motor Group','Hyundai','Tucson','13/03/2007','Gris Plateado','Axa',71232,'13/03/2007',530.1,'Dólar',15249,'12/01/2014',27722),
	 ('508388257023244','5303DCG','PSA Peugeot S.A.','Citroën','DS4','30/08/2007','Gris Plateado','Allianz',79203,'30/08/2007',11492.4,'Peso Mexicano',14181,'31/05/2022',35530),
	 ('508388257023245','5426HDG','Hyundai Motor Group','Kia','Ceed','01/04/2015','Negro','Axa',144573,'01/04/2015',437.1,'Dólar',16879,'27/09/2015',46759),
	 ('508388257023245','5426HDG','Hyundai Motor Group','Kia','Ceed','01/04/2015','Negro','Generali',186297,'24/08/2016',2883767.0,'Peso Colombiano',34964,'24/08/2019',46759),
	 ('525787287938909','4916HJG','Renault-Nissan-Mitsubishi Alliance','Nissan','Qashqai','29/03/2015','Azul','Axa',136600,'29/03/2015',100.0,'Euro',17802,'22/12/2015',64638),
	 ('525787287938909','4916HJG','Renault-Nissan-Mitsubishi Alliance','Nissan','Qashqai','29/03/2015','Azul','Axa',136600,'29/03/2015',516495.6,'Peso Colombiano',28533,'27/12/2015',64638),
	 ('525787287938909','4916HJG','Renault-Nissan-Mitsubishi Alliance','Nissan','Qashqai','29/03/2015','Azul','Allianz',163789,'31/01/2016',46.5,'Dólar',39243,'26/08/2023',64638);
INSERT INTO vehiculos.coches (bastidor,matricula,grupo,marca,modelo,fecha_compra,color,aseguradora,n_poliza,fecha_alta_seguro,importe_revision,moneda,kms_revision,fecha_revision,kms_totales) VALUES
	 ('545320401414811','8563JCM','Renault-Nissan-Mitsubishi Alliance','Nissan','Leaf','11/10/2017','Azul','Mapfre',84213,'11/10/2017',720.0,'Euro',17322,'24/05/2018',45745),
	 ('567010913009867','1970BLH','Renault-Nissan-Mitsubishi Alliance','Nissan','Leaf','18/04/2002','Rojo','Generali',102441,'27/03/2003',2238147.5,'Peso Colombiano',21660,'07/04/2010',47354),
	 ('580587164245082','3187KKM','Hyundai Motor Group','Hyundai','i30','14/01/2019','Rojo','Generali',196487,'14/01/2019',602578.2,'Peso Colombiano',20293,'20/12/2019',69946),
	 ('580587164245082','3187KKM','Hyundai Motor Group','Hyundai','i30','14/01/2019','Rojo','Generali',196487,'14/01/2019',1979899.8,'Peso Colombiano',33325,'25/01/2020',69946),
	 ('580587164245082','3187KKM','Hyundai Motor Group','Hyundai','i30','14/01/2019','Rojo','Allianz',189761,'03/08/2020',14318.4,'Peso Mexicano',43580,'15/01/2021',69946),
	 ('611467019078977','6335BFK','Renault-Nissan-Mitsubishi Alliance','Dacia','Duster','06/06/1999','Verde','Axa',190383,'06/06/1999',9985.2,'Peso Mexicano',19109,'27/09/1999',53657),
	 ('611467019078977','6335BFK','Renault-Nissan-Mitsubishi Alliance','Dacia','Duster','06/06/1999','Verde','Allianz',177717,'01/05/2000',279.0,'Dólar',34682,'14/04/2009',53657),
	 ('611890275874859','8926GPQ','Renault-Nissan-Mitsubishi Alliance','Dacia','Duster','29/09/2012','Blanco','Allianz',26976,'29/09/2012',330.0,'Euro',25569,'01/11/2016',42989),
	 ('626609065217599','5865JKB','Hyundai Motor Group','Hyundai','Tucson','24/01/2016','Azul','Axa',86600,'24/01/2016',620.0,'Euro',11276,'17/07/2016',30495),
	 ('628697270753288','3960JYB','Renault-Nissan-Mitsubishi Alliance','Renault','Kangoo','15/09/2017','Negro','Mapfre',8307,'15/09/2017',158.1,'Dólar',17211,'22/08/2018',30810);
INSERT INTO vehiculos.coches (bastidor,matricula,grupo,marca,modelo,fecha_compra,color,aseguradora,n_poliza,fecha_alta_seguro,importe_revision,moneda,kms_revision,fecha_revision,kms_totales) VALUES
	 ('629560130830276','6640FPQ','PSA Peugeot S.A.','Peugeot','5008','12/02/2008','Azul','Axa',85627,'12/02/2008',350.0,'Euro',14565,'14/10/2022',38454),
	 ('645094841837828','7466DMG','Renault-Nissan-Mitsubishi Alliance','Renault','Clio','31/03/2007','Gris Plateado','Allianz',145462,'31/03/2007',200.0,'Euro',19536,'16/06/2007',85722),
	 ('645094841837828','7466DMG','Renault-Nissan-Mitsubishi Alliance','Renault','Clio','31/03/2007','Gris Plateado','Allianz',145462,'31/03/2007',325.5,'Dólar',39863,'26/09/2007',85722),
	 ('645094841837828','7466DMG','Renault-Nissan-Mitsubishi Alliance','Renault','Clio','31/03/2007','Gris Plateado','Allianz',190418,'10/05/2008',270.0,'Euro',56109,'08/10/2018',85722),
	 ('646797834816508','7710HMZ','PSA Peugeot S.A.','Peugeot','206','09/04/2014','Verde','Allianz',190446,'03/09/2015',3391.2,'Peso Mexicano',22300,'28/08/2022',45773),
	 ('669426743602101','4315JKL','Renault-Nissan-Mitsubishi Alliance','Dacia','Duster','27/08/2017','Gris Plateado','Mapfre',9482,'27/08/2017',15825.6,'Peso Mexicano',20263,'02/11/2017',46145),
	 ('671616235280097','5022JZD','Hyundai Motor Group','Hyundai','i30','07/03/2016','Verde','Mapfre',173686,'07/03/2016',430413.0,'Peso Colombiano',11715,'13/05/2016',63426),
	 ('671616235280097','5022JZD','Hyundai Motor Group','Hyundai','i30','07/03/2016','Verde','Axa',191842,'09/08/2017',539.4,'Dólar',35020,'19/04/2021',63426),
	 ('676769636753148','7561CND','Hyundai Motor Group','Hyundai','i30','22/09/2004','Blanco','Mapfre',170914,'22/09/2004',12622.8,'Peso Mexicano',13171,'18/01/2006',71901),
	 ('676769636753148','7561CND','Hyundai Motor Group','Hyundai','i30','22/09/2004','Blanco','Mapfre',170914,'22/09/2004',2926808.5,'Peso Colombiano',29474,'27/02/2006',71901);
INSERT INTO vehiculos.coches (bastidor,matricula,grupo,marca,modelo,fecha_compra,color,aseguradora,n_poliza,fecha_alta_seguro,importe_revision,moneda,kms_revision,fecha_revision,kms_totales) VALUES
	 ('676769636753148','7561CND','Hyundai Motor Group','Hyundai','i30','22/09/2004','Blanco','Mapfre',172754,'23/03/2006',74.4,'Dólar',42110,'19/04/2021',71901),
	 ('689052288794293','0326HRM','PSA Peugeot S.A.','Peugeot','5008','28/06/2014','Gris Plateado','Generali',187973,'19/06/2015',241.8,'Dólar',90819,'25/08/2016',105374),
	 ('697616134995239','3242GQG','Renault-Nissan-Mitsubishi Alliance','Renault','Megane','06/03/2013','Rojo','Mapfre',183813,'06/03/2013',120.9,'Dólar',16209,'10/02/2014',77662),
	 ('697616134995239','3242GQG','Renault-Nissan-Mitsubishi Alliance','Renault','Megane','06/03/2013','Rojo','Mapfre',183813,'06/03/2013',80.0,'Euro',27845,'27/04/2014',77662),
	 ('697616134995239','3242GQG','Renault-Nissan-Mitsubishi Alliance','Renault','Megane','06/03/2013','Rojo','Mapfre',183813,'06/03/2013',1695.6,'Peso Mexicano',38072,'07/06/2014',77662),
	 ('697616134995239','3242GQG','Renault-Nissan-Mitsubishi Alliance','Renault','Megane','06/03/2013','Rojo','Generali',187526,'14/07/2014',16767.6,'Peso Mexicano',49153,'30/11/2021',77662),
	 ('698751337272122','2684FZV','PSA Peugeot S.A.','Citroën','DS4','10/05/2008','Negro','Mapfre',50387,'10/05/2008',455.7,'Dólar',17713,'07/06/2008',36859),
	 ('710739793513256','6850KZW','Hyundai Motor Group','Kia','Ceed','11/05/2020','Blanco','Mapfre',66942,'11/05/2020',10173.6,'Peso Mexicano',15206,'05/03/2023',25227),
	 ('711293850341545','6532KNR','Hyundai Motor Group','Hyundai','i30','24/03/2019','Azul','Generali',45918,'24/03/2019',13753.2,'Peso Mexicano',19344,'26/03/2022',35831),
	 ('737689089927031','4366GZX','Hyundai Motor Group','Hyundai','Tucson','03/11/2013','Verde','Axa',40977,'03/11/2013',306.9,'Dólar',21132,'27/08/2017',44510);
INSERT into vehiculos.coches (bastidor,matricula,grupo,marca,modelo,fecha_compra,color,aseguradora,n_poliza,fecha_alta_seguro,importe_revision,moneda,kms_revision,fecha_revision,kms_totales) VALUES
	 ('740933683141985','2874BRD','Hyundai Motor Group','Hyundai','i30','01/10/2000','Azul','Mapfre',115392,'17/01/2002',232.5,'Dólar',27678,'22/12/2021',46794),
	 ('743107550281843','6788DRX','Hyundai Motor Group','Hyundai','i30','15/11/2007','Blanco','Axa',7094,'15/11/2007',840.0,'Euro',15306,'29/12/2015',36066),
	 ('744503631522026','5751FCL','Hyundai Motor Group','Kia','Ceed','30/07/2008','Rojo','Allianz',4341,'30/07/2008',446.4,'Dólar',16314,'06/08/2010',40662),
	 ('752292188990214','4389KSN','PSA Peugeot S.A.','Peugeot','206','14/02/2019','Rojo','Axa',112290,'21/09/2020',559536.9,'Peso Colombiano',19885,'06/12/2021',30862),
	 ('778916464197334','7343FRT','Renault-Nissan-Mitsubishi Alliance','Renault','Clio','01/06/2009','Rojo','Allianz',25786,'01/06/2009',1076032.5,'Peso Colombiano',29564,'07/07/2020',47644),
	 ('784329052745872','8802GQX','Renault-Nissan-Mitsubishi Alliance','Dacia','Duster','23/04/2013','Blanco','Generali',167291,'02/05/2014',820.0,'Euro',22523,'15/06/2015',34941),
	 ('808160164855373','9428BCQ','Hyundai Motor Group','Kia','Ceed','12/11/2002','Verde','Allianz',96367,'12/11/2002',16956.0,'Peso Mexicano',14720,'03/05/2022',33451),
	 ('848794382968571','8177JPM','Renault-Nissan-Mitsubishi Alliance','Renault','Clio','27/11/2016','Gris Plateado','Allianz',119373,'27/11/2016',1678610.8,'Peso Colombiano',19822,'24/01/2017',77082),
	 ('848794382968571','8177JPM','Renault-Nissan-Mitsubishi Alliance','Renault','Clio','27/11/2016','Gris Plateado','Allianz',119373,'27/11/2016',483.6,'Dólar',41924,'25/11/2017',77082),
	 ('848794382968571','8177JPM','Renault-Nissan-Mitsubishi Alliance','Renault','Clio','27/11/2016','Gris Plateado','Mapfre',192389,'19/04/2018',387371.7,'Peso Colombiano',57202,'04/05/2021',77082);
INSERT INTO vehiculos.coches (bastidor,matricula,grupo,marca,modelo,fecha_compra,color,aseguradora,n_poliza,fecha_alta_seguro,importe_revision,moneda,kms_revision,fecha_revision,kms_totales) VALUES
	 ('857550444038753','2438GSV','PSA Peugeot S.A.','Citroën','DS4','17/04/2010','Gris Plateado','Allianz',195443,'17/04/2010',734.7,'Dólar',12028,'13/05/2010',52349),
	 ('857550444038753','2438GSV','PSA Peugeot S.A.','Citroën','DS4','17/04/2010','Gris Plateado','Axa',110761,'23/08/2011',460.0,'Euro',28312,'17/05/2016',52349),
	 ('872717009918303','6743DYG','Hyundai Motor Group','Kia','Rio','25/06/2007','Gris Plateado','Axa',116336,'25/06/2007',8101.2,'Peso Mexicano',22761,'13/01/2008',76387),
	 ('872717009918303','6743DYG','Hyundai Motor Group','Kia','Rio','25/06/2007','Gris Plateado','Axa',116336,'25/06/2007',9608.4,'Peso Mexicano',34009,'17/03/2008',76387),
	 ('872717009918303','6743DYG','Hyundai Motor Group','Kia','Rio','25/06/2007','Gris Plateado','Mapfre',116398,'16/09/2008',450.0,'Euro',60377,'14/11/2012',76387),
	 ('880327608577422','3883DSH','Renault-Nissan-Mitsubishi Alliance','Renault','Clio','27/02/2007','Blanco','Mapfre',54632,'27/02/2007',570.0,'Euro',19245,'16/05/2014',35949),
	 ('901812917000663','5572DHP','Hyundai Motor Group','Kia','Rio','06/06/2007','Blanco','Axa',75790,'06/06/2007',186.0,'Dólar',22437,'29/05/2014',42143),
	 ('902821105071721','7224FDF','PSA Peugeot S.A.','Peugeot','5008','29/04/2008','Negro','Mapfre',48113,'29/04/2008',3228097.5,'Peso Colombiano',16890,'20/11/2008',28796),
	 ('908394313894087','8627FRY','Hyundai Motor Group','Hyundai','Tucson','02/04/2008','Blanco','Mapfre',51353,'02/04/2008',120.9,'Dólar',16181,'28/04/2020',30083),
	 ('916723352247848','9729KXJ','Renault-Nissan-Mitsubishi Alliance','Renault','Megane','06/09/2020','Verde','Allianz',184039,'06/09/2020',110.0,'Euro',14348,'11/10/2020',76972);
INSERT INTO vehiculos.coches (bastidor,matricula,grupo,marca,modelo,fecha_compra,color,aseguradora,n_poliza,fecha_alta_seguro,importe_revision,moneda,kms_revision,fecha_revision,kms_totales) VALUES
	 ('916723352247848','9729KXJ','Renault-Nissan-Mitsubishi Alliance','Renault','Megane','06/09/2020','Verde','Allianz',184039,'06/09/2020',632.4,'Dólar',36512,'13/09/2021',76972),
	 ('916723352247848','9729KXJ','Renault-Nissan-Mitsubishi Alliance','Renault','Megane','06/09/2020','Verde','Generali',131978,'21/12/2021',3873717.0,'Peso Colombiano',52881,'12/04/2022',76972),
	 ('920124785566639','3212HJW','Hyundai Motor Group','Kia','Rio','04/08/2014','Gris Plateado','Axa',117277,'19/12/2015',170.0,'Euro',14526,'14/04/2023',28986),
	 ('931452989095287','0393DWY','PSA Peugeot S.A.','Peugeot','5008','02/08/2007','Rojo','Allianz',73097,'02/08/2007',50.0,'Euro',22765,'03/02/2020',41340),
	 ('935099880725165','7792CKF','Hyundai Motor Group','Hyundai','Tucson','02/03/2003','Verde','Allianz',139949,'02/03/2003',560.0,'Euro',16746,'06/05/2003',59984),
	 ('935099880725165','7792CKF','Hyundai Motor Group','Hyundai','Tucson','02/03/2003','Verde','Mapfre',126578,'30/01/2004',3830675.8,'Peso Colombiano',37787,'25/05/2009',59984),
	 ('938226921885995','3272JJJ','Hyundai Motor Group','Kia','Rio','03/06/2018','Verde','Mapfre',89739,'03/06/2018',210.0,'Euro',11209,'04/10/2022',27503),
	 ('938887622485131','1621CSY','PSA Peugeot S.A.','Citroën','DS4','12/10/2004','Rojo','Mapfre',89394,'12/10/2004',4898.4,'Peso Mexicano',29407,'18/08/2022',42218),
	 ('949328518520355','5205DFJ','Hyundai Motor Group','Kia','Ceed','04/03/2006','Gris Plateado','Allianz',41930,'04/03/2006',14883.6,'Peso Mexicano',23043,'24/05/2022',50972),
	 ('957483783980297','7905HMT','Hyundai Motor Group','Hyundai','i30','31/10/2015','Azul','Axa',56264,'31/10/2015',590.0,'Euro',11937,'14/07/2020',38622);
INSERT INTO vehiculos.coches (bastidor,matricula,grupo,marca,modelo,fecha_compra,color,aseguradora,n_poliza,fecha_alta_seguro,importe_revision,moneda,kms_revision,fecha_revision,kms_totales) VALUES
	 ('958534292054743','6231KKQ','Renault-Nissan-Mitsubishi Alliance','Dacia','Duster','10/04/2019','Rojo','Allianz',34218,'10/04/2019',632.4,'Dólar',13755,'04/04/2021',39563),
	 ('976721733680448','5851CSB','Hyundai Motor Group','Hyundai','i30','21/06/2004','Gris Plateado','Generali',73547,'21/06/2004',780.0,'Euro',20756,'09/03/2011',39717),
	 ('982410688092457','5047FJK','PSA Peugeot S.A.','Citroën','DS4','26/10/2009','Blanco','Mapfre',172625,'26/10/2009',5086.8,'Peso Mexicano',18053,'22/02/2010',90641),
	 ('982410688092457','5047FJK','PSA Peugeot S.A.','Citroën','DS4','26/10/2009','Blanco','Mapfre',172625,'26/10/2009',399.9,'Dólar',40390,'03/05/2010',90641),
	 ('982410688092457','5047FJK','PSA Peugeot S.A.','Citroën','DS4','26/10/2009','Blanco','Mapfre',161701,'16/10/2010',2324230.2,'Peso Colombiano',63099,'08/12/2010',90641),
	 ('986573953424534','5954DWX','Renault-Nissan-Mitsubishi Alliance','Nissan','Qashqai','25/10/2007','Negro','Allianz',121919,'21/08/2008',440.0,'Euro',25110,'30/05/2016',39775),
	 ('991711022888482','7489HBJ','Renault-Nissan-Mitsubishi Alliance','Renault','Kangoo','11/10/2014','Rojo','Axa',82585,'11/10/2014',316.2,'Dólar',22207,'02/08/2019',37783),
	 ('994761774032793','0827DBB','Renault-Nissan-Mitsubishi Alliance','Renault','Megane','24/07/2006','Gris Plateado','Generali',40647,'24/07/2006',325.5,'Dólar',24407,'23/02/2019',39061);


insert into vehiculos.aseguradora  (aseguradora)
	select aseguradora from vehiculos.coches c  
	group by aseguradora; 

insert into vehiculos.polizas (id, fecha_alta, id_aseguradora)	
	select c.n_poliza , TO_DATE(fecha_alta_seguro, 'DD/MM/YYYY')  , a.id
	from vehiculos.coches c
	inner join vehiculos.aseguradora a on c.aseguradora = a.aseguradora
	group by c.n_poliza, c.fecha_alta_seguro, a.id;

insert into vehiculos.moneda (divisa)
	select moneda from vehiculos.coches c
	group by moneda; 

insert into vehiculos.color (color)
	select color from vehiculos.coches v  
	group by color;
insert into vehiculos.modelo  (modelo)
	select modelo from vehiculos.coches v  
	group by modelo;

insert into vehiculos.grupoempresarial  (grupo_empresarial)
	select grupo from vehiculos.coches v  
	group by grupo;

insert into vehiculos.marca (marca, id_grupo_empresarial)
	select marca, g.id  from vehiculos.coches c 
	inner join vehiculos.grupoempresarial g on c.grupo = g.grupo_empresarial 
	group by c.marca, g.id;

insert into vehiculos.vehiculos (bastidor, matricula, fecha_compra, km_total, id_marca, id_modelo, id_color)	
	select 
		c.bastidor, c.matricula, TO_DATE(c.fecha_compra, 'DD/MM/YYYY') as fecha_compra , c.kms_totales, m.id as id_marca, m2.id as id_modelo , c2.id as id_color  
	from vehiculos.coches c 	 
	inner join vehiculos.marca m on c.marca = m.marca 
	inner join vehiculos.modelo m2 on c.modelo = m2.modelo 
	inner join vehiculos.color c2 on c.color = c2.color
	group by c.bastidor, c.matricula, c.fecha_compra, c.kms_totales, m.id, m2.id, c2.id;
	

insert into vehiculos.polizavehiculos (id_bastidor, id_poliza)	
	select c.bastidor, p.id from vehiculos.coches c 
	inner join vehiculos.vehiculos v on c.bastidor = v.bastidor 
	inner join vehiculos.polizas p on c.n_poliza = p.id;

insert into vehiculos.revisiones (id_bastidor, fecha_revision, kms, importe, id_divisa)	
	select bastidor, TO_DATE(c.fecha_revision, 'DD/MM/YYYY' ) as fecha_revision, kms_revision, importe_revision, m.id as id_divisa from vehiculos.coches c 
	inner join vehiculos.moneda m on m.divisa = c.moneda; 

-- Query of the practice


 select distinct on (v.matricula) v.matricula , m2.modelo, c.color,  m.marca, g.grupo_empresarial, v.fecha_compra, v.km_total, a.aseguradora, max(p.id_poliza) as numero_poliza
	from vehiculos.vehiculos v  
	inner join vehiculos.color c on v.id_color = c.id 
	inner join vehiculos.marca m on v.id_marca = m.id
	inner join vehiculos.grupoempresarial g on m.id_grupo_empresarial = g.id 
	inner join vehiculos.modelo m2 on v.id_modelo = m2.id 
	inner join vehiculos.polizavehiculos p on v.bastidor = p.id_bastidor 	 
	inner join vehiculos.polizas p2 on p.id_poliza = p2.id 
	inner join vehiculos.aseguradora a on p2.id_aseguradora = a.id
	group by v.matricula, m2.modelo, c.color,  m.marca, g.grupo_empresarial, v.fecha_compra, v.km_total, a.aseguradora, p.id_poliza
	order by v.matricula asc ;