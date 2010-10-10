


DROP TABLE IF EXISTS `admins`;

CREATE TABLE `admins` (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `full_name` varchar(255) default NULL,
  `address` varchar(255) default NULL,
  `city` varchar(255) default NULL,
  `country` varchar(255) default NULL,
  `role` varchar(255) default NULL,
  `crypted_password` varchar(40) default NULL,
  `salt` varchar(40) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `remember_token` varchar(255) default NULL,
  `remember_token_expires_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `admins` */

LOCK TABLES `admins` WRITE;

insert into `admins` (`id`,`login`,`email`,`full_name`,`address`,`city`,`country`,`role`,`crypted_password`,`salt`,`created_at`,`updated_at`,`remember_token`,`remember_token_expires_at`) values (1,'minkhati','min@wserve.com','Min Khati','ktm','kathmandu','Nepal','SUPER','d2b768afbe7b69ecebe23405e70f66e3b06e23a3','bed72daa485476517528a08125d67fe43d658480','2008-12-26 15:28:47','2009-01-02 18:02:27',NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `billing_details` */

DROP TABLE IF EXISTS `billing_details`;

CREATE TABLE `billing_details` (
  `id` int(11) NOT NULL auto_increment,
  `billing_entry_id` int(11) default NULL,
  `item_name` varchar(255) default NULL,
  `quantity` int(11) default NULL,
  `rate` double default NULL,
  `total_amount` double default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `billing_details` */

LOCK TABLES `billing_details` WRITE;

insert into `billing_details` (`id`,`billing_entry_id`,`item_name`,`quantity`,`rate`,`total_amount`,`created_at`,`updated_at`) values (1,1,'BCG',1,50,50,'2009-01-03 10:18:04','2009-01-03 10:18:04'),(2,1,'DPT',1,50,50,'2009-01-03 10:18:04','2009-01-03 10:18:04'),(3,2,'BCG',1,50,50,'2009-01-03 16:43:23','2009-01-03 16:43:23'),(4,2,'Citamol',1,20,20,'2009-01-03 16:43:23','2009-01-03 16:43:23'),(5,3,'BCG',1,50,50,'2009-01-04 16:46:07','2009-01-03 16:46:07'),(6,3,'Citamol',2,20,40,'2009-01-04 16:46:07','2009-01-03 16:46:07'),(7,4,'Citamol',1,20,20,'2009-01-05 15:31:09','2009-01-05 15:31:09'),(8,5,'DPT',1,50,50,'2009-01-06 16:07:38','2009-01-06 16:07:38'),(9,6,'BCG',1,50,50,'2009-01-06 16:09:10','2009-01-06 16:09:10'),(10,7,'BCG',50,50,2500,'2009-01-08 12:51:46','2009-01-08 12:51:46'),(11,7,'Citamol',10,20,200,'2009-01-08 12:51:46','2009-01-08 12:51:46'),(12,8,'BCG',20,50,1000,'2009-01-08 12:53:53','2009-01-08 12:53:53'),(13,8,'Citamol',20,20,400,'2009-01-08 12:53:53','2009-01-08 12:53:53'),(14,9,'BCG',1,50,50,'2009-01-08 12:59:07','2009-01-08 12:59:07'),(15,9,'DPT',6,50,300,'2009-01-08 12:59:07','2009-01-08 12:59:07'),(16,9,'Citamol',1,20,20,'2009-01-08 12:59:07','2009-01-08 12:59:07'),(17,10,'DPT',5,50,250,'2009-01-08 13:00:22','2009-01-08 13:00:22'),(18,10,'Citamol',3,20,60,'2009-01-08 13:00:22','2009-01-08 13:00:22'),(19,11,'BCG',2,50,100,'2009-01-08 13:12:39','2009-01-08 13:12:39'),(20,11,'DPT',3,50,150,'2009-01-08 13:12:39','2009-01-08 13:12:39'),(21,11,'Citamol',4,20,80,'2009-01-08 13:12:39','2009-01-08 13:12:39'),(23,13,'BCG',10,50,500,'2009-01-08 16:08:20','2009-01-08 16:08:20'),(24,13,'BCG',5,50,250,'2009-01-08 16:08:20','2009-01-08 16:08:20'),(25,14,'BCG',20,50,1000,'2009-01-08 16:09:05','2009-01-08 16:09:05'),(26,15,'BCG',15,50,750,'2009-01-08 16:14:03','2009-01-08 16:14:03'),(27,16,'DPT',20,50,1000,'2009-01-08 16:15:03','2009-01-08 16:15:03');

UNLOCK TABLES;

/*Table structure for table `billing_entries` */

DROP TABLE IF EXISTS `billing_entries`;

CREATE TABLE `billing_entries` (
  `admin_id` int(11) default NULL,
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `comment` text,
  `discount` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `billing_entries` */

LOCK TABLES `billing_entries` WRITE;

insert into `billing_entries` (`admin_id`,`id`,`user_id`,`comment`,`discount`,`created_at`,`updated_at`) values (1,1,1,'gfhg',10,'2009-01-03 10:18:04','2009-01-03 10:18:04'),(1,2,1,'by doc',5,'2009-01-03 16:43:23','2009-01-03 16:43:23'),(1,3,4,'by doc',15,'2009-01-04 16:46:07','2009-01-03 16:46:07'),(1,4,1,'',0,'2009-02-05 15:31:09','2009-01-05 15:31:09'),(1,5,1,'sdfad',10,'2009-01-06 16:07:38','2009-01-06 16:07:38'),(1,6,1,'sdfd',10,'2009-01-06 16:09:10','2009-01-06 16:09:10'),(1,7,1,'',0,'2009-01-08 12:51:46','2009-01-08 12:51:46'),(1,8,1,'',0,'2009-01-08 12:53:53','2009-01-08 12:53:53'),(1,9,1,'',0,'2009-01-08 12:59:07','2009-01-08 12:59:07'),(1,10,2,'',0,'2009-01-08 13:00:21','2009-01-08 13:00:21'),(1,11,2,'',5,'2009-01-08 13:12:39','2009-01-08 13:12:39'),(1,13,5,'',0,'2009-01-08 16:08:20','2009-01-08 16:08:20'),(1,14,5,'',0,'2009-01-08 16:09:05','2009-01-08 16:09:05'),(1,15,5,'',0,'2009-01-08 16:14:03','2009-01-08 16:14:03'),(1,16,1,'',0,'2009-01-08 16:15:03','2009-01-08 16:15:03');

UNLOCK TABLES;

/*Table structure for table `countries` */

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `id` int(11) NOT NULL auto_increment,
  `country_code` varchar(255) default NULL,
  `country_name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `countries` */

LOCK TABLES `countries` WRITE;

insert into `countries` (`id`,`country_code`,`country_name`) values (1,'AF','Afghanistan'),(2,'AL','Albania'),(3,'DZ','Algeria'),(4,'AS','American Samoa'),(5,'AD','Andorra'),(6,'AO','Angola'),(7,'AI','Anguilla'),(8,'AQ','Antarctica'),(9,'AG','Antigua and Barbuda'),(10,'AR','Argentina'),(11,'AM','Armenia'),(12,'AW','Aruba'),(13,'AU','Australia'),(14,'AT','Austria'),(15,'AZ','Azerbaijan'),(16,'AP','Azores'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BA','Bosnia And Herzegowina'),(29,'XB','Bosnia-Herzegovina'),(30,'BW','Botswana'),(31,'BV','Bouvet Island'),(32,'BR','Brazil'),(33,'IO','British Indian Ocean Territory'),(34,'VG','British Virgin Islands'),(35,'BN','Brunei Darussalam'),(36,'BG','Bulgaria'),(37,'BF','Burkina Faso'),(38,'BI','Burundi'),(39,'KH','Cambodia'),(40,'CM','Cameroon'),(41,'CA','Canada'),(42,'CV','Cape Verde'),(43,'KY','Cayman Islands'),(44,'CF','Central African Republic'),(45,'TD','Chad'),(46,'CL','Chile'),(47,'CN','China'),(48,'CX','Christmas Island'),(49,'CC','Cocos (Keeling) Islands'),(50,'CO','Colombia'),(51,'KM','Comoros'),(52,'CG','Congo'),(53,'CD','Congo, The Democratic Republic Of'),(54,'CK','Cook Islands'),(55,'XE','Corsica'),(56,'CR','Costa Rica'),(57,'CI','Cote d` Ivoire (Ivory Coast)'),(58,'HR','Croatia'),(59,'CU','Cuba'),(60,'CY','Cyprus'),(61,'CZ','Czech Republic'),(62,'DK','Denmark'),(63,'DJ','Djibouti'),(64,'DM','Dominica'),(65,'DO','Dominican Republic'),(66,'TP','East Timor'),(67,'EC','Ecuador'),(68,'EG','Egypt'),(69,'SV','El Salvador'),(70,'GQ','Equatorial Guinea'),(71,'ER','Eritrea'),(72,'EE','Estonia'),(73,'ET','Ethiopia'),(74,'FK','Falkland Islands (Malvinas)'),(75,'FO','Faroe Islands'),(76,'FJ','Fiji'),(77,'FI','Finland'),(78,'FR','France (Includes Monaco)'),(79,'FX','France, Metropolitan'),(80,'GF','French Guiana'),(81,'PF','French Polynesia'),(82,'TA','French Polynesia (Tahiti)'),(83,'TF','French Southern Territories'),(84,'GA','Gabon'),(85,'GM','Gambia'),(86,'GE','Georgia'),(87,'DE','Germany'),(88,'GH','Ghana'),(89,'GI','Gibraltar'),(90,'GR','Greece'),(91,'GL','Greenland'),(92,'GD','Grenada'),(93,'GP','Guadeloupe'),(94,'GU','Guam'),(95,'GT','Guatemala'),(96,'GN','Guinea'),(97,'GW','Guinea-Bissau'),(98,'GY','Guyana'),(99,'HT','Haiti'),(100,'HM','Heard And Mc Donald Islands'),(101,'VA','Holy See (Vatican City State)'),(102,'HN','Honduras'),(103,'HK','Hong Kong'),(104,'HU','Hungary'),(105,'IS','Iceland'),(106,'IN','India'),(107,'ID','Indonesia'),(108,'IR','Iran'),(109,'IQ','Iraq'),(110,'IE','Ireland'),(111,'EI','Ireland (Eire)'),(112,'IL','Israel'),(113,'IT','Italy'),(114,'JM','Jamaica'),(115,'JP','Japan'),(116,'JO','Jordan'),(117,'KZ','Kazakhstan'),(118,'KE','Kenya'),(119,'KI','Kiribati'),(120,'KP','Korea, Democratic People\'S Republic Of'),(121,'KW','Kuwait'),(122,'KG','Kyrgyzstan'),(123,'LA','Laos'),(124,'LV','Latvia'),(125,'LB','Lebanon'),(126,'LS','Lesotho'),(127,'LR','Liberia'),(128,'LY','Libya'),(129,'LI','Liechtenstein'),(130,'LT','Lithuania'),(131,'LU','Luxembourg'),(132,'MO','Macao'),(133,'MK','Macedonia'),(134,'MG','Madagascar'),(135,'ME','Madeira Islands'),(136,'MW','Malawi'),(137,'MY','Malaysia'),(138,'MV','Maldives'),(139,'ML','Mali'),(140,'MT','Malta'),(141,'MH','Marshall Islands'),(142,'MQ','Martinique'),(143,'MR','Mauritania'),(144,'MU','Mauritius'),(145,'YT','Mayotte'),(146,'MX','Mexico'),(147,'FM','Micronesia, Federated States Of'),(148,'MD','Moldova, Republic Of'),(149,'MC','Monaco'),(150,'MN','Mongolia'),(151,'MS','Montserrat'),(152,'MA','Morocco'),(153,'MZ','Mozambique'),(154,'MM','Myanmar (Burma)'),(155,'NA','Namibia'),(156,'NR','Nauru'),(157,'NP','Nepal'),(158,'NL','Netherlands'),(159,'AN','Netherlands Antilles'),(160,'NC','New Caledonia'),(161,'NZ','New Zealand'),(162,'NI','Nicaragua'),(163,'NE','Niger'),(164,'NG','Nigeria'),(165,'NU','Niue'),(166,'NF','Norfolk Island'),(167,'MP','Northern Mariana Islands'),(168,'NO','Norway'),(169,'OM','Oman'),(170,'PK','Pakistan'),(171,'PW','Palau'),(172,'PS','Palestinian Territory, Occupied'),(173,'PA','Panama'),(174,'PG','Papua New Guinea'),(175,'PY','Paraguay'),(176,'PE','Peru'),(177,'PH','Philippines'),(178,'PN','Pitcairn'),(179,'PL','Poland'),(180,'PT','Portugal'),(181,'PR','Puerto Rico'),(182,'QA','Qatar'),(183,'RE','Reunion'),(184,'RO','Romania'),(185,'RU','Russian Federation'),(186,'RW','Rwanda'),(187,'KN','Saint Kitts And Nevis'),(188,'SM','San Marino'),(189,'ST','Sao Tome and Principe'),(190,'SA','Saudi Arabia'),(191,'SN','Senegal'),(192,'XS','Serbia-Montenegro'),(193,'SC','Seychelles'),(194,'SL','Sierra Leone'),(195,'SG','Singapore'),(196,'SK','Slovak Republic'),(197,'SI','Slovenia'),(198,'SB','Solomon Islands'),(199,'SO','Somalia'),(200,'ZA','South Africa'),(201,'GS','South Georgia And The South Sand'),(202,'KR','South Korea'),(203,'ES','Spain'),(204,'LK','Sri Lanka'),(205,'NV','St. Christopher and Nevis'),(206,'SH','St. Helena'),(207,'LC','St. Lucia'),(208,'PM','St. Pierre and Miquelon'),(209,'VC','St. Vincent and the Grenadines'),(210,'SD','Sudan'),(211,'SR','Suriname'),(212,'SJ','Svalbard And Jan Mayen Islands'),(213,'SZ','Swaziland'),(214,'SE','Sweden'),(215,'CH','Switzerland'),(216,'SY','Syrian Arab Republic'),(217,'TW','Taiwan'),(218,'TJ','Tajikistan'),(219,'TZ','Tanzania'),(220,'TH','Thailand'),(221,'TG','Togo'),(222,'TK','Tokelau'),(223,'TO','Tonga'),(224,'TT','Trinidad and Tobago'),(225,'XU','Tristan da Cunha'),(226,'TN','Tunisia'),(227,'TR','Turkey'),(228,'TM','Turkmenistan'),(229,'TC','Turks and Caicos Islands'),(230,'TV','Tuvalu'),(231,'UG','Uganda'),(232,'UA','Ukraine'),(233,'AE','United Arab Emirates'),(234,'UK','United Kingdom'),(235,'GB','Great Britain'),(236,'US','United States'),(237,'UM','United States Minor Outlying Islands'),(238,'UY','Uruguay'),(239,'UZ','Uzbekistan'),(240,'VU','Vanuatu'),(241,'XV','Vatican City'),(242,'VE','Venezuela'),(243,'VN','Vietnam'),(244,'VI','Virgin Islands (U.S.)'),(245,'WF','Wallis and Furuna Islands'),(246,'EH','Western Sahara'),(247,'WS','Western Samoa'),(248,'YE','Yemen'),(249,'YU','Yugoslavia'),(250,'ZR','Zaire'),(251,'ZM','Zambia'),(252,'ZW','Zimbabwe');

UNLOCK TABLES;

/*Table structure for table `members` */

DROP TABLE IF EXISTS `members`;

CREATE TABLE `members` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `father_full_name` varchar(255) default NULL,
  `mother_full_name` varchar(255) default NULL,
  `address` varchar(255) default NULL,
  `city` varchar(255) default NULL,
  `state` varchar(255) default NULL,
  `country` varchar(255) default NULL,
  `cell_phone` varchar(255) default NULL,
  `home_phone` varchar(255) default NULL,
  `office_phone` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `members` */

LOCK TABLES `members` WRITE;

insert into `members` (`id`,`user_id`,`father_full_name`,`mother_full_name`,`address`,`city`,`state`,`country`,`cell_phone`,`home_phone`,`office_phone`,`created_at`,`updated_at`) values (1,1,'father of baby shishu','mother','kathmadu','jhdsj','dsfjagkl','kathmandu','41524646664644','644646646646','646466646664','2008-12-26 15:31:06','2008-12-29 18:11:53'),(2,2,'bisusubedi','bisusubedi','bisusubedi','bisusubedi','bisusubedi','bisusubedi','46546655456456','4646645665665','6465646466464','2008-12-26 18:01:10','2008-12-27 16:34:12'),(3,3,'dsfjksdhakjlf','jhgjh','jkglg','jkhjkhjk','jkhkjhkj','jk','4545445455454','54545454555','54544545554','2008-12-27 12:57:42','2008-12-27 12:57:42'),(4,4,'bishnu pd pandey','sunita pandey','kathmandu','kathmandu','kathmandu','Nepal','980341245','4545654545','5455555545','2008-12-27 16:40:31','2008-12-27 16:40:31'),(5,5,'fdsf','sdfdsf','dsfdsf','sdfsdfsdf','dsfdsfsf','dsfsdf','1236598745','236598741','123659874','2009-01-06 15:13:20','2009-01-06 15:13:20');

UNLOCK TABLES;

/*Table structure for table `newsletters` */

DROP TABLE IF EXISTS `newsletters`;

CREATE TABLE `newsletters` (
  `id` int(11) NOT NULL auto_increment,
  `subject` varchar(255) default NULL,
  `body` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `newsletters` */

LOCK TABLES `newsletters` WRITE;

insert into `newsletters` (`id`,`subject`,`body`,`created_at`,`updated_at`) values (1,'Happy birthday ','<p><img height=\"336\" width=\"223\" alt=\"\" src=\"/uploads/Image/1.jpg\" /></p>','2009-01-08 16:57:21','2009-01-08 16:57:21');

UNLOCK TABLES;

/*Table structure for table `previous_vaccinations` */

DROP TABLE IF EXISTS `previous_vaccinations`;

CREATE TABLE `previous_vaccinations` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `vaccine_id` int(11) default NULL,
  `vaccination_date` date default NULL,
  `other_details` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `previous_vaccinations` */

LOCK TABLES `previous_vaccinations` WRITE;

insert into `previous_vaccinations` (`id`,`user_id`,`vaccine_id`,`vaccination_date`,`other_details`,`created_at`,`updated_at`) values (18,2,1,'2008-01-01','','2008-12-27 12:53:45','2008-12-27 12:53:45');

UNLOCK TABLES;

/*Table structure for table `schema_info` */

DROP TABLE IF EXISTS `schema_info`;

CREATE TABLE `schema_info` (
  `version` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `schema_info` */

LOCK TABLES `schema_info` WRITE;

insert into `schema_info` (`version`) values (13);

UNLOCK TABLES;

/*Table structure for table `states` */

DROP TABLE IF EXISTS `states`;

CREATE TABLE `states` (
  `id` int(11) NOT NULL auto_increment,
  `country_id` int(11) default NULL,
  `country_code` varchar(255) default NULL,
  `state_code` varchar(255) default NULL,
  `state_name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `states` */

LOCK TABLES `states` WRITE;

insert into `states` (`id`,`country_id`,`country_code`,`state_code`,`state_name`) values (1,236,'US','AK','Alaska'),(2,236,'US','AL','Alabama'),(3,236,'US','AR','Arkansas'),(4,236,'US','AS','American Samoa'),(5,236,'US','AZ','Arizona'),(6,236,'US','CA','California'),(7,236,'US','CO','Colorado'),(8,236,'US','CT','Connecticut'),(9,236,'US','DC','D.C.'),(10,236,'US','DE','Delaware'),(11,236,'US','FL','Florida'),(12,236,'US','FM','Micronesia'),(13,236,'US','GA','Georgia'),(14,236,'US','GU','Guam'),(15,236,'US','HI','Hawaii'),(16,236,'US','IA','Iowa'),(17,236,'US','ID','Idaho'),(18,236,'US','IL','Illinois'),(19,236,'US','IN','Indiana'),(20,236,'US','KS','Kansas'),(21,236,'US','KY','Kentucky'),(22,236,'US','LA','Louisiana'),(23,236,'US','MA','Massachusetts'),(24,236,'US','MD','Maryland'),(25,236,'US','ME','Maine'),(26,236,'US','MH','Marshall Islands'),(27,236,'US','MI','Michigan'),(28,236,'US','MN','Minnesota'),(29,236,'US','MO','Missouri'),(30,236,'US','MP','Marianas'),(31,236,'US','MS','Mississippi'),(32,236,'US','MT','Montana'),(33,236,'US','NC','North Carolina'),(34,236,'US','ND','North Dakota'),(35,236,'US','NE','Nebraska'),(36,236,'US','NH','New Hampshire'),(37,236,'US','NJ','New Jersey'),(38,236,'US','NM','New Mexico'),(39,236,'US','NV','Nevada'),(40,236,'US','NY','New York'),(41,236,'US','OH','Ohio'),(42,236,'US','OK','Oklahoma'),(43,236,'US','OR','Oregon'),(44,236,'US','PA','Pennsylvania'),(45,236,'US','PR','Puerto Rico'),(46,236,'US','PW','Palau'),(47,236,'US','RI','Rhode Island'),(48,236,'US','SC','South Carolina'),(49,236,'US','SD','South Dakota'),(50,236,'US','TN','Tennessee'),(51,236,'US','TX','Texas'),(52,236,'US','UT','Utah'),(53,236,'US','VA','Virginia'),(54,236,'US','VI','Virgin Islands'),(55,236,'US','VT','Vermont'),(56,236,'US','WA','Washington'),(57,236,'US','WI','Wisconsin'),(58,236,'US','WV','West Virginia'),(59,236,'US','WY','Wyoming'),(60,236,'US','AA','Military Americas'),(61,236,'US','AE','Military Europe/ME/Canada'),(62,236,'US','AP','Military Pacific'),(63,41,'CA','AB','Alberta'),(64,41,'CA','MB','Manitoba'),(65,41,'CA','AB','Alberta'),(66,41,'CA','BC','British Columbia'),(67,41,'CA','MB','Manitoba'),(68,41,'CA','NB','New Brunswick'),(69,41,'CA','NL','Newfoundland and Labrador'),(70,41,'CA','NS','Nova Scotia'),(71,41,'CA','NT','Northwest Territories'),(72,41,'CA','NU','Nunavut'),(73,41,'CA','ON','Ontario'),(74,41,'CA','PE','Prince Edward Island'),(75,41,'CA','QC','Quebec'),(76,41,'CA','SK','Saskatchewan'),(77,41,'CA','YT','Yukon Territory'),(78,13,'AU','AAT','Australian Antarctic Territory'),(79,13,'AU','ACT','Australian Capital Territory'),(80,13,'AU','NT','Northern Territory'),(81,13,'AU','NSW','New South Wales'),(82,13,'AU','QLD','Queensland'),(83,13,'AU','SA','South Australia'),(84,13,'AU','TAS','Tasmania'),(85,13,'AU','VIC','Victoria'),(86,13,'AU','WA','Western Australia'),(87,32,'BR','AC','Acre'),(88,32,'BR','AL','Alagoas'),(89,32,'BR','AM','Amazonas'),(90,32,'BR','AP','Amapa'),(91,32,'BR','BA','Baia'),(92,32,'BR','CE','Ceara'),(93,32,'BR','DF','Distrito Federal'),(94,32,'BR','ES','Espirito Santo'),(95,32,'BR','FN','Fernando de Noronha'),(96,32,'BR','GO','Goias'),(97,32,'BR','MA','Maranhao'),(98,32,'BR','MG','Minas Gerais'),(99,32,'BR','MS','Mato Grosso do Sul'),(100,32,'BR','MT','Mato Grosso'),(101,32,'BR','PA','Para'),(102,32,'BR','PB','Paraiba'),(103,32,'BR','PE','Pernambuco'),(104,32,'BR','PI','Piaui'),(105,32,'BR','PR','Parana'),(106,32,'BR','RJ','Rio de Janeiro'),(107,32,'BR','RN','Rio Grande do Norte'),(108,32,'BR','RO','Rondonia'),(109,32,'BR','RR','Roraima'),(110,32,'BR','RS','Rio Grande do Sul'),(111,32,'BR','SC','Santa Catarina'),(112,32,'BR','SE','Sergipe'),(113,32,'BR','SP','Sao Paulo'),(114,32,'BR','TO','Tocatins'),(115,158,'NL','DR','Drente'),(116,158,'NL','FL','Flevoland'),(117,158,'NL','FR','Friesland'),(118,158,'NL','GL','Gelderland'),(119,158,'NL','GR','Groningen'),(120,158,'NL','LB','Limburg'),(121,158,'NL','NB','Noord Brabant'),(122,158,'NL','NH','Noord Holland'),(123,158,'NL','OV','Overijssel'),(124,158,'NL','UT','Utrecht'),(125,158,'NL','ZH','Zuid Holland'),(126,158,'NL','ZL','Zeeland'),(127,234,'UK','AVON','Avon'),(128,234,'UK','BEDS','Bedfordshire'),(129,234,'UK','BERKS','Berkshire'),(130,234,'UK','BUCKS','Buckinghamshire'),(131,234,'UK','CAMBS','Cambridgeshire'),(132,234,'UK','CHESH','Cheshire'),(133,234,'UK','CLEVE','Cleveland'),(134,234,'UK','CORN','Cornwall'),(135,234,'UK','CUMB','Cumbria'),(136,234,'UK','DERBY','Derbyshire'),(137,234,'UK','DEVON','Devon'),(138,234,'UK','DORSET','Dorset'),(139,234,'UK','DURHAM','Durham'),(140,234,'UK','ESSEX','Essex'),(141,234,'UK','GLOUS','Gloucestershire'),(142,234,'UK','GLONDON','Greater London'),(143,234,'UK','GMANCH','Greater Manchester'),(144,234,'UK','HANTS','Hampshire'),(145,234,'UK','HERWOR','Hereford & Worcestershire'),(146,234,'UK','HERTS','Hertfordshire'),(147,234,'UK','HUMBER','Humberside'),(148,234,'UK','IOM','Isle of Man'),(149,234,'UK','IOW','Isle of Wight'),(150,234,'UK','KENT','Kent'),(151,234,'UK','LANCS','Lancashire'),(152,234,'UK','LEICS','Leicestershire'),(153,234,'UK','LINCS','Lincolnshire'),(154,234,'UK','MERSEY','Merseyside'),(155,234,'UK','NORF','Norfolk'),(156,234,'UK','NHANTS','Northamptonshire'),(157,234,'UK','NTHUMB','Northumberland'),(158,234,'UK','NOTTS','Nottinghamshire'),(159,234,'UK','OXON','Oxfordshire'),(160,234,'UK','SHROPS','Shropshire'),(161,234,'UK','SOM','Somerset'),(162,234,'UK','STAFFS','Staffordshire'),(163,234,'UK','SUFF','Suffolk'),(164,234,'UK','SURREY','Surrey'),(165,234,'UK','SUSS','Sussex'),(166,234,'UK','WARKS','Warwickshire'),(167,234,'UK','WMID','West Midlands'),(168,234,'UK','WILTS','Wiltshire'),(169,234,'UK','YORK','Yorkshire'),(170,111,'EI','CO ANTRIM','County Antrim'),(171,111,'EI','CO ARMAGH','County Armagh'),(172,111,'EI','CO DOWN','County Down'),(173,111,'EI','CO FERMANAGH','County Fermanagh'),(174,111,'EI','CO DERRY','County Londonderry'),(175,111,'EI','CO TYRONE','County Tyrone'),(176,111,'EI','CO CAVAN','County Cavan'),(177,111,'EI','CO DONEGAL','County Donegal'),(178,111,'EI','CO MONAGHAN','County Monaghan'),(179,111,'EI','CO DUBLIN','County Dublin'),(180,111,'EI','CO CARLOW','County Carlow'),(181,111,'EI','CO KILDARE','County Kildare'),(182,111,'EI','CO KILKENNY','County Kilkenny'),(183,111,'EI','CO LAOIS','County Laois'),(184,111,'EI','CO LONGFORD','County Longford'),(185,111,'EI','CO LOUTH','County Louth'),(186,111,'EI','CO MEATH','County Meath'),(187,111,'EI','CO OFFALY','County Offaly'),(188,111,'EI','CO WESTMEATH','County Westmeath'),(189,111,'EI','CO WEXFORD','County Wexford'),(190,111,'EI','CO WICKLOW','County Wicklow'),(191,111,'EI','CO GALWAY','County Galway'),(192,111,'EI','CO MAYO','County Mayo'),(193,111,'EI','CO LEITRIM','County Leitrim'),(194,111,'EI','CO ROSCOMMON','County Roscommon'),(195,111,'EI','CO SLIGO','County Sligo'),(196,111,'EI','CO CLARE','County Clare'),(197,111,'EI','CO CORK','County Cork'),(198,111,'EI','CO KERRY','County Kerry'),(199,111,'EI','CO LIMERICK','County Limerick'),(200,111,'EI','CO TIPPERARY','County Tipperary'),(201,111,'EI','CO WATERFORD','County Waterford');

UNLOCK TABLES;

/*Table structure for table `stocks` */

DROP TABLE IF EXISTS `stocks`;

CREATE TABLE `stocks` (
  `id` int(11) NOT NULL auto_increment,
  `item_name` varchar(255) default NULL,
  `item_description` text,
  `item_quantity` int(11) default NULL,
  `item_unit_rate` double default NULL,
  `item_unit_type` varchar(255) default NULL,
  `min_stock` int(11) default NULL,
  `max_stock` int(11) default NULL,
  `lock_version` int(11) default '0',
  `item_type` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `stocks` */

LOCK TABLES `stocks` WRITE;

insert into `stocks` (`id`,`item_name`,`item_description`,`item_quantity`,`item_unit_rate`,`item_unit_type`,`min_stock`,`max_stock`,`lock_version`,`item_type`,`created_at`,`updated_at`) values (1,'BCG','good',50,50,'injection',10,150,5,'vaccine','2009-01-02 16:16:41','2009-01-08 16:30:42'),(2,'DPT','good',5,50,'injection',10,150,1,'vaccine','2009-01-02 16:31:22','2009-01-08 16:15:03'),(3,'Citamol','for fever',100,20,'strips',10,150,0,NULL,'2009-01-02 16:32:12','2009-01-02 16:32:12');

UNLOCK TABLES;

/*Table structure for table `temps` */

DROP TABLE IF EXISTS `temps`;

CREATE TABLE `temps` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `comment` text,
  `discount` int(11) default NULL,
  `stock_id` varchar(255) default NULL,
  `quantity` int(11) default NULL,
  `rate` double default NULL,
  `total_amount` double default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `temps` */

LOCK TABLES `temps` WRITE;

UNLOCK TABLES;

/*Table structure for table `user_vaccines` */

DROP TABLE IF EXISTS `user_vaccines`;

CREATE TABLE `user_vaccines` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `vaccine_id` int(11) default NULL,
  `vaccine_date` date default NULL,
  `from_here` enum('Y','N') default NULL,
  `comment` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_vaccines` */

LOCK TABLES `user_vaccines` WRITE;

insert into `user_vaccines` (`id`,`user_id`,`vaccine_id`,`vaccine_date`,`from_here`,`comment`,`created_at`,`updated_at`) values (1,5,1,'2009-01-01','N','Healthy baby. Don\'t need other vaccine.','2009-01-06 15:15:57','2009-01-06 15:15:57'),(2,2,1,'2009-01-08','Y','BCG vaccine for meseals','2009-01-08 14:18:22','2009-01-08 14:18:22'),(3,2,2,'2009-01-08','Y','DPT ','2009-01-08 14:18:23','2009-01-08 14:18:23'),(4,5,1,'2009-01-08','Y','sfs fsf ','2009-01-08 16:09:16','2009-01-08 16:09:16'),(5,5,1,'2009-01-08','Y','dherai khayo\r\n','2009-01-08 16:14:13','2009-01-08 16:14:13');

UNLOCK TABLES;

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `fname` varchar(255) default NULL,
  `mname` varchar(255) default NULL,
  `lname` varchar(255) default NULL,
  `dob` date default NULL,
  `tob` time default NULL,
  `sex` enum('M','F') default NULL,
  `height` varchar(255) default NULL,
  `weight` varchar(255) default NULL,
  `birth_address` varchar(255) default NULL,
  `birth_city` varchar(255) default NULL,
  `birth_state` varchar(255) default NULL,
  `birth_country` varchar(255) default NULL,
  `login` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `crypted_password` varchar(40) default NULL,
  `salt` varchar(40) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `users` */

LOCK TABLES `users` WRITE;

insert into `users` (`id`,`fname`,`mname`,`lname`,`dob`,`tob`,`sex`,`height`,`weight`,`birth_address`,`birth_city`,`birth_state`,`birth_country`,`login`,`email`,`crypted_password`,`salt`,`created_at`,`updated_at`) values (1,'Shishu_baby','s','shishu','2003-01-08','15:28:00','F','125','5','kathmandu','kathmadu',NULL,'Afghanistan','shishu1234','shishu123@gmail.com','f5c9e454ce7cf34e314e83f5a4274677cf448590','144eef4597d3532e5e4a172de3bce261be6119ea','2008-12-26 15:31:06','2008-12-29 18:12:43'),(2,'bisu','bisu','bisu','2009-01-01','17:59:00','M','454','12','dfdsfd','fdsafdsf',NULL,'Afghanistan','bisusubedi','bisusubedi@gmail.com','f25e08fb1a29d96e9fcdcecbf19a4f76ceaf014f','8dfb29e2a192deffeb42e10a1092d6eb3e59ecc3','2008-12-26 18:01:10','2008-12-27 16:34:12'),(3,'dsjgal','jklsdf','LJKFADS','2008-01-08','12:56:00','M','454','12','21241FHJDLGHFJ','FDADFD',NULL,'Afghanistan','ramram','ram@ram.com','9755e6a61cf459c4344169ecaf61ac4efe744250','62f07b7b537edcdeac871584e8774beaa3641ab1','2008-12-27 12:57:42','2008-12-27 12:57:42'),(4,'aakash','pd','pandey','2004-12-27','16:37:00','F','100','54','kathmandu','kathmanu',NULL,'Nepal','bishnupd','bishnupd@yahoo.com','3cb1402f5ea43192b1df7661efa44cb18eb795c2','132ad4d30a8cd0c8a6fe30e4c216926a01f20c1a','2008-12-27 16:40:31','2008-12-27 16:40:31'),(5,'wserve','wservemiddle','wservelast','2009-01-08','15:11:00','M','59','2','asfdasf','sdfsadfdsaf',NULL,'Afghanistan','patient123','patient123@gmail.com','31eca4815eb349e47c7aa5f123c4ceee3f6bc32f','c3127c3269e5be3544b4616b715abc3b0f5b2a06','2009-01-06 15:13:20','2009-01-06 15:13:20');

UNLOCK TABLES;

/*Table structure for table `vaccines` */

DROP TABLE IF EXISTS `vaccines`;

CREATE TABLE `vaccines` (
  `id` int(11) NOT NULL auto_increment,
  `vaccine_name` varchar(255) default NULL,
  `vaccine_description` text,
  `vaccination_time_from` int(11) default NULL,
  `vaccination_time_to` int(11) default NULL,
  `vaccination_time_format` varchar(255) default NULL,
  `vaccine_type` varchar(255) default NULL,
  `vaccine_side_effects` varchar(255) default NULL,
  `vaccine_price` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vaccines` */

LOCK TABLES `vaccines` WRITE;

insert into `vaccines` (`id`,`vaccine_name`,`vaccine_description`,`vaccination_time_from`,`vaccination_time_to`,`vaccination_time_format`,`vaccine_type`,`vaccine_side_effects`,`vaccine_price`,`created_at`,`updated_at`) values (1,'BCG','good',0,2,'Months','Injection','no','50','2008-12-26 15:51:49','2008-12-29 18:30:44'),(2,'DPT','Derpthreria',2,4,'Months','Injection','no','50','2008-12-26 15:52:21','2008-12-26 15:52:21'),(3,'POLIYO','poliyo',5,60,'Months','Mouth','no','20','2008-12-26 15:53:31','2008-12-26 15:53:31'),(4,'IODINE','protects from iodide',5,15,'Years','Injection','good','100','2008-12-27 08:55:19','2008-12-27 08:55:19');

UNLOCK TABLES;

SET SQL_MODE=@OLD_SQL_MODE;