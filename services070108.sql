# MySQL Navigator Xport
# Database: services
# root@localhost

# CREATE DATABASE services;
# USE services;

#
# Table structure for table 'assets'
#

# DROP TABLE IF EXISTS assets;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL auto_increment,
  `data_file_name` varchar(255) default NULL,
  `data_content_type` varchar(255) default NULL,
  `data_file_size` int(11) default NULL,
  `attachings_count` int(11) default '0',
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Dumping data for table 'assets'
#


#
# Table structure for table 'attachings'
#

# DROP TABLE IF EXISTS attachings;
CREATE TABLE `attachings` (
  `id` int(11) NOT NULL auto_increment,
  `attachable_id` int(11) default NULL,
  `asset_id` int(11) default NULL,
  `attachable_type` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_attachings_on_asset_id` (`asset_id`),
  KEY `index_attachings_on_attachable_id` (`attachable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Dumping data for table 'attachings'
#


#
# Table structure for table 'avatars'
#

# DROP TABLE IF EXISTS avatars;
CREATE TABLE `avatars` (
  `id` int(11) NOT NULL auto_increment,
  `filename` varchar(255) default NULL,
  `content_type` varchar(255) default NULL,
  `thumbnail` varchar(255) default NULL,
  `size` int(11) default NULL,
  `parent_id` int(11) default NULL,
  `height` int(11) default NULL,
  `width` int(11) default NULL,
  `asset_id` int(11) default NULL,
  `asset_type` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Dumping data for table 'avatars'
#


#
# Table structure for table 'businesses'
#

# DROP TABLE IF EXISTS businesses;
CREATE TABLE `businesses` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `alphabet` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_businesses_on_alphabet` (`alphabet`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

#
# Dumping data for table 'businesses'
#

INSERT INTO businesses VALUES (2,'car-dealers','C','2008-11-12 10:50:32','2008-11-12 10:50:32');
INSERT INTO businesses VALUES (22,'mobile company','m','2008-11-12 12:54:33','2008-11-12 12:54:33');
INSERT INTO businesses VALUES (23,'Clothes ','C','2008-12-03 06:21:05','2008-12-03 06:21:05');
INSERT INTO businesses VALUES (24,'Chemicals ','C','2008-12-03 06:21:18','2008-12-03 06:21:18');
INSERT INTO businesses VALUES (25,'Dealers ','D','2008-12-03 06:21:37','2008-12-03 06:21:37');
INSERT INTO businesses VALUES (26,'Manufacturers ','M','2008-12-03 06:21:56','2008-12-03 06:21:56');
INSERT INTO businesses VALUES (27,'Suppliers ','S','2008-12-03 06:22:25','2008-12-03 06:22:25');
INSERT INTO businesses VALUES (28,'Traders ','T','2008-12-03 06:22:40','2008-12-03 06:22:40');
INSERT INTO businesses VALUES (29,'Distributors ','D','2008-12-03 06:22:50','2008-12-03 06:22:50');
INSERT INTO businesses VALUES (30,'Exporter ','E','2008-12-03 06:23:00','2008-12-03 06:23:00');
INSERT INTO businesses VALUES (31,'Importer ','I','2008-12-03 06:23:11','2008-12-03 06:23:11');
INSERT INTO businesses VALUES (32,'Buy and Sell ','B','2008-12-03 06:23:21','2008-12-03 06:23:21');
INSERT INTO businesses VALUES (33,'Retailer','R','2008-12-03 06:23:35','2008-12-03 06:23:35');
INSERT INTO businesses VALUES (34,'Wholesaler','W','2008-12-03 06:23:47','2008-12-03 06:23:47');
INSERT INTO businesses VALUES (35,'Seller','S','2008-12-03 06:23:58','2008-12-03 06:23:58');
INSERT INTO businesses VALUES (36,'Service Provider','S','2008-12-03 06:24:09','2008-12-03 06:24:09');
INSERT INTO businesses VALUES (37,'Food','F','2008-12-03 06:24:22','2008-12-03 06:24:22');
INSERT INTO businesses VALUES (38,'Entertainment','E','2008-12-03 06:24:34','2008-12-03 06:24:34');
INSERT INTO businesses VALUES (39,'Travel and Tour','T','2008-12-03 06:24:45','2008-12-03 06:24:45');
INSERT INTO businesses VALUES (40,'Home Service','H','2008-12-03 06:24:57','2008-12-03 06:24:57');
INSERT INTO businesses VALUES (41,'Organizers','O','2008-12-03 06:25:08','2008-12-03 06:25:08');
INSERT INTO businesses VALUES (42,'Finance ','F','2008-12-03 06:25:19','2008-12-03 06:25:19');
INSERT INTO businesses VALUES (43,'Consaltant ','C','2008-12-03 06:25:30','2008-12-03 06:25:30');
INSERT INTO businesses VALUES (44,'Coaching and Tutions ','C','2008-12-03 06:25:42','2008-12-03 06:25:42');
INSERT INTO businesses VALUES (45,'Other ','O','2008-12-03 06:25:59','2008-12-03 06:25:59');
INSERT INTO businesses VALUES (46,'Manufacturer and Dealer ','M','2008-12-03 06:26:09','2008-12-03 06:26:09');
INSERT INTO businesses VALUES (47,'Manufacturer and Supplier ','M','2008-12-03 06:26:19','2008-12-03 06:26:19');
INSERT INTO businesses VALUES (48,'Real Estate ','R','2008-12-03 06:26:32','2008-12-03 06:26:32');
INSERT INTO businesses VALUES (49,'Packers And Movers','P','2008-12-03 07:40:31','2008-12-03 07:40:31');

#
# Table structure for table 'categories'
#

# DROP TABLE IF EXISTS categories;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `business_id` int(11) default NULL,
  `alphabet` varchar(255) default NULL,
  `delta` tinyint(1) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=latin1;

#
# Dumping data for table 'categories'
#

INSERT INTO categories VALUES (2,'tour organizers','2008-11-18 11:45:01','2008-12-04 11:36:36',39,'t',0);
INSERT INTO categories VALUES (3,'exporter','2008-11-18 11:45:54','2008-12-01 09:38:35',11,'e',0);
INSERT INTO categories VALUES (4,'importer','2008-11-18 11:46:07','2008-11-18 11:46:07',NULL,'i',0);
INSERT INTO categories VALUES (5,'car dealer','2008-11-18 11:46:23','2008-11-20 11:06:11',2,'c',0);
INSERT INTO categories VALUES (6,'software developers','2008-11-18 11:47:06','2008-11-18 11:47:06',NULL,'s',0);
INSERT INTO categories VALUES (7,'pc dealers','2008-11-18 11:47:25','2008-11-18 11:47:25',NULL,'p',0);
INSERT INTO categories VALUES (8,'Financial Planners ','2008-12-03 06:44:35','2008-12-03 06:44:35',42,'F',0);
INSERT INTO categories VALUES (9,'Finance and Investment Consultant ','2008-12-03 06:45:02','2008-12-03 06:45:02',42,'F',0);
INSERT INTO categories VALUES (10,'Non Banking Financing Company ','2008-12-03 06:45:18','2008-12-03 06:45:18',42,'N',0);
INSERT INTO categories VALUES (11,'Finance Stock Market ','2008-12-03 06:45:33','2008-12-03 06:45:33',42,'F',0);
INSERT INTO categories VALUES (12,'Consultant Feng Shui ','2008-12-03 06:46:03','2008-12-03 06:46:03',43,'C',0);
INSERT INTO categories VALUES (13,'Consultant Engineering ','2008-12-03 06:46:57','2008-12-03 06:46:57',43,'C',0);
INSERT INTO categories VALUES (14,'Consultant Financial ','2008-12-03 06:47:10','2008-12-03 06:47:10',43,'C',0);
INSERT INTO categories VALUES (15,'Consultant Marketing ','2008-12-03 06:47:23','2008-12-03 06:47:23',43,'C',0);
INSERT INTO categories VALUES (16,'Consultant Industrial ','2008-12-03 06:47:36','2008-12-03 06:47:36',43,'C',0);
INSERT INTO categories VALUES (17,'Computer Institute ','2008-12-03 06:49:16','2008-12-03 06:49:16',44,'C',0);
INSERT INTO categories VALUES (18,'Group and Home Tutions ','2008-12-03 06:50:51','2008-12-03 06:50:51',44,'G',0);
INSERT INTO categories VALUES (19,'Software and Networking Classes ','2008-12-03 06:51:58','2008-12-03 06:51:58',44,'S',0);
INSERT INTO categories VALUES (20,'Vocational Training Institute ','2008-12-03 06:52:18','2008-12-03 06:52:18',44,'V',0);
INSERT INTO categories VALUES (21,'Training for MBA CET GMAT GRE ','2008-12-03 06:52:35','2008-12-03 06:52:35',44,'T',0);
INSERT INTO categories VALUES (22,'Computer Manufacturer and Dealers ','2008-12-03 06:52:59','2008-12-03 06:52:59',46,'C',0);
INSERT INTO categories VALUES (23,'Air Conditioner Manufacturer and Dealers ','2008-12-03 06:53:14','2008-12-03 06:53:14',46,'A',0);
INSERT INTO categories VALUES (24,'Manufacturer and Dealer of Aluminium Goods ','2008-12-03 06:53:26','2008-12-03 06:53:26',46,'M',0);
INSERT INTO categories VALUES (25,'Manufacturer and Dealer of Audio System ','2008-12-03 06:53:57','2008-12-03 06:53:57',46,'M',0);
INSERT INTO categories VALUES (26,'Manufacturer and Dealer of Automobile Parts ','2008-12-03 06:54:13','2008-12-03 06:54:13',46,'M',0);
INSERT INTO categories VALUES (27,'Manufacturer and Supplier of Boilers ','2008-12-03 06:54:34','2008-12-03 06:54:34',47,'M',0);
INSERT INTO categories VALUES (28,'Manufacturer and Supplier of Boxes ','2008-12-03 06:54:48','2008-12-03 06:54:48',47,'M',0);
INSERT INTO categories VALUES (29,'Manufacturer and Supplier of Paper ','2008-12-03 06:58:21','2008-12-03 06:58:21',47,'M',0);
INSERT INTO categories VALUES (30,'Cable Manufacturer and Supplier ','2008-12-03 06:59:21','2008-12-03 06:59:21',47,'C',0);
INSERT INTO categories VALUES (31,'Carpets and Rugs Manufacturer and Supplier ','2008-12-03 06:59:39','2008-12-03 06:59:39',47,'C',0);
INSERT INTO categories VALUES (32,'Property and Real Estate Agent ','2008-12-03 07:00:14','2008-12-03 07:00:14',48,'P',0);
INSERT INTO categories VALUES (33,'Builders and Property Developers ','2008-12-03 07:00:26','2008-12-03 07:00:26',48,'B',0);
INSERT INTO categories VALUES (34,'Valuers and Appraisers of Property ','2008-12-03 07:00:38','2008-12-03 07:00:38',48,'V',0);
INSERT INTO categories VALUES (35,'Buy and Sell Property ','2008-12-03 07:00:53','2008-12-03 07:00:53',48,'B',0);
INSERT INTO categories VALUES (36,'Buying Selling Leasing Offices Flats Shops ','2008-12-03 07:01:06','2008-12-03 07:01:06',48,'B',0);
INSERT INTO categories VALUES (37,'Packers and movers','2008-12-03 09:28:06','2008-12-03 09:28:06',49,'P',0);
INSERT INTO categories VALUES (38,'consultants Management','2008-12-09 14:17:38','2008-12-09 14:18:10',43,'c',0);
INSERT INTO categories VALUES (42,'Computer Dealers','2008-12-10 08:52:45','2008-12-10 13:46:44',25,'C',0);
INSERT INTO categories VALUES (43,'Computer Hardware Dealers','2008-12-10 08:53:11','2008-12-10 08:53:11',25,'C',0);
INSERT INTO categories VALUES (44,'Computer Training Institutes','2008-12-10 08:53:56','2008-12-10 08:53:56',44,'C',0);
INSERT INTO categories VALUES (45,'Computer Repairs and Services','2008-12-10 08:55:28','2008-12-10 08:55:28',36,'C',0);
INSERT INTO categories VALUES (47,'Motorcycle Dealers','2008-12-10 08:55:52','2008-12-10 08:55:52',25,'M',0);
INSERT INTO categories VALUES (48,'TV Dealers','2008-12-10 08:56:04','2008-12-10 08:56:04',25,'T',0);
INSERT INTO categories VALUES (49,'Estate Agents For Residence','2008-12-10 09:00:04','2008-12-10 09:00:04',48,'E',0);
INSERT INTO categories VALUES (50,'Property Developers','2008-12-10 09:00:25','2008-12-10 09:00:25',48,'P',0);
INSERT INTO categories VALUES (51,'Property Commercial','2008-12-10 09:00:38','2008-12-10 09:00:38',48,'P',0);
INSERT INTO categories VALUES (52,'Finance For Properties','2008-12-10 09:00:54','2008-12-10 09:00:54',48,'F',0);
INSERT INTO categories VALUES (53,'Insurance Agents For Property','2008-12-10 09:01:15','2008-12-10 09:01:15',48,'I',0);
INSERT INTO categories VALUES (54,'Property Consultants','2008-12-10 09:01:35','2008-12-10 09:01:35',48,'P',0);
INSERT INTO categories VALUES (55,'Travel Agents','2008-12-10 09:21:30','2008-12-10 09:21:30',36,'T',0);
INSERT INTO categories VALUES (56,'Credit Card Agents','2008-12-10 09:21:46','2008-12-10 09:21:46',42,'C',0);
INSERT INTO categories VALUES (57,'Automobile Dealers','2008-12-16 08:49:21','2008-12-16 11:44:52',45,'A',0);
INSERT INTO categories VALUES (58,'Automobile Part Dealers','2008-12-16 08:49:44','2008-12-16 11:45:13',25,'A',0);
INSERT INTO categories VALUES (59,'Automobile Accessory Dealers','2008-12-16 08:51:00','2008-12-16 11:44:20',25,'A',0);
INSERT INTO categories VALUES (60,'Automobile Bulb Dealers','2008-12-16 08:51:17','2008-12-16 11:44:43',25,'A',0);
INSERT INTO categories VALUES (61,'Automobile AC Dealers','2008-12-16 08:51:34','2008-12-16 11:44:07',25,'A',0);
INSERT INTO categories VALUES (62,'Automobile Battery Dealers','2008-12-16 08:51:46','2008-12-16 11:44:31',25,'A',0);
INSERT INTO categories VALUES (63,'Automobile Glass Dealers','2008-12-16 08:51:59','2008-12-16 11:45:03',25,'A',0);
INSERT INTO categories VALUES (64,'Automobile Wheel Alignment Dealers ','2008-12-16 08:53:13','2008-12-16 11:45:23',25,'A',0);
INSERT INTO categories VALUES (65,'Pizza Home Delivery Services','2008-12-16 08:53:39','2008-12-16 11:47:46',37,'P',0);
INSERT INTO categories VALUES (66,'Pizza Outlets','2008-12-16 08:53:50','2008-12-16 11:48:08',37,'P',0);
INSERT INTO categories VALUES (67,'Pizza Box Dealers','2008-12-16 08:54:04','2008-12-16 11:47:24',25,'P',0);
INSERT INTO categories VALUES (68,'Pizza Bread Retailers','2008-12-16 08:54:18','2008-12-16 11:47:34',37,'P',0);
INSERT INTO categories VALUES (69,'Oven For Pizza','2008-12-16 08:54:29','2008-12-16 11:47:02',37,'O',0);
INSERT INTO categories VALUES (70,'Pizza Manufacturers','2008-12-16 08:54:45','2008-12-16 11:47:58',37,'P',0);
INSERT INTO categories VALUES (71,'Pizza Turner Dealers','2008-12-16 08:54:57','2008-12-16 11:48:19',37,'P',0);
INSERT INTO categories VALUES (72,'Water Cooler Buy Back','2008-12-16 11:25:59','2008-12-16 11:48:44',25,'W',0);
INSERT INTO categories VALUES (73,'Builders','2008-12-16 11:26:32','2008-12-16 11:45:35',48,'B',0);
INSERT INTO categories VALUES (74,'Builders and Developers','2008-12-16 11:26:59','2008-12-16 11:45:47',48,'B',0);
INSERT INTO categories VALUES (75,'Ship Builders and Repairers','2008-12-16 11:27:25','2008-12-16 11:48:33',48,'S',0);
INSERT INTO categories VALUES (76,'Panel Builder','2008-12-16 11:28:01','2008-12-16 11:47:13',45,'P',0);
INSERT INTO categories VALUES (77,'Control Panel Dealers','2008-12-16 11:28:18','2008-12-16 11:46:27',45,'C',0);
INSERT INTO categories VALUES (78,'Costumes On Hire','2008-12-16 11:28:48','2008-12-16 11:46:45',41,'C',0);
INSERT INTO categories VALUES (79,'Cinema Halls','2008-12-16 11:36:47','2008-12-16 11:45:58',38,'C',0);
INSERT INTO categories VALUES (80,'Costumes On Hire For Drama','2008-12-16 11:49:32','2008-12-16 11:49:32',38,'C',0);
INSERT INTO categories VALUES (81,'Computers On Hire','2008-12-16 11:50:08','2008-12-16 11:50:08',36,'C',0);
INSERT INTO categories VALUES (82,'Cottages On Hire','2008-12-16 11:50:26','2008-12-16 11:50:26',36,'C',0);
INSERT INTO categories VALUES (83,'Warehouses On Hire','2008-12-16 11:53:14','2008-12-16 11:53:14',36,'W',0);
INSERT INTO categories VALUES (84,'Cool Cab Services','2008-12-16 11:53:31','2008-12-16 11:53:31',36,'C',0);
INSERT INTO categories VALUES (85,'Ticketing Agents For Cinema Halls','2008-12-16 11:53:57','2008-12-16 11:53:57',38,'T',0);
INSERT INTO categories VALUES (86,'Cinema Hall Chair Dealers','2008-12-16 11:54:11','2008-12-16 11:54:11',38,'C',0);
INSERT INTO categories VALUES (87,'Cinema Hall Chair Manufacturers','2008-12-16 11:54:26','2008-12-16 11:54:26',26,'C',0);
INSERT INTO categories VALUES (88,'Multiplex Cinema Halls','2008-12-16 11:54:45','2008-12-16 11:54:45',38,'M',0);
INSERT INTO categories VALUES (89,'Exhibition Halls','2008-12-16 11:55:00','2008-12-16 11:55:00',38,'E',0);
INSERT INTO categories VALUES (90,'Cinema Equipments Dealers','2008-12-16 11:55:26','2008-12-16 11:55:26',25,'C',0);
INSERT INTO categories VALUES (91,'Cinema Light Dealers','2008-12-16 11:55:54','2008-12-16 11:55:54',25,'C',0);
INSERT INTO categories VALUES (92,'Cinema Processor Dealers','2008-12-16 11:56:10','2008-12-16 11:56:10',25,'C',0);
INSERT INTO categories VALUES (93,'Cinema Projector Dealers','2008-12-16 11:56:24','2008-12-16 11:56:24',25,'C',0);
INSERT INTO categories VALUES (94,'Chair Dealers','2008-12-16 11:56:48','2008-12-16 11:56:48',25,'C',0);
INSERT INTO categories VALUES (95,'Office Chair Dealers','2008-12-16 11:56:59','2008-12-16 11:56:59',25,'O',0);
INSERT INTO categories VALUES (96,'Wheel Chair Dealers','2008-12-16 11:57:10','2008-12-16 11:57:10',25,'W',0);
INSERT INTO categories VALUES (97,'Plastic Chair Dealers','2008-12-16 11:57:22','2008-12-16 11:57:22',25,'P',0);
INSERT INTO categories VALUES (98,'Computer Chair Dealers','2008-12-16 11:57:37','2008-12-16 11:57:37',25,'C',0);
INSERT INTO categories VALUES (99,'Bar Chair Dealers','2008-12-16 11:57:54','2008-12-16 11:57:54',25,'B',0);
INSERT INTO categories VALUES (100,'Civil Engineers','2008-12-16 11:58:41','2008-12-16 11:58:41',36,'C',0);
INSERT INTO categories VALUES (101,'Civil Engineering Books','2008-12-16 11:58:57','2008-12-16 11:58:57',45,'C',0);
INSERT INTO categories VALUES (102,'Civil Contractors','2008-12-16 11:59:16','2008-12-16 11:59:16',45,'C',0);
INSERT INTO categories VALUES (103,'Colleges For Engineering','2008-12-16 11:59:30','2008-12-16 11:59:30',44,'C',0);
INSERT INTO categories VALUES (104,'Colleges For Computer Engineering','2008-12-16 11:59:45','2008-12-16 11:59:45',44,'C',0);
INSERT INTO categories VALUES (105,'Circus','2008-12-16 12:00:51','2008-12-16 12:00:51',38,'C',0);
INSERT INTO categories VALUES (106,'Change Of Name','2008-12-16 12:01:16','2008-12-16 12:01:16',45,'C',0);
INSERT INTO categories VALUES (107,'Classifieds Centres','2008-12-16 12:02:20','2008-12-16 12:02:20',36,'C',0);
INSERT INTO categories VALUES (108,'Construction Equipments Manufacturers','2008-12-16 12:02:37','2008-12-16 12:02:37',45,'C',0);
INSERT INTO categories VALUES (109,'Consultancy Service Company','2008-12-16 12:03:36','2008-12-16 12:03:36',43,'C',0);
INSERT INTO categories VALUES (110,'Air Ticketing Agents For Domestic','2008-12-17 04:41:33','2008-12-17 04:41:33',39,'A',0);
INSERT INTO categories VALUES (111,'Cargo Agents For Air','2008-12-17 04:41:52','2008-12-17 04:41:52',39,'C',0);
INSERT INTO categories VALUES (112,'Lab Testing For Air','2008-12-17 04:42:20','2008-12-17 04:42:20',36,'L',0);
INSERT INTO categories VALUES (113,'Air Compressor Dealers','2008-12-17 04:42:32','2008-12-17 04:42:32',25,'A',0);
INSERT INTO categories VALUES (114,'Air Coolers On Hire','2008-12-17 04:42:44','2008-12-17 04:42:44',36,'A',0);
INSERT INTO categories VALUES (115,'Aircooled Transformer Manufacturers','2008-12-17 04:43:01','2008-12-17 04:43:01',26,'A',0);
INSERT INTO categories VALUES (116,'Air Gun Dealers','2008-12-17 04:43:13','2008-12-17 04:43:13',25,'A',0);
INSERT INTO categories VALUES (117,'Air Brush Dealers','2008-12-17 04:43:28','2008-12-17 04:43:28',25,'A',0);
INSERT INTO categories VALUES (118,'Air Cooler Repairs and Services','2008-12-17 04:44:15','2008-12-17 04:44:15',36,'A',0);
INSERT INTO categories VALUES (119,'Air Filter Manufacturers','2008-12-17 04:44:26','2008-12-17 04:44:26',26,'A',0);
INSERT INTO categories VALUES (120,'Cargo Agents For Air International','2008-12-17 04:44:51','2008-12-17 04:44:51',39,'C',0);
INSERT INTO categories VALUES (121,'C and F Agents For Air','2008-12-17 04:45:26','2008-12-17 04:45:26',39,'C',0);
INSERT INTO categories VALUES (122,'Institutes For Air Hostess Training ','2008-12-17 04:45:45','2008-12-17 04:45:45',44,'I',0);
INSERT INTO categories VALUES (123,'Institutes For Air Rifle Shooting','2008-12-17 04:45:59','2008-12-17 04:45:59',44,'I',0);
INSERT INTO categories VALUES (124,'Institutes For Air Navigation Training','2008-12-17 04:46:14','2008-12-17 04:46:14',44,'I',0);
INSERT INTO categories VALUES (125,'Institutes For Pilot Training','2008-12-17 04:46:47','2008-12-17 04:46:47',44,'I',0);
INSERT INTO categories VALUES (126,'Institutes For Fire Extinguisher Training','2008-12-17 04:47:02','2008-12-17 04:47:02',44,'I',0);
INSERT INTO categories VALUES (127,'Computer Training Institutes For SAP','2008-12-17 04:47:33','2008-12-17 04:47:33',44,'C',0);
INSERT INTO categories VALUES (128,'Computer Training Institutes For Animation','2008-12-17 04:47:45','2008-12-17 04:47:45',44,'C',0);
INSERT INTO categories VALUES (129,'Computer Training Institutes For Basic','2008-12-17 04:47:57','2008-12-17 04:47:57',44,'C',0);
INSERT INTO categories VALUES (130,'Computer Training Institutes For AUTOCAD','2008-12-17 04:48:13','2008-12-17 04:48:13',44,'C',0);
INSERT INTO categories VALUES (131,'Computer Training Institutes For Tally ','2008-12-17 04:48:27','2008-12-17 04:48:27',44,'C',0);
INSERT INTO categories VALUES (132,'Computer Training Institutes For Networking','2008-12-17 04:48:39','2008-12-17 04:48:39',44,'C',0);
INSERT INTO categories VALUES (133,'Computer Training Institutes For Software','2008-12-17 04:48:49','2008-12-17 04:48:49',44,'C',0);
INSERT INTO categories VALUES (134,'Computer Training Institutes For Internet Web Page Designing','2008-12-17 04:49:01','2008-12-17 04:49:01',44,'C',0);
INSERT INTO categories VALUES (135,'Computer Training Institutes For Java','2008-12-17 04:49:13','2008-12-17 04:49:13',44,'C',0);
INSERT INTO categories VALUES (136,'Computer Training Institutes For Graphic','2008-12-17 04:49:23','2008-12-17 04:49:23',44,'C',0);
INSERT INTO categories VALUES (137,'Computer Training Institutes For Oracle','2008-12-17 04:49:33','2008-12-17 04:49:33',44,'C',0);
INSERT INTO categories VALUES (138,'Computer Training Institutes For MSCIT','2008-12-17 04:49:42','2008-12-17 04:49:42',44,'C',0);
INSERT INTO categories VALUES (139,'Computer Training Institutes For IT','2008-12-17 04:49:53','2008-12-17 04:49:53',44,'C',0);
INSERT INTO categories VALUES (140,'Computer Training Institutes For CAD','2008-12-17 04:50:03','2008-12-17 04:50:03',44,'C',0);
INSERT INTO categories VALUES (141,'Computer Training Institutes For Accounting','2008-12-17 04:50:15','2008-12-17 04:50:15',44,'C',0);
INSERT INTO categories VALUES (142,'Computer Training Institutes For Hardware Engineering','2008-12-17 04:50:26','2008-12-17 04:50:26',44,'C',0);
INSERT INTO categories VALUES (143,'Computer Training Institutes For MCA','2008-12-17 04:50:37','2008-12-17 04:50:37',44,'C',0);
INSERT INTO categories VALUES (144,'Computer Training Institutes For Excel','2008-12-17 04:50:47','2008-12-17 04:50:47',44,'C',0);
INSERT INTO categories VALUES (145,'Computer Training Institutes For CCNA','2008-12-17 04:50:56','2008-12-17 04:50:56',44,'C',0);
INSERT INTO categories VALUES (146,'Computer Training Institutes For Photo Shop','2008-12-17 04:51:06','2008-12-17 04:51:06',44,'C',0);
INSERT INTO categories VALUES (147,'Computer Training Institutes For Microsoft','2008-12-17 04:51:16','2008-12-17 04:51:16',44,'C',0);
INSERT INTO categories VALUES (148,'Computer Training Institutes For MS Office','2008-12-17 04:51:25','2008-12-17 04:51:25',44,'C',0);
INSERT INTO categories VALUES (149,'Computer Training Institutes For Software Testing','2008-12-17 04:51:35','2008-12-17 04:51:35',44,'C',0);
INSERT INTO categories VALUES (150,'Computer Training Institutes For Programming','2008-12-17 04:51:46','2008-12-17 04:51:46',44,'C',0);
INSERT INTO categories VALUES (151,'Pan Card Consultants','2008-12-17 04:53:18','2008-12-17 04:53:18',43,'P',0);
INSERT INTO categories VALUES (152,'Investment Consultants','2008-12-17 04:53:32','2008-12-17 04:53:32',43,'I',0);
INSERT INTO categories VALUES (153,'Finance Consultants','2008-12-17 04:53:44','2008-12-17 04:53:44',43,'F',0);
INSERT INTO categories VALUES (154,'Immigration Consultants','2008-12-17 04:53:55','2008-12-17 04:53:55',43,'I',0);
INSERT INTO categories VALUES (155,'Education Consultants','2008-12-17 04:54:06','2008-12-17 04:54:06',43,'E',0);
INSERT INTO categories VALUES (156,'Registrar Of Company Consultants','2008-12-17 04:54:16','2008-12-17 04:54:16',43,'R',0);
INSERT INTO categories VALUES (157,'Tax Consultants','2008-12-17 04:54:27','2008-12-17 04:54:27',43,'T',0);
INSERT INTO categories VALUES (158,'Rto Consultants','2008-12-17 04:54:37','2008-12-17 04:54:37',43,'R',0);
INSERT INTO categories VALUES (159,'Income Tax Consultants','2008-12-17 04:54:49','2008-12-17 04:54:49',43,'I',0);
INSERT INTO categories VALUES (160,'Trademark Registration Consultants','2008-12-17 04:55:15','2008-12-17 04:55:15',43,'T',0);
INSERT INTO categories VALUES (161,'Registrar Of Marriage Consultants','2008-12-17 04:55:26','2008-12-17 04:55:26',43,'R',0);
INSERT INTO categories VALUES (162,'IT Consultants','2008-12-17 04:55:36','2008-12-17 04:55:36',43,'I',0);
INSERT INTO categories VALUES (163,'BPO Consultants','2008-12-17 04:55:47','2008-12-17 04:55:47',43,'B',0);
INSERT INTO categories VALUES (164,'Placement Services For Insurance Advisor','2008-12-17 04:56:06','2008-12-17 04:56:06',43,'P',0);
INSERT INTO categories VALUES (165,'Education Consultants For USA','2008-12-17 04:56:19','2008-12-17 04:56:19',43,'E',0);
INSERT INTO categories VALUES (166,'Driving License Consultants','2008-12-17 04:56:32','2008-12-17 04:56:32',43,'D',0);
INSERT INTO categories VALUES (167,'Marriage Certificate Consultants','2008-12-17 04:56:46','2008-12-17 04:56:46',43,'M',0);
INSERT INTO categories VALUES (168,'Foreign Exchange Consultants','2008-12-17 04:56:58','2008-12-17 04:56:58',43,'F',0);
INSERT INTO categories VALUES (169,'Vastu Shastra Consultants','2008-12-17 04:57:08','2008-12-17 04:57:08',43,'V',0);
INSERT INTO categories VALUES (170,'Service Tax Consultants','2008-12-17 04:57:19','2008-12-17 04:57:19',43,'S',0);
INSERT INTO categories VALUES (171,'Business Consultants','2008-12-17 04:57:30','2008-12-17 04:57:30',43,'B',0);
INSERT INTO categories VALUES (172,'Insurance Consultants','2008-12-17 04:57:43','2008-12-17 04:57:43',43,'I',0);
INSERT INTO categories VALUES (173,'Education Consultants For UK','2008-12-17 04:57:55','2008-12-17 04:57:55',43,'E',0);
INSERT INTO categories VALUES (174,'Engineering Consultants','2008-12-17 04:58:05','2008-12-17 04:58:05',43,'E',0);
INSERT INTO categories VALUES (175,'Provident Fund Consultants','2008-12-17 04:58:34','2008-12-17 04:58:34',43,'P',0);
INSERT INTO categories VALUES (176,'Nutrition Consultants','2008-12-17 04:58:44','2008-12-17 04:58:44',43,'N',0);
INSERT INTO categories VALUES (177,'Franchise Consultants','2008-12-17 04:58:56','2008-12-17 04:58:56',43,'F',0);
INSERT INTO categories VALUES (178,'Yoga Consultants','2008-12-17 04:59:07','2008-12-17 04:59:07',43,'Y',0);
INSERT INTO categories VALUES (179,'Project Consultants','2008-12-17 04:59:19','2008-12-17 04:59:19',43,'P',0);
INSERT INTO categories VALUES (180,'Management Consultants','2008-12-17 04:59:30','2008-12-17 04:59:30',43,'M',0);
INSERT INTO categories VALUES (181,'Import Export Consultants','2008-12-17 04:59:43','2008-12-17 04:59:43',43,'I',0);
INSERT INTO categories VALUES (182,'Legal Consultants','2008-12-17 04:59:59','2008-12-17 04:59:59',43,'L',0);
INSERT INTO categories VALUES (183,'Fda Consultants','2008-12-17 05:00:09','2008-12-17 05:00:09',43,'F',0);
INSERT INTO categories VALUES (184,'Education Consultants For Australia','2008-12-17 05:00:36','2008-12-17 05:00:36',43,'E',0);
INSERT INTO categories VALUES (185,'Call Centre Consultants','2008-12-17 05:00:51','2008-12-17 05:00:51',43,'C',0);
INSERT INTO categories VALUES (186,'Share Consultants','2008-12-17 05:01:04','2008-12-17 05:01:04',43,'S',0);
INSERT INTO categories VALUES (187,'Human Right Consultants','2008-12-17 05:01:13','2008-12-17 05:01:13',43,'H',0);
INSERT INTO categories VALUES (188,'Verification Consultants','2008-12-17 05:01:32','2008-12-17 05:01:32',43,'V',0);
INSERT INTO categories VALUES (189,'Structural Engineering Consultants','2008-12-17 05:01:43','2008-12-17 05:01:43',43,'S',0);
INSERT INTO categories VALUES (190,'Purchase Consultant','2008-12-17 11:13:42','2008-12-17 11:13:42',43,'P',0);
INSERT INTO categories VALUES (191,'Public Relation Consultants','2008-12-17 11:13:54','2008-12-17 11:13:54',43,'P',0);
INSERT INTO categories VALUES (192,'Pharmaceutical Consultants','2008-12-17 11:14:07','2008-12-17 11:14:07',43,'P',0);
INSERT INTO categories VALUES (193,'Copyright Consultants','2008-12-17 11:14:16','2008-12-17 11:14:16',43,'C',0);
INSERT INTO categories VALUES (194,'Immigration Consultants For UAE','2008-12-17 11:14:25','2008-12-17 11:14:25',43,'I',0);
INSERT INTO categories VALUES (195,'Immigration Consultants For New Zealand','2008-12-17 11:14:35','2008-12-17 11:14:35',43,'I',0);
INSERT INTO categories VALUES (196,'Property Registration Consultants','2008-12-17 11:14:43','2008-12-17 11:14:43',43,'P',0);
INSERT INTO categories VALUES (197,'Certification Consultants','2008-12-17 11:14:53','2008-12-17 11:14:53',43,'C',0);
INSERT INTO categories VALUES (198,'Cyber Law Consultants','2008-12-17 11:15:08','2008-12-17 11:15:08',43,'C',0);
INSERT INTO categories VALUES (199,'Construction Consultants','2008-12-17 11:15:20','2008-12-17 11:15:20',43,'C',0);
INSERT INTO categories VALUES (200,'Civil Consultants','2008-12-17 11:15:28','2008-12-17 11:15:28',43,'C',0);
INSERT INTO categories VALUES (201,'Car Parking Consultants','2008-12-17 11:15:41','2008-12-17 11:15:41',43,'C',0);

#
# Table structure for table 'categorizations'
#

# DROP TABLE IF EXISTS categorizations;
CREATE TABLE `categorizations` (
  `id` int(11) NOT NULL auto_increment,
  `category_id` int(11) default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=latin1;

#
# Dumping data for table 'categorizations'
#

INSERT INTO categorizations VALUES (1,6,1);
INSERT INTO categorizations VALUES (2,7,8);
INSERT INTO categorizations VALUES (3,3,2);
INSERT INTO categorizations VALUES (4,4,2);
INSERT INTO categorizations VALUES (5,7,7);
INSERT INTO categorizations VALUES (6,4,3);
INSERT INTO categorizations VALUES (7,5,9);
INSERT INTO categorizations VALUES (10,5,6);
INSERT INTO categorizations VALUES (11,7,4);
INSERT INTO categorizations VALUES (12,6,4);
INSERT INTO categorizations VALUES (13,4,15);
INSERT INTO categorizations VALUES (14,4,5);
INSERT INTO categorizations VALUES (15,3,1);
INSERT INTO categorizations VALUES (16,7,1);
INSERT INTO categorizations VALUES (17,3,13);
INSERT INTO categorizations VALUES (18,4,13);
INSERT INTO categorizations VALUES (19,3,12);
INSERT INTO categorizations VALUES (20,4,12);
INSERT INTO categorizations VALUES (23,3,16);
INSERT INTO categorizations VALUES (24,4,16);
INSERT INTO categorizations VALUES (25,3,17);
INSERT INTO categorizations VALUES (26,4,17);
INSERT INTO categorizations VALUES (27,3,18);
INSERT INTO categorizations VALUES (28,4,18);
INSERT INTO categorizations VALUES (29,24,19);
INSERT INTO categorizations VALUES (30,30,20);
INSERT INTO categorizations VALUES (31,3,21);
INSERT INTO categorizations VALUES (32,4,21);
INSERT INTO categorizations VALUES (33,4,22);
INSERT INTO categorizations VALUES (34,17,23);
INSERT INTO categorizations VALUES (35,22,23);
INSERT INTO categorizations VALUES (36,17,24);
INSERT INTO categorizations VALUES (37,17,25);
INSERT INTO categorizations VALUES (38,15,25);
INSERT INTO categorizations VALUES (39,2,26);
INSERT INTO categorizations VALUES (40,5,27);
INSERT INTO categorizations VALUES (41,3,27);
INSERT INTO categorizations VALUES (42,4,27);
INSERT INTO categorizations VALUES (43,26,28);
INSERT INTO categorizations VALUES (44,9,29);
INSERT INTO categorizations VALUES (45,11,29);
INSERT INTO categorizations VALUES (46,8,29);
INSERT INTO categorizations VALUES (47,3,30);
INSERT INTO categorizations VALUES (48,4,30);
INSERT INTO categorizations VALUES (49,25,30);
INSERT INTO categorizations VALUES (50,7,30);
INSERT INTO categorizations VALUES (51,3,31);
INSERT INTO categorizations VALUES (52,4,31);
INSERT INTO categorizations VALUES (53,17,32);
INSERT INTO categorizations VALUES (54,22,32);
INSERT INTO categorizations VALUES (55,33,33);
INSERT INTO categorizations VALUES (56,35,33);
INSERT INTO categorizations VALUES (57,6,34);
INSERT INTO categorizations VALUES (58,3,35);
INSERT INTO categorizations VALUES (59,4,35);
INSERT INTO categorizations VALUES (60,3,36);
INSERT INTO categorizations VALUES (61,4,36);
INSERT INTO categorizations VALUES (63,23,38);
INSERT INTO categorizations VALUES (64,24,38);
INSERT INTO categorizations VALUES (65,35,39);
INSERT INTO categorizations VALUES (66,36,39);
INSERT INTO categorizations VALUES (67,35,40);
INSERT INTO categorizations VALUES (68,36,40);
INSERT INTO categorizations VALUES (69,32,40);
INSERT INTO categorizations VALUES (70,13,41);
INSERT INTO categorizations VALUES (71,12,41);
INSERT INTO categorizations VALUES (72,14,41);
INSERT INTO categorizations VALUES (73,16,41);
INSERT INTO categorizations VALUES (74,15,41);
INSERT INTO categorizations VALUES (75,17,42);
INSERT INTO categorizations VALUES (76,22,42);
INSERT INTO categorizations VALUES (77,33,43);
INSERT INTO categorizations VALUES (78,35,43);
INSERT INTO categorizations VALUES (79,37,44);
INSERT INTO categorizations VALUES (80,37,45);
INSERT INTO categorizations VALUES (81,31,46);
INSERT INTO categorizations VALUES (82,4,47);
INSERT INTO categorizations VALUES (83,17,10);
INSERT INTO categorizations VALUES (84,22,10);
INSERT INTO categorizations VALUES (85,7,10);
INSERT INTO categorizations VALUES (86,38,48);
INSERT INTO categorizations VALUES (87,33,49);
INSERT INTO categorizations VALUES (88,35,49);
INSERT INTO categorizations VALUES (89,33,50);
INSERT INTO categorizations VALUES (90,35,50);
INSERT INTO categorizations VALUES (95,42,53);
INSERT INTO categorizations VALUES (96,44,54);
INSERT INTO categorizations VALUES (97,42,55);
INSERT INTO categorizations VALUES (98,42,56);
INSERT INTO categorizations VALUES (99,42,57);
INSERT INTO categorizations VALUES (100,42,58);
INSERT INTO categorizations VALUES (101,42,59);
INSERT INTO categorizations VALUES (102,42,60);
INSERT INTO categorizations VALUES (103,42,61);
INSERT INTO categorizations VALUES (104,42,62);
INSERT INTO categorizations VALUES (105,49,63);
INSERT INTO categorizations VALUES (106,49,64);
INSERT INTO categorizations VALUES (107,49,65);
INSERT INTO categorizations VALUES (108,49,66);
INSERT INTO categorizations VALUES (109,49,67);
INSERT INTO categorizations VALUES (110,52,68);
INSERT INTO categorizations VALUES (111,52,69);
INSERT INTO categorizations VALUES (112,52,70);
INSERT INTO categorizations VALUES (113,153,72);
INSERT INTO categorizations VALUES (114,11,72);
INSERT INTO categorizations VALUES (115,8,72);

#
# Table structure for table 'cities'
#

# DROP TABLE IF EXISTS cities;
CREATE TABLE `cities` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

#
# Dumping data for table 'cities'
#

INSERT INTO cities VALUES (1,'mumbai','2008-11-10 12:47:21','2008-11-10 12:47:21');
INSERT INTO cities VALUES (9,'thane','2008-11-12 11:49:03','2008-11-12 11:49:03');
INSERT INTO cities VALUES (39,'Faridabad','2008-11-12 11:57:57','2008-11-12 11:57:57');
INSERT INTO cities VALUES (51,'Hyderabad','2008-11-12 12:00:48','2008-11-12 12:00:48');

#
# Table structure for table 'companies'
#

# DROP TABLE IF EXISTS companies;
CREATE TABLE `companies` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `address1` varchar(255) default NULL,
  `address2` varchar(255) default NULL,
  `locality_id` int(11) default NULL,
  `city_id` int(11) default NULL,
  `state` varchar(255) default NULL,
  `country` varchar(255) default NULL,
  `pincode` varchar(255) default NULL,
  `phone1` varchar(255) default NULL,
  `phone2` varchar(255) default NULL,
  `fax` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `contact` varchar(255) default NULL,
  `about` text,
  `business_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `image_ad_file_name` varchar(255) default NULL,
  `image_ad_content_type` varchar(255) default NULL,
  `image_ad_file_size` int(11) default NULL,
  `image_ad_updated_at` datetime default NULL,
  `approved` tinyint(1) default '0',
  `other_category` varchar(255) default NULL,
  `imageapprove` tinyint(1) default '0',
  `videoapprove` tinyint(1) default '0',
  `owner_id` int(11) default NULL,
  `delta` tinyint(1) default NULL,
  `reviews_count` int(11) default '0',
  `priority` tinyint(1) default '0',
  `from_date` date default NULL,
  `to_date` date default NULL,
  `scroll_ads` tinyint(1) default '0',
  `ad_url` varchar(255) default NULL,
  `image_from_date` date default NULL,
  `image_to_date` date default NULL,
  `video_from_date` date default NULL,
  `video_to_date` date default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_companies_on_locality_id` (`locality_id`),
  KEY `index_companies_on_city_id` (`city_id`),
  KEY `index_companies_on_business_id` (`business_id`),
  KEY `index_companies_on_pincode` (`pincode`),
  KEY `index_companies_on_address1` (`address1`),
  KEY `index_companies_on_address2` (`address2`),
  KEY `index_companies_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=latin1;

#
# Dumping data for table 'companies'
#

INSERT INTO companies VALUES (1,'Econify Infotech Pvt. Ltd','Marol Maroshi Road','Andheri',7,1,'Maharashtra','India','400059','022-5454545','022-6537463','022-6624586','','Srikanth ','this is edited to view the changes and changes goes on',36,'2008-11-12 12:07:33','2009-01-05 09:31:33','morning-glory-pool.jpg','image/jpeg',148581,'2008-12-31 15:01:46',1,'',1,1,11,0,NULL,0,'2009-01-05','2009-01-04',1,'http://www.econify.com',NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (2,'Hardrock Diamond','Marol Maroshi Road','Andheri',7,1,'Maharashtra','India','400059','022-5454545','','022-6624586','','Srikanth ','dsfsfsd',36,'2008-11-12 12:08:23','2008-12-10 06:02:23',NULL,NULL,NULL,NULL,1,'',0,0,9,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (5,'LG','999 Chandani Chauk','Mulund',7,1,'Maharashtra','India','400333','','','','','','',26,'2008-11-12 14:42:34','2009-01-06 10:27:53','branch-t2k8.jpg','image/jpeg',119593,'2008-12-18 13:33:31',1,'',0,0,NULL,0,NULL,0,'2009-01-06','2009-01-06',1,'http://www.econify.com','2009-01-06','2009-01-06','2009-01-06','2009-01-06');
INSERT INTO companies VALUES (6,'Samsung','602 Gandhi Chauk','Andheri',7,1,'Maharashtra','India','400992','','','','','','',2,'2008-11-12 14:44:19','2008-11-18 11:54:55',NULL,NULL,NULL,NULL,1,NULL,0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (8,'IBM','712 Nagari Niwara Parisad','Harimari',7,1,'Maharashtra','India','400420','','','','','','',36,'2008-11-12 14:48:12','2008-12-10 05:58:57',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (9,'Lenovo','555 Sakinaka','Andheri',7,1,'Maharashtra','India','400630','','','','','','',2,'2008-11-12 14:50:31','2008-12-04 11:54:43',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (10,'Logitech','889 Mahamari Chauk','Andheri',7,1,'Maharashtra','India','400890','','','','','','',36,'2008-11-12 14:52:23','2008-12-24 08:53:21',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,1,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (15,'Bicycle shop','shop no. 32, arihant villa','dinesh nagar',7,1,'maharashtra','india','4345345','564645676','7886857743','42135436665','my@email.services','someone','rtsersdtysrgfjhgk',25,'2008-12-02 07:10:00','2008-12-10 05:53:58',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (16,'Senses Mens Wear ','fgdgdg','ghfghgfhg',33,1,'Maharashtra','India','457835','65867868','6786867868','4334534535','','','',23,'2008-12-03 08:10:31','2008-12-03 08:15:19',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (17,'Taj Garments ','dfghfgh','hgjkfjhkjhk',7,1,'Maharashtra','India','45345','6757','879879','87976','','','',23,'2008-12-03 08:11:23','2008-12-03 09:14:28',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (18,'Amit Mens Wear ','sv road','Devarat estate',7,1,'Maharashtra','India','55667788','4556456','8675548','264574774','','','',23,'2008-12-03 08:15:09','2008-12-03 11:23:34',NULL,NULL,NULL,NULL,1,'',1,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (19,'Arjun chemicals ','12 Namaskar ','Diva ',7,1,'Maharashtra','India','67747556','55456677','','','','arjun chadda','',24,'2008-12-03 08:23:33','2008-12-09 13:01:23',NULL,NULL,NULL,NULL,1,'',1,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (21,'Dipesh Engineering Works ','3, 1st floor ','Sheru villa, JP road ',7,1,'Maharashtra','India','55667889','543567456','34786678','','','','',36,'2008-12-03 08:26:46','2008-12-10 05:56:55',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (22,'Chemi Plant Engineering co. ','114 Guru Govind Singh Estate ','Rajawadi ',7,1,'Maharashtra','India','42342342','445675675','','','','dharmesh','',24,'2008-12-03 08:28:43','2008-12-03 11:51:32',NULL,NULL,NULL,NULL,1,'',1,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (23,'Thakrar infotrendz pvt. Ltd ','B-107, Kailash Esplanade ','opp.shreyas cinema ',36,1,'Maharashtra','India','5678888','999777787','','','','thakrar','',44,'2008-12-03 08:29:48','2008-12-03 09:46:11',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (24,'IIHT Computer Education ','4888, Kasturchan Mill Compound, ','SB Road ',7,1,'Maharashtra','India','44353533','566677656','','','','bajaj','',44,'2008-12-03 08:30:48','2008-12-04 11:52:55',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (25,'Technology Services ','115 sheri devji ','DB Road ',58,1,'Maharashtra','India','6756775','34242678','','','','','',43,'2008-12-03 08:32:03','2008-12-03 09:14:17',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,2,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (26,'Nirdhar Express Courier ','Gala no. 5, Khan Compound ','Sambhaji Lane ',11,1,'Maharashtra','India','87997996','','','','','Niraj muzundar','',45,'2008-12-03 08:33:21','2008-12-31 14:40:29',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (27,'Maruti Express Services ','Agarwal Industries ','Firoj Area ',7,1,'Maharashtra','India','45345354','','','','','','',2,'2008-12-03 08:34:52','2008-12-04 11:55:06',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (28,'Hemendra Metal Industries ','Raja Industries compound ','Fort ',7,1,'Maharashtra','India','45664435','','','','','','',46,'2008-12-03 08:36:07','2008-12-04 11:52:15',NULL,NULL,NULL,NULL,1,'',1,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (29,'Laxmi Narayan And Sons ','KK Gupta Estate ','Singhania Estate ',7,1,'Maharashtra','India','66554433','','','','','','',42,'2008-12-03 08:37:02','2008-12-04 11:54:34',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (30,'Dali Electronics ','50, Sidhupura ','Singh Road ',7,1,'Maharashtra','India','83848884','','','','','','',38,'2008-12-03 08:38:22','2008-12-03 11:42:24',NULL,NULL,NULL,NULL,1,'',1,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (31,'Diamond Neon ','213 2nd Floor ','Divawadi estate ',7,1,'Maharashtra','India','5490000','45533322','','','','paresh mohite','',36,'2008-12-03 09:08:51','2008-12-10 06:03:02',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (32,'Digi Technologies ','New Ghanshyam Bldg ','hindu wadi ',7,1,'Maharashtra','India','400587','78584843','','','','girish kumble','',36,'2008-12-03 09:10:26','2008-12-10 05:59:35',NULL,NULL,NULL,NULL,1,'',1,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (33,'Tavoy Workwear Pvt. Ltd ','Kedarwadi ','simple adderss ',7,1,'Maharashtra','India','7666777','453543535','','','','joseph desoza','',48,'2008-12-03 09:11:34','2008-12-10 06:01:58',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (34,'Telephone Electronics Corporations ','3, Adhyaru Estate ','opp.mm roads ',48,1,'Maharashtra','India','77665554','55665666','','','','manager','',45,'2008-12-03 09:13:52','2008-12-03 09:14:34',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (35,'Demag Cranes And Components ','201, Madhu Ind Estate ','daman ',7,1,'Maharashtra','India','66555555','34343333','','','','harminder','',25,'2008-12-03 09:16:36','2008-12-03 11:28:15',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (36,'Jay Equipments And Systems Pvt Ltd ','302, Girihaland ','dainik shirner road ',7,1,'Maharashtra','India','56546466','','','','','jay gandhi','',32,'2008-12-03 09:17:55','2008-12-10 05:57:34',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (37,'Varsha Bullion & Elemental Analab ','2, Bhuwalwshwar ','Gandhi nagar ',47,1,'Maharashtra','India','45343543','','','','','varsha','',41,'2008-12-03 09:19:03','2008-12-03 09:46:17',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (38,'Vikas Steel & Engg Co ','201-A Sun Industrial Estate ','Jaya nagar ',67,1,'Maharashtra','India','53535353','','','','','vikas videshi','',47,'2008-12-03 09:20:34','2008-12-03 09:46:22',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (39,'Aditya Industries ','B 112-Gambhir Industrial Estate ','Vihar Road ',7,1,'Maharashtra','India','43333234','443423332','','','','aditya kanwar','',32,'2008-12-03 09:21:48','2009-01-06 10:23:56','baker-g2yi.jpg','image/jpeg',112487,'2009-01-06 15:53:55',1,'',1,0,NULL,0,NULL,0,'2009-01-05','2009-01-05',1,'http://www.econify.com','2009-01-06','2009-01-06','2009-01-06','2009-01-06');
INSERT INTO companies VALUES (40,'R. P. Industries ','4, Guru Prabha ','Char-rasta ',7,1,'Maharashtra','India','56544566','','','','','rajesh pawar','',48,'2008-12-03 09:23:17','2008-12-04 12:39:20',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (41,'Shree Ganesha Consultants ','418, 33rd Cross ','Navghar ',44,1,'Maharashtra','India','86868686','665647774','','','','','',43,'2008-12-03 09:24:22','2008-12-03 09:46:17',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (42,'Budharia Infotech ','Singh Heavy Ind Est ','link road ',7,1,'Maharashtra','India','23322233','','','','','bhavesh','',44,'2008-12-03 09:25:28','2009-01-06 10:26:59','air-sleeve-9e3.jpg','image/jpeg',109480,'2009-01-02 19:57:30',1,'',1,0,NULL,0,NULL,1,'2008-10-18','2009-01-20',1,'http://www.budha.com','2009-01-06','2009-01-06','2009-01-06','2009-01-06');
INSERT INTO companies VALUES (43,'Jaineeket Enterprises ','6, Nabdanvan Bldg ','opp. Jaslok sweets ',43,1,'Maharashtra','India','88599499','','','','','aniket jain','',25,'2008-12-03 09:27:31','2008-12-11 09:31:25',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (44,'Gupta Home Packers and Movers  ','54, Mangal Bhavan ','Akruti Raod ',7,1,'Maharashtra','India','77688865','99500044','','','','','',49,'2008-12-03 09:29:43','2008-12-05 13:50:28',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (45,'Global Packing and Moving ','32, Sarvoday Ind Estate ','J B Nagar ',7,1,'Maharashtra','India','66577477','66647774','','','','yusuf khan','',49,'2008-12-03 09:30:48','2008-12-03 11:44:45',NULL,NULL,NULL,NULL,1,'',1,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (46,'Arihant Industries ','92, Sarang Street ','link road ',48,1,'Maharashtra','India','999707006','','','','','','',47,'2008-12-03 09:35:20','2008-12-11 09:31:25',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (47,'Allied Plastics ','3, Samroz Industrial Estates ','anand nagar ',66,1,'Maharashtra','India','899904843','577884844','','','','ghorpade','',45,'2008-12-03 09:45:58','2008-12-11 09:31:25',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (48,'Asha r verma','flt no 10, sagar shwas','union pk,',53,1,'maharashtra','india','400052','26462061','','','','','',43,'2008-12-09 14:20:34','2008-12-11 09:31:10',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (49,'Jeetu Real Estate','522,corporate ctr lbs road','union pk,',7,1,'maharashtra','india','080','2560333','','','','','',48,'2008-12-09 15:04:08','2008-12-10 09:19:12',NULL,NULL,NULL,NULL,1,'',1,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (50,'Jeetandra Real Estate','115 sheri devji ','Akruti Raod ',7,1,'Maharashtra','','23322233','022-5454545','022-6537463','022-6624586','8743892@4756.sjdhf','83489234','',48,'2008-12-09 15:10:04','2008-12-10 09:17:19',NULL,NULL,NULL,NULL,1,'',1,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (53,'Micronics Services','5/6 Gaswala Building','Naigaon Cross Road',7,1,'','','400014','(91)-(22)-24184089','','','','Mr Pragnesh Desai,Mr Ravindra Mayya','',25,'2008-12-10 13:49:06','2008-12-11 09:31:10',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (54,'Avera Academy','1st Flr, Winsway Complex,','Opp Railway Station, Vaibhav Restaurant, Old Police Lane,',7,1,'','','400069','(91)-(22)-67689136','','','','Mr Shadab Khan,Mr Anand Pandit','',25,'2008-12-10 14:25:47','2008-12-11 09:31:10',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (55,'Safe Tech Business Solution','Tally Academy','Opp Railway Station, Vaibhav Restaurant, Old Police Lane,',36,1,'','','401501','999777787','','','tally-academy@gmail.com  ','Mr Abhijit Joshi,Ms Ruchita Bhanushali','',25,'2008-12-10 14:31:46','2008-12-11 10:04:18',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (56,'mac Computer Institute ','2/A/B Sharma Compound','Opp HDFC Loan Bank Opp Chinai College',11,1,'','','400069','','','','','Mr Parveen Khan','',25,'2008-12-10 14:35:07','2008-12-24 08:52:33',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,1,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (57,'Animz The Creation Hub','Block No Nagardas Park, Opp To Mvlu College','Nagardas Road, Andheri e',11,1,'','','400069','','','','','Mr Hitesh Wala','',25,'2008-12-10 14:39:12','2008-12-10 14:39:12',NULL,NULL,NULL,NULL,0,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (58,'Knack Education 	','Room No 8,Bhatt Compound, Behind Chaaya Chana Shop,','Station Road, Goregaon W,',64,1,'','','400062','','','','','Mr Mihir Tendulkar,','',25,'2008-12-10 14:49:39','2008-12-12 09:39:46',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (59,'London Institute Of Technology & Research ','Andheri W, Mumbai','sector 34',12,1,'Maharashtra','India','400053','+(91)-(22)-67384505','','','litr@vsnl.net  ',' Mr Kaz','',25,'2008-12-10 15:37:35','2008-12-11 09:32:50',NULL,NULL,NULL,NULL,1,'',1,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (60,'Imac Computer Education  ','Vashi, Navi Mumbai, rec mon','pandurang wadi',7,1,'','','400703','+(91)-(22)-67384093','','','','Mr Moiz Hyderabwala','',25,'2008-12-10 15:42:19','2008-12-24 08:58:04',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (61,'Imac Computer Education    	','Vashi, Navi Mumbai','Vashi, Navi Mumbai',9,1,'','','400703 ','+(91)-(22)-67384093 ','','','','','',25,'2008-12-10 15:47:26','2008-12-10 15:47:26',NULL,NULL,NULL,NULL,0,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (62,'Karrox Technologies Ltd  ','701 Bhaveshwar Arcade 7th Floor','Opp Shreyas Cinema, Lbs Marg, Ghatkopar',7,1,'','','400086','','','','','','',25,'2008-12-10 15:51:29','2008-12-31 14:41:09',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (63,'Umesh Property Consultant','102, Plot No 5, Jublee Manzil,','Yari Rd, Versova',11,1,'Maharashtra','India','400061','+(91)-(22)-67384522','','','umesh_verma2005@yahoo.co.in  ','Mr Umesh','',48,'2008-12-12 07:16:41','2008-12-12 09:39:46',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (64,'Infinite Property Services','5 Iind Floor Rahimtoola House, ','7 Homji Street Sir P M Road,fort',42,1,'maharashtra','india','400001','+(91)-(22)-22661885','22632751,22632752','','propertyinmumbai@gmail.com  ','Mr Rohit Jain','',48,'2008-12-12 07:19:08','2008-12-12 09:39:46',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (65,'Raaj Pr0perties H O','Shop No 12 Viceroy Court,','Thakur Village,',65,1,'maharashtra','india','400101','+(91)-(22)-40164774','','','rajproperties2003@yahoo.co.in ','Mr Rajesh','',48,'2008-12-12 07:21:29','2008-12-12 09:39:46',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (66,'Mr Chandan Chaudhary','19 Heena Gaurave, Opp Maharaja Tower,','Filmcity Road,',63,1,'maharashtra','india','400063','+(91)-(22)-28427340','28424227','','','Mr Chandan Chaudhary','',48,'2008-12-12 07:23:30','2008-12-31 14:40:32',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (67,'Basera Estate Agency & Consultants','Office No 5 Roop Apartments, ','Bel Ruby Hospital, S V Road,',62,1,'maharashtra','india','400102','+(91)-(22)-26788888','26777777','','basera100@yahoo.co.in  ','Mr Azam Khan','',48,'2008-12-12 07:25:26','2008-12-31 14:32:33',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (68,'Dasmesh Homes ','House No 961/02, Opp Shiv Sena','Office Before ICICI Bank Ltd, Juhugaon,vashi',51,1,'maharashtra','india','400703 ','+(91)-(22)-65145423','27668045','','dasmeshhomes@yahoo.co.in ','Mr Avtar Singh','',48,'2008-12-12 07:30:08','2008-12-12 09:40:04',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (69,'Ndk Finance Consultant','Hse No 7,1st Flr Office No 1, ','Opp Post Office, S V Rd Gaothan Ln No 2, ',63,1,'maharashtra','india','400053','+(91)-(22)-67303772','','','ndkfinance@yahoo.com  ','Mr Vishwanath','',48,'2008-12-12 07:31:44','2008-12-12 09:40:04',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (70,'Jain Investments','4 Kamal Kunj Walkman Tailor Bldg, ','Juhu Scheme, Rd No 4, ',59,1,'maharashtra','india','400056','+(91)-(22)-67306026','','','afj1103@yahoo.co.in','Mr Amit Jain','',42,'2008-12-12 07:33:30','2008-12-12 09:40:04',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (71,'Rani Sati Consultancy','A/704 Vasant Sarita,','Thakur Complex, 90 Feet Road, ',7,1,'maharashtra','india','400101','+(91)-(22)-67731750','','','ngmodi@gmail.com ','Mr Nitin Modi','',42,'2008-12-12 07:36:26','2008-12-12 09:40:04',NULL,NULL,NULL,NULL,1,'',0,0,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (72,'Armani','999 Chandani Chauk','Andheri',11,1,'Maharashtra','India','400059','022-5454545','022-6537463','022-6624586','','Srikanth ','',2,'2008-12-24 06:30:55','2008-12-24 06:30:55',NULL,NULL,NULL,NULL,1,'',1,1,NULL,0,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (73,'New Kesler Engineering','12-A Steel Made','Morol',11,1,'','','400059','','','','','','',28,'2008-12-31 12:21:53','2008-12-31 12:21:53',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,11,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (74,'Dinesh mens wear','2/A/B Sharma Compound','Mulund',9,1,'Maharashtra','India','23322233','+(91)-(22)-67384093','022-6537463','022-6624586','','Mr Moiz Hyderabwala','Thjd kjdfk fkdfjk djd kfjdf kjf kfj kfjkfdj ',23,'2008-12-31 12:31:13','2008-12-31 12:34:22',NULL,NULL,NULL,NULL,1,'',0,0,11,NULL,NULL,0,NULL,NULL,0,'',NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (75,'Drashti Enterprises  ','201 Acme Shopping Arcade, Sona Talkies Compound, ','Trikamdas Road',7,1,'Maharashtra','India','400067','(22)-67307452','(22)-28074885','','','Mr Jayntilal Shethia,Mr Bharat Savla','',45,'2009-01-05 11:37:55','2009-01-05 11:37:55',NULL,NULL,NULL,NULL,0,'',0,0,11,NULL,NULL,0,NULL,NULL,0,'',NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (76,'J P Developers','99 Radha Niwas, Nr Janta Sahakari Bank,','P M Road North,',7,1,'Maharashtra','India','400057','(22)-26118389','26118404','','','Mr Jignesh Mehta','',45,'2009-01-05 11:44:44','2009-01-05 11:44:44',NULL,NULL,NULL,NULL,0,'',0,0,11,NULL,NULL,0,NULL,NULL,0,'',NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (77,' Shree Ahuja Properties Pvt Ltd  ','frsvgtrvg','Borivali (W)',66,1,'Maharashtra','India','400091','(22)-67733451','','','','Mr Sunil','',45,'2009-01-05 11:48:54','2009-01-06 11:03:20',NULL,NULL,NULL,NULL,0,'',0,1,11,NULL,NULL,0,'2009-01-05','2009-01-05',0,'','2009-01-06','2009-01-06','2008-05-11','2009-01-20');
INSERT INTO companies VALUES (78,'Yashraj Properties Estate Consultant & Developers ','Off.no. 101, Siddheshwar Appt, L.t.nagar, Next To Raghuleela Mall, Poinser Gymkhana Road,','Kandivili W,',65,1,'Maharashtra','India','400067','(22)-67309634','','','','','',45,'2009-01-05 11:51:08','2009-01-05 11:51:08',NULL,NULL,NULL,NULL,0,'',0,0,11,NULL,NULL,0,NULL,NULL,0,'',NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (79,'Body Line Creations/Saba Const Pvt Ltd/Al Ghaibat','A/402 Punch Natraj Bldg, Off Yari Rd,','Andheri W,',12,1,'Maharashtra','India','400053','(22)-67305939','','','','','',45,'2009-01-05 11:53:06','2009-01-05 11:53:06',NULL,NULL,NULL,NULL,0,'',0,0,11,NULL,NULL,0,NULL,NULL,0,'',NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (80,'Royal Palms India Pvt Ltd  ','169 Aarey Milk Colony, ','Goregaon E,',63,1,'Maharashtra','India','400065','(22)-66824192','','','','Mr Gladwyn Fernandes','',45,'2009-01-05 11:56:33','2009-01-05 11:56:33',NULL,NULL,NULL,NULL,0,'',0,0,11,NULL,NULL,0,NULL,NULL,0,'',NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (81,'Coppergate Consultants','618 Marathon Max, Opp Nirmal Lifestyle, Link Road Junction,','Mulund W,',10,1,'Maharashtra','India','400080','(22)-25681136','25691136','','','Mr Arnav Agrawal','',45,'2009-01-05 12:02:06','2009-01-05 12:02:06',NULL,NULL,NULL,NULL,0,'',0,0,11,NULL,NULL,0,NULL,NULL,0,'',NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (82,'Xnals Technologies India Ltd  ','21/3 Ramvadi Building, Near Ruparel College F Gate, Senapati Bapat Marg, ','Matunga',49,1,'Maharashtra','India','400019','(22)-67731790','','','','Mr Khushman Shah','',45,'2009-01-05 12:05:18','2009-01-05 12:05:18',NULL,NULL,NULL,NULL,0,'',0,0,11,NULL,NULL,0,NULL,NULL,0,'',NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (83,'Nakk Placements','239-A Pragati Indl Estate, N M Joshi Marg','Lower Parel',45,1,'Maharashtra','India','400013','(22)-67733186','','','','Mr Amith Bathija','',45,'2009-01-05 12:07:22','2009-01-05 12:07:22',NULL,NULL,NULL,NULL,0,'',0,0,11,NULL,NULL,0,NULL,NULL,0,'',NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (84,'Kou Chan Knowledge Convergence Pvt Ltd H O','Jai Gangeshwar Society, Nr Vrindavan Hotel,','3rd Rd, Khar',53,1,'Maharashtra','India','400052','(22)-26483223','26462875','','','Mr N S Bilgi','',45,'2009-01-05 12:10:04','2009-01-05 12:10:04',NULL,NULL,NULL,NULL,0,'',0,0,11,NULL,NULL,0,NULL,NULL,0,'',NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (85,'K10 Technologies India Ltd','E/603,Crystal Plaza, Opp Fame Adlabs','Andheri Link Road,',12,1,'Maharashtra','India','400053','(22)-26733504','26733505','','','Ms Raisa Tolia,Mr Mrs Mita Tolia','',45,'2009-01-05 12:12:43','2009-01-05 12:12:43',NULL,NULL,NULL,NULL,0,'',0,0,11,NULL,NULL,0,NULL,NULL,0,'',NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (86,'Ticket World','Pearl Heaven, 86 Chapel Road','Bandra W, ',55,1,'Maharashtra','India','400050','(22)-67305786','','','','Mr Sultan J Virani','',45,'2009-01-05 12:19:52','2009-01-05 12:19:52',NULL,NULL,NULL,NULL,0,'',0,0,11,NULL,NULL,0,NULL,NULL,0,'',NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (87,'Kou Chan Knowledge Convergence Pvt Ltd','	Jai Gangeshwar Society, Nr Vrindavan Hotel','3rd Rd, Khar',53,1,'Maharashtra','India','400052','(22)-26483223','26462875','','','Mr N S Bilgi','',45,'2009-01-05 12:22:24','2009-01-05 12:22:24',NULL,NULL,NULL,NULL,0,'',0,0,11,NULL,NULL,0,NULL,NULL,0,'',NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (88,'Epic Tuition Centre Alphomega Services','B/205 Vishnu Apts, Near Bhabhai Naka,','Lokmanya Tilak Road',66,1,'Maharashtra','India','400091','(22)-67305968','','','','Mr Mangesh C Vahalia','',45,'2009-01-05 12:24:44','2009-01-05 12:24:44',NULL,NULL,NULL,NULL,0,'',0,0,11,NULL,NULL,0,NULL,NULL,0,'',NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (89,'Doshi Consultants','C/38 Jaya Apts, Opp Santoshi Mata Mandir','M G Rd, Kandivili W',65,1,'Maharashtra','India','400067','(22)-28623761','','','','Mr Vishal Doshi','',45,'2009-01-05 12:28:50','2009-01-05 12:28:50',NULL,NULL,NULL,NULL,0,'',0,0,11,NULL,NULL,0,NULL,NULL,0,'',NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (90,'B S Shah & Co','203,Crystal Tower,, Off M V Road, 75','Gundavli Road No 3',11,1,'Maharashtra','India','400072','(22)-26848082','26848083','','','Mr Hiten Paurana,Ms Varsha','',45,'2009-01-05 12:31:54','2009-01-05 12:31:54',NULL,NULL,NULL,NULL,0,'',0,0,11,NULL,NULL,0,NULL,NULL,0,'',NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (91,' Intrex India','602 Jai Amba Chs, New Juhu Nr HDFC Bank','Versova Link Road',12,1,'Maharashtra','India','400053','(22)-26333001','','','','','',45,'2009-01-05 12:34:36','2009-01-06 11:01:33',NULL,NULL,NULL,NULL,0,'',0,1,11,NULL,NULL,0,'2009-01-05','2009-01-05',0,'','2009-01-06','2009-01-06','2009-01-06','2009-01-06');
INSERT INTO companies VALUES (92,'Marcus Evans Hindustan Pvt Ltd  ','Level 4, Rushabh Chambers, Near Marol Fire Brigade, Maro','Makwana Road, Andheri E',11,1,'Maharashtra','India','400072','(22)-66425000','','','','Mr Sachin,Mr Sagar Mushrif(Sales Director)','',45,'2009-01-05 12:36:53','2009-01-05 12:36:53',NULL,NULL,NULL,NULL,0,'',0,0,11,NULL,NULL,0,NULL,NULL,0,'',NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (93,'Ecs Ltd','401-408,Crystal Plaza,\"a\" Wing, Near Hyundai Santro Showroom','New Link Road, Andheri W,',12,1,'Maharashtra','India','400058','(22)-66902326','66902327','','','Ms Hazel Ferreira','',45,'2009-01-05 12:38:59','2009-01-05 12:38:59',NULL,NULL,NULL,NULL,0,'',0,0,11,NULL,NULL,0,NULL,NULL,0,'',NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (94,' Alamdar Enterprises','1 A Satkar Soociety,','Opp B M C A\\Market, 5th Road,',53,1,'maharashtra','india','400052','(91)-(22)-26495684','(91)-9820084391','','','Mr Hatim/Mr Firoz','',25,'2009-01-07 09:28:54','2009-01-07 09:28:54',NULL,NULL,NULL,NULL,0,'',0,0,NULL,NULL,NULL,0,NULL,NULL,0,'',NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (95,'Gayatri Traders','4 Bunglow Mansion,','Near Hsbc, J P Road',7,1,'maharashtra','india','400053','(91)-(22)-26320231','26353190','(91)-(22)-26327576','gayatritraders@vsnl.net  ','Mr Jayesh Patel/Mr Vinod Patel','',25,'2009-01-07 09:31:29','2009-01-07 09:31:29',NULL,NULL,NULL,NULL,0,'',0,0,NULL,NULL,NULL,0,NULL,NULL,0,'www.gayatriglass.com',NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (96,'Ambika Glass','Shop No 3 Natraj, ','Opp Railway Crossing, 34 V P Road',59,1,'maharashtra','india','400056','(91)-(22)-26131325','26131326','(91)-(22)-26131326','','Mr Valji Patel,Mr Ramesh Patel','',25,'2009-01-07 09:33:27','2009-01-07 09:33:27',NULL,NULL,NULL,NULL,0,'',0,0,NULL,NULL,NULL,0,NULL,NULL,0,'',NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (97,'Babu Glass Art','Shop No 12/31 Daruwala Cmpd','Opp Ramchandra Lane, S V Road',22,1,'maharashtra','india','400064','(91)-(22)-28662502','9892027168','','','Mr Ali Hasan','',25,'2009-01-07 09:35:43','2009-01-07 09:35:43',NULL,NULL,NULL,NULL,0,'',0,0,NULL,NULL,NULL,0,NULL,NULL,0,'',NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (98,'Shiv Glass House','Shop No 12/24',' Opp Marve Rd Junction, S V Rd,',22,1,'maharashtra','india','400064','(91)-(22)-28074570','','','','Mr Sandeep','',25,'2009-01-07 09:37:31','2009-01-07 09:37:31',NULL,NULL,NULL,NULL,0,'',0,0,NULL,NULL,NULL,0,NULL,NULL,0,'',NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (99,'Kantilal R Teraiya','Room No 11/12 Antony P Dsouza Chawl','Chandivili Post Sakinaka',11,1,'maharashtra','india','400072','(91)-(22)-28576025','28572086','(91)-(22)-28576025','','Mr Anil','',25,'2009-01-07 09:40:35','2009-01-07 09:40:35',NULL,NULL,NULL,NULL,0,'',0,0,NULL,NULL,NULL,0,NULL,NULL,0,'',NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (100,'Bharat Machinery & Spares','58/59, Near Kohinoor Continental J B Nagar,','Andheri Kurla Road,',11,1,'maharashtra','india','400059','(91)-(22)-28373039','','','bharat_machinery@vsnl.net  ','Mr Rakesh Shah','',25,'2009-01-07 09:43:11','2009-01-07 09:43:11',NULL,NULL,NULL,NULL,0,'',0,0,NULL,NULL,NULL,0,NULL,NULL,0,'',NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (101,'Indmark','A/2 Yogi Smruti ','9/10 Park Road',60,1,'maharashtra','india','400057','(91)-(22)-26140313','26175038','(91)-(22)-26115373','info@indmark.net  ','Mr Sanjiv Kamat,Mr Ravi Atahnikar','',25,'2009-01-07 09:49:33','2009-01-07 09:49:33',NULL,NULL,NULL,NULL,0,'',0,0,NULL,NULL,NULL,0,NULL,NULL,0,'',NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (102,'Arihant Air Conditioners Pvt Ltd','136 Shanti Industrial Estate,','Near Tambe Nagar, S N Road',10,1,'maharashtra','india','400080','(91)-(22)-32917008','25916803','(91)-(22)-25916803','manishgandhi@hotmail.com  ','Mr Manish Gandhi','',46,'2009-01-07 09:52:59','2009-01-07 09:52:59',NULL,NULL,NULL,NULL,0,'',0,0,NULL,NULL,NULL,0,NULL,NULL,0,'',NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (103,'Aircon Engineers','78/A Govt Ind Est','Charkop',65,1,'maharashtra','india','400067','(91)-(22)-32946595','','(91)-(22)-28014593','aircon1@rediffmail.com  ','Mr Dinesh Mehta','',25,'2009-01-07 09:56:14','2009-01-07 09:56:14',NULL,NULL,NULL,NULL,0,'',0,0,NULL,NULL,NULL,0,NULL,NULL,0,'',NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (104,'Blow Cool','Shop No 2 Suvarna Kailash',' Nr Suresha Hotel, Tarun Bharat Soc',11,1,'maharashtra','india','400099','(91)-(22)-28210419','28349986','','blowcool@lycos.com  ','Mr Sarto Pereira','',25,'2009-01-07 09:58:30','2009-01-07 09:58:30',NULL,NULL,NULL,NULL,0,'',0,0,NULL,NULL,NULL,0,NULL,NULL,0,'',NULL,NULL,NULL,NULL);
INSERT INTO companies VALUES (105,'Haier Appliances India Pvt Ltd','302 Town Centre','Near Mittal Industrial Estate, Andheri Kurla Road',11,1,'maharashtra','india','400072','(91)-(22)-66433053','66490447','','','Mr Satyajeet Banerjee','',25,'2009-01-07 10:00:55','2009-01-07 10:00:55',NULL,NULL,NULL,NULL,0,'',0,0,NULL,NULL,NULL,0,NULL,NULL,0,'http://www.haierindia.com',NULL,NULL,NULL,NULL);

#
# Table structure for table 'images'
#

# DROP TABLE IF EXISTS images;
CREATE TABLE `images` (
  `id` int(11) NOT NULL auto_increment,
  `asset_id` int(11) default NULL,
  `asset_type` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `ad_file_name` varchar(255) default NULL,
  `ad_content_type` varchar(255) default NULL,
  `ad_file_size` int(11) default NULL,
  `ad_updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_images_on_asset_id` (`asset_id`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=latin1;

#
# Dumping data for table 'images'
#

INSERT INTO images VALUES (193,42,'Company','2008-12-29 13:09:44','2008-12-29 13:09:44','070.jpg','image/jpeg',54435,'2008-12-29 18:39:43');
INSERT INTO images VALUES (195,91,'Company','2009-01-05 13:18:05','2009-01-05 13:18:05','ganesh06.jpg','image/jpeg',45684,'2009-01-05 18:48:04');
INSERT INTO images VALUES (196,77,'Company','2009-01-05 13:22:34','2009-01-05 13:22:34','Ganesh05.jpg','image/jpeg',107966,'2009-01-05 18:52:34');
INSERT INTO images VALUES (197,77,'Company','2009-01-05 13:24:10','2009-01-05 13:24:10','Ganesh05.jpg','image/jpeg',107966,'2009-01-05 18:54:09');
INSERT INTO images VALUES (198,77,'Company','2009-01-05 13:25:40','2009-01-05 13:25:40','Ganesh05.jpg','image/jpeg',107966,'2009-01-05 18:55:39');

#
# Table structure for table 'localities'
#

# DROP TABLE IF EXISTS localities;
CREATE TABLE `localities` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `city_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_localities_on_city_id` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

#
# Dumping data for table 'localities'
#

INSERT INTO localities VALUES (7,'Kurla (E)',1,'2008-11-12 11:48:23','2008-12-10 06:07:52');
INSERT INTO localities VALUES (8,'Kurla (W)',1,'2008-11-12 11:48:39','2008-12-10 06:08:06');
INSERT INTO localities VALUES (9,'MULUND EAST',1,'2008-11-12 11:48:59','2008-11-12 11:49:11');
INSERT INTO localities VALUES (10,'MULUND WEST',1,'2008-11-12 11:49:24','2008-11-12 11:49:24');
INSERT INTO localities VALUES (11,'Andheri (E)',1,'2008-11-12 11:49:38','2008-12-10 06:04:26');
INSERT INTO localities VALUES (12,'Andheri (W)',1,'2008-11-12 11:49:49','2008-12-10 06:04:42');
INSERT INTO localities VALUES (22,'MALAD',1,'2008-11-12 11:58:22','2008-11-12 12:04:08');
INSERT INTO localities VALUES (33,'Churchgate ',1,'2008-12-03 06:27:02','2008-12-03 06:27:02');
INSERT INTO localities VALUES (34,'Marine Lines (W) ',1,'2008-12-03 06:27:18','2008-12-03 06:27:18');
INSERT INTO localities VALUES (35,'Marine Lines (E) ',1,'2008-12-03 06:27:37','2008-12-03 06:27:37');
INSERT INTO localities VALUES (36,'Charni Road (W) ',1,'2008-12-03 06:27:50','2008-12-03 06:27:50');
INSERT INTO localities VALUES (37,'Charni Road (E) ',1,'2008-12-03 06:28:01','2008-12-03 06:28:01');
INSERT INTO localities VALUES (38,'Grant Road (W) ',1,'2008-12-03 06:28:12','2008-12-03 06:28:12');
INSERT INTO localities VALUES (39,'Grant Road (E) ',1,'2008-12-03 06:28:24','2008-12-03 06:28:24');
INSERT INTO localities VALUES (40,'Mumbai Central (W) ',1,'2008-12-03 06:31:25','2008-12-03 06:31:25');
INSERT INTO localities VALUES (41,'Mumbai Central (E) ',1,'2008-12-03 06:31:44','2008-12-03 06:31:44');
INSERT INTO localities VALUES (42,'Mahalaxmi (W) ',1,'2008-12-03 06:31:54','2008-12-03 06:31:54');
INSERT INTO localities VALUES (43,'Mahalaxmi (E) ',1,'2008-12-03 06:32:04','2008-12-03 06:32:04');
INSERT INTO localities VALUES (44,'Lower Parel (W) ',1,'2008-12-03 06:32:16','2008-12-03 06:32:16');
INSERT INTO localities VALUES (45,'Lower Parel (E) ',1,'2008-12-03 06:32:27','2008-12-03 06:32:27');
INSERT INTO localities VALUES (46,'Elphinston (E) ',1,'2008-12-03 06:32:37','2008-12-03 06:32:37');
INSERT INTO localities VALUES (47,'Elphinston (W) ',1,'2008-12-03 06:32:48','2008-12-03 06:32:48');
INSERT INTO localities VALUES (48,'Dadar (E) ',1,'2008-12-03 06:33:12','2008-12-03 06:33:12');
INSERT INTO localities VALUES (49,'Matunga (W) ',1,'2008-12-03 06:34:38','2008-12-03 06:34:38');
INSERT INTO localities VALUES (50,'Matunga (E) ',1,'2008-12-03 06:34:48','2008-12-03 06:34:48');
INSERT INTO localities VALUES (51,'Mahim (W) ',1,'2008-12-03 06:34:58','2008-12-03 06:34:58');
INSERT INTO localities VALUES (52,'Mahim (E) ',1,'2008-12-03 06:35:09','2008-12-03 06:35:09');
INSERT INTO localities VALUES (53,'Khar (W) ',1,'2008-12-03 06:35:20','2008-12-03 06:35:20');
INSERT INTO localities VALUES (54,'Khar (E) ',1,'2008-12-03 06:35:30','2008-12-03 06:35:30');
INSERT INTO localities VALUES (55,'Bandra (W) ',1,'2008-12-03 06:35:40','2008-12-03 06:35:40');
INSERT INTO localities VALUES (56,'Bandra (E) ',1,'2008-12-03 06:35:50','2008-12-03 06:35:50');
INSERT INTO localities VALUES (57,'Santacruz (W) ',1,'2008-12-03 06:36:00','2008-12-03 06:36:00');
INSERT INTO localities VALUES (58,'Santacruz (E) ',1,'2008-12-03 06:36:10','2008-12-03 06:36:10');
INSERT INTO localities VALUES (59,'Vile Parle west ',1,'2008-12-03 06:36:24','2008-12-03 06:36:24');
INSERT INTO localities VALUES (60,'Vile Parle East ',1,'2008-12-03 06:36:35','2008-12-03 06:36:35');
INSERT INTO localities VALUES (61,'Jogeshwari (E) ',1,'2008-12-03 06:40:00','2008-12-10 06:07:04');
INSERT INTO localities VALUES (62,'Jogeshwari (W) ',1,'2008-12-03 06:40:14','2008-12-10 06:07:18');
INSERT INTO localities VALUES (63,'Goregaon (E) ',1,'2008-12-03 06:40:30','2008-12-10 06:05:24');
INSERT INTO localities VALUES (64,'Goregaon (W) ',1,'2008-12-03 06:40:42','2008-12-10 06:05:40');
INSERT INTO localities VALUES (65,'Kandivali (W) ',1,'2008-12-03 06:41:12','2008-12-10 06:07:32');
INSERT INTO localities VALUES (66,'Borivali (W) ',1,'2008-12-03 06:41:23','2008-12-10 06:05:09');
INSERT INTO localities VALUES (67,'Borivali (E) ',1,'2008-12-03 06:41:47','2008-12-10 06:04:56');
INSERT INTO localities VALUES (68,'Dadar (W) ',1,'2008-12-10 08:33:53','2008-12-10 08:33:53');

#
# Table structure for table 'open_id_authentication_associations'
#

# DROP TABLE IF EXISTS open_id_authentication_associations;
CREATE TABLE `open_id_authentication_associations` (
  `id` int(11) NOT NULL auto_increment,
  `issued` int(11) default NULL,
  `lifetime` int(11) default NULL,
  `handle` varchar(255) default NULL,
  `assoc_type` varchar(255) default NULL,
  `server_url` blob,
  `secret` blob,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Dumping data for table 'open_id_authentication_associations'
#


#
# Table structure for table 'open_id_authentication_nonces'
#

# DROP TABLE IF EXISTS open_id_authentication_nonces;
CREATE TABLE `open_id_authentication_nonces` (
  `id` int(11) NOT NULL auto_increment,
  `timestamp` int(11) NOT NULL,
  `server_url` varchar(255) default NULL,
  `salt` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Dumping data for table 'open_id_authentication_nonces'
#


#
# Table structure for table 'profiles'
#

# DROP TABLE IF EXISTS profiles;
CREATE TABLE `profiles` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `real_name` varchar(255) default NULL,
  `location` varchar(255) default NULL,
  `website` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

#
# Dumping data for table 'profiles'
#

INSERT INTO profiles VALUES (1,1,'srikanth vishwamitra','mumbai','www.econify.com','2008-11-10 10:40:30','2008-12-10 06:51:43');
INSERT INTO profiles VALUES (2,9,NULL,NULL,NULL,'2008-12-05 07:01:53','2008-12-05 07:01:53');
INSERT INTO profiles VALUES (3,10,NULL,NULL,NULL,'2008-12-12 12:37:55','2008-12-12 12:37:55');
INSERT INTO profiles VALUES (4,11,NULL,NULL,NULL,'2008-12-16 05:55:05','2008-12-16 05:55:05');
INSERT INTO profiles VALUES (5,12,NULL,NULL,NULL,'2009-01-05 10:00:58','2009-01-05 10:00:58');
INSERT INTO profiles VALUES (6,13,NULL,NULL,NULL,'2009-01-07 13:44:10','2009-01-07 13:44:10');
INSERT INTO profiles VALUES (7,14,NULL,NULL,NULL,'2009-01-07 13:59:23','2009-01-07 13:59:23');
INSERT INTO profiles VALUES (8,15,NULL,NULL,NULL,'2009-01-07 14:06:25','2009-01-07 14:06:25');
INSERT INTO profiles VALUES (9,16,NULL,NULL,NULL,'2009-01-07 14:10:01','2009-01-07 14:10:01');
INSERT INTO profiles VALUES (10,17,NULL,NULL,NULL,'2009-01-07 14:12:02','2009-01-07 14:12:02');
INSERT INTO profiles VALUES (11,18,NULL,NULL,NULL,'2009-01-07 14:13:21','2009-01-07 14:13:21');
INSERT INTO profiles VALUES (12,19,NULL,NULL,NULL,'2009-01-07 14:16:51','2009-01-07 14:16:51');
INSERT INTO profiles VALUES (13,20,NULL,NULL,NULL,'2009-01-07 14:17:43','2009-01-07 14:17:43');
INSERT INTO profiles VALUES (14,21,NULL,NULL,NULL,'2009-01-07 14:18:19','2009-01-07 14:18:19');
INSERT INTO profiles VALUES (15,22,NULL,NULL,NULL,'2009-01-07 14:21:07','2009-01-07 14:21:07');
INSERT INTO profiles VALUES (16,23,NULL,NULL,NULL,'2009-01-07 14:21:43','2009-01-07 14:21:43');

#
# Table structure for table 'rates'
#

# DROP TABLE IF EXISTS rates;
CREATE TABLE `rates` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `rateable_id` int(11) default NULL,
  `rateable_type` varchar(255) default NULL,
  `stars` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_rates_on_user_id` (`user_id`),
  KEY `index_rates_on_rateable_id` (`rateable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

#
# Dumping data for table 'rates'
#

INSERT INTO rates VALUES (1,11,15,'Company',3,'2008-12-24 10:13:08','2008-12-24 10:13:08');
INSERT INTO rates VALUES (2,11,32,'Company',3,'2008-12-24 10:56:48','2008-12-24 10:56:48');
INSERT INTO rates VALUES (3,11,24,'Company',2,'2008-12-24 10:57:05','2008-12-24 10:57:05');
INSERT INTO rates VALUES (4,11,10,'Company',5,'2008-12-24 10:57:20','2008-12-24 10:57:32');
INSERT INTO rates VALUES (5,11,54,'Company',2,'2008-12-24 10:58:02','2008-12-24 10:58:02');
INSERT INTO rates VALUES (6,11,25,'Company',2,'2008-12-24 11:19:09','2008-12-24 11:19:09');

#
# Table structure for table 'reviews'
#

# DROP TABLE IF EXISTS reviews;
CREATE TABLE `reviews` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `comment` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `company_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `approved` tinyint(1) default '0',
  `review_ad_file_name` varchar(255) default NULL,
  `review_ad_content_type` varchar(255) default NULL,
  `review_ad_file_size` int(11) default NULL,
  `review_ad_updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Dumping data for table 'reviews'
#

INSERT INTO reviews VALUES (1,'supriya surve','supriya@econify.com','Authentic products and extremely professional. spectacular after sales service. very quick response to my enquiries.','2008-12-24 11:06:43','2008-12-24 11:07:48',25,11,1,NULL,NULL,NULL,NULL);
INSERT INTO reviews VALUES (2,'sachin naik','sn@econify.com','The services of this company is very slow & even they don`t know how handle a customer. So my experience with this company was disgusting','2008-12-24 11:32:13','2008-12-24 11:32:13',25,11,0,NULL,NULL,NULL,NULL);

#
# Table structure for table 'roles'
#

# DROP TABLE IF EXISTS roles;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Dumping data for table 'roles'
#

INSERT INTO roles VALUES (1,'admin');

#
# Table structure for table 'roles_users'
#

# DROP TABLE IF EXISTS roles_users;
CREATE TABLE `roles_users` (
  `role_id` int(11) default NULL,
  `user_id` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Dumping data for table 'roles_users'
#

INSERT INTO roles_users VALUES (1,1);
INSERT INTO roles_users VALUES (1,10);
INSERT INTO roles_users VALUES (1,11);

#
# Table structure for table 'schema_migrations'
#

# DROP TABLE IF EXISTS schema_migrations;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Dumping data for table 'schema_migrations'
#

INSERT INTO schema_migrations VALUES ('20081023115224');
INSERT INTO schema_migrations VALUES ('20081031115859');
INSERT INTO schema_migrations VALUES ('20081103135115');
INSERT INTO schema_migrations VALUES ('20081104101225');
INSERT INTO schema_migrations VALUES ('20081104114712');
INSERT INTO schema_migrations VALUES ('20081104124556');
INSERT INTO schema_migrations VALUES ('20081105101413');
INSERT INTO schema_migrations VALUES ('20081110085054');
INSERT INTO schema_migrations VALUES ('20081112053710');
INSERT INTO schema_migrations VALUES ('20081113110703');
INSERT INTO schema_migrations VALUES ('20081113112657');
INSERT INTO schema_migrations VALUES ('20081114123502');
INSERT INTO schema_migrations VALUES ('20081117123019');
INSERT INTO schema_migrations VALUES ('20081119130525');
INSERT INTO schema_migrations VALUES ('20081124090330');
INSERT INTO schema_migrations VALUES ('20081124094607');
INSERT INTO schema_migrations VALUES ('20081128093500');
INSERT INTO schema_migrations VALUES ('20081128094340');
INSERT INTO schema_migrations VALUES ('20081204081610');
INSERT INTO schema_migrations VALUES ('20081204105237');
INSERT INTO schema_migrations VALUES ('20081205063804');
INSERT INTO schema_migrations VALUES ('20081205145133');
INSERT INTO schema_migrations VALUES ('20081208130019');
INSERT INTO schema_migrations VALUES ('20081209083340');
INSERT INTO schema_migrations VALUES ('20081211092604');
INSERT INTO schema_migrations VALUES ('20081215074028');
INSERT INTO schema_migrations VALUES ('20081215095051');
INSERT INTO schema_migrations VALUES ('20081217131333');
INSERT INTO schema_migrations VALUES ('20081222125219');
INSERT INTO schema_migrations VALUES ('20081222143134');
INSERT INTO schema_migrations VALUES ('20081223082735');
INSERT INTO schema_migrations VALUES ('20081226115224');
INSERT INTO schema_migrations VALUES ('20081231062936');
INSERT INTO schema_migrations VALUES ('20090102092221');
INSERT INTO schema_migrations VALUES ('20090105101027');

#
# Table structure for table 'settings'
#

# DROP TABLE IF EXISTS settings;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL auto_increment,
  `label` varchar(255) default NULL,
  `identifier` varchar(255) default NULL,
  `description` text,
  `field_type` varchar(255) default 'string',
  `value` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

#
# Dumping data for table 'settings'
#

INSERT INTO settings VALUES (1,'Site Name','site_name',NULL,'string','Econify Infotech','2008-11-10 10:41:00','2008-11-10 10:41:00');
INSERT INTO settings VALUES (2,'Company Name','company_name',NULL,'string','Econify Infotech','2008-11-10 10:41:00','2008-11-10 10:41:00');
INSERT INTO settings VALUES (3,'Site Url','site_url',NULL,'string','http://www.econify.com','2008-11-10 10:41:00','2008-12-11 10:33:10');
INSERT INTO settings VALUES (4,'Support Name','support_name',NULL,'string','Econify Infotech','2008-11-10 10:41:00','2008-11-10 10:41:00');
INSERT INTO settings VALUES (5,'Support Email','support_email',NULL,'string','Econify Infotech','2008-11-10 10:41:00','2008-11-10 10:41:00');

#
# Table structure for table 'taggings'
#

# DROP TABLE IF EXISTS taggings;
CREATE TABLE `taggings` (
  `id` int(11) NOT NULL auto_increment,
  `tag_id` int(11) default NULL,
  `taggable_id` int(11) default NULL,
  `tagger_id` int(11) default NULL,
  `tagger_type` varchar(255) default NULL,
  `taggable_type` varchar(255) default NULL,
  `context` varchar(255) default NULL,
  `created_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_taggings_on_tag_id` (`tag_id`),
  KEY `index_taggings_on_taggable_id_and_taggable_type_and_context` (`taggable_id`,`taggable_type`,`context`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

#
# Dumping data for table 'taggings'
#

INSERT INTO taggings VALUES (11,4,1,NULL,NULL,'Company','tags','2008-11-12 12:07:33');
INSERT INTO taggings VALUES (12,5,1,NULL,NULL,'Company','tags','2008-11-12 12:07:33');
INSERT INTO taggings VALUES (13,4,2,NULL,NULL,'Company','tags','2008-11-12 12:08:23');
INSERT INTO taggings VALUES (14,5,2,NULL,NULL,'Company','tags','2008-11-12 12:08:23');
INSERT INTO taggings VALUES (15,6,3,NULL,NULL,'Company','tags','2008-11-12 14:38:10');
INSERT INTO taggings VALUES (16,7,3,NULL,NULL,'Company','tags','2008-11-12 14:38:10');
INSERT INTO taggings VALUES (17,8,4,NULL,NULL,'Company','tags','2008-11-12 14:40:31');
INSERT INTO taggings VALUES (18,9,4,NULL,NULL,'Company','tags','2008-11-12 14:40:31');
INSERT INTO taggings VALUES (19,10,5,NULL,NULL,'Company','tags','2008-11-12 14:42:34');
INSERT INTO taggings VALUES (20,11,6,NULL,NULL,'Company','tags','2008-11-12 14:44:19');
INSERT INTO taggings VALUES (21,12,7,NULL,NULL,'Company','tags','2008-11-12 14:46:22');
INSERT INTO taggings VALUES (22,13,8,NULL,NULL,'Company','tags','2008-11-12 14:48:12');
INSERT INTO taggings VALUES (23,14,9,NULL,NULL,'Company','tags','2008-11-12 14:50:31');
INSERT INTO taggings VALUES (24,15,10,NULL,NULL,'Company','tags','2008-11-12 14:52:23');
INSERT INTO taggings VALUES (26,17,12,NULL,NULL,'Company','tags','2008-11-13 10:08:29');
INSERT INTO taggings VALUES (27,18,13,NULL,NULL,'Company','tags','2008-11-13 10:13:33');

#
# Table structure for table 'tags'
#

# DROP TABLE IF EXISTS tags;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

#
# Dumping data for table 'tags'
#

INSERT INTO tags VALUES (1,'air cargo');
INSERT INTO tags VALUES (2,'construction');
INSERT INTO tags VALUES (3,'gardening');
INSERT INTO tags VALUES (4,'Diamond Dealer');
INSERT INTO tags VALUES (5,'Diamond Exporter');
INSERT INTO tags VALUES (6,'AC Dealer');
INSERT INTO tags VALUES (7,'AC Exporter');
INSERT INTO tags VALUES (8,'Acid Manufacturer');
INSERT INTO tags VALUES (9,'Acid Supplier');
INSERT INTO tags VALUES (10,'Adapter Manufacturer and Supplier');
INSERT INTO tags VALUES (11,'Samsung TV Manufacturer and Supplier');
INSERT INTO tags VALUES (12,'CCTV Manufacturer');
INSERT INTO tags VALUES (13,'Computer Supplier and Manufacturer');
INSERT INTO tags VALUES (14,'Car Dealer');
INSERT INTO tags VALUES (15,'Binoculars Supplier and Dealer');
INSERT INTO tags VALUES (16,'control');
INSERT INTO tags VALUES (17,'tools');
INSERT INTO tags VALUES (18,'computers');

#
# Table structure for table 'users'
#

# DROP TABLE IF EXISTS users;
CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(40) default NULL,
  `identity_url` varchar(255) default NULL,
  `name` varchar(100) default '',
  `email` varchar(100) default NULL,
  `crypted_password` varchar(40) default NULL,
  `salt` varchar(40) default NULL,
  `remember_token` varchar(40) default NULL,
  `activation_code` varchar(40) default NULL,
  `state` varchar(255) default 'passive',
  `remember_token_expires_at` datetime default NULL,
  `password_reset_cod` varchar(255) default NULL,
  `activated_at` datetime default NULL,
  `deleted_at` datetime default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `avatar_file_name` varchar(255) default NULL,
  `avatar_content_type` varchar(255) default NULL,
  `avatar_file_size` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `index_users_on_login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

#
# Dumping data for table 'users'
#

INSERT INTO users VALUES (11,'admin',NULL,'','sv@mymail.my','3a8be2a37078a64538154656ce62b0402e0da8e7','7137f4350d7b9dc09134d4bcbfa26b09d77447d4',NULL,NULL,'passive',NULL,NULL,NULL,NULL,'2008-12-16 05:55:05','2008-12-16 05:55:05',NULL,NULL,NULL);
INSERT INTO users VALUES (12,'Sachin',NULL,'','sachin_nic@yahoo.com','a52cc9c69bc935d3ab0b62588bd478496b474839','d79f9cef1990c921407d5ce79ddaee5616c7862c',NULL,NULL,'passive',NULL,NULL,NULL,NULL,'2009-01-05 10:00:58','2009-01-05 10:00:58',NULL,NULL,NULL);
INSERT INTO users VALUES (23,'Supriya',NULL,'','sdn.2007@rediff.com','ba768b52ed0338efd13b98052e9aa3ab1c0429e5','7daddefa993467f99ef4ef530ce29cd50a7824a1',NULL,NULL,'passive',NULL,NULL,NULL,NULL,'2009-01-07 14:21:43','2009-01-07 14:21:43',NULL,NULL,NULL);

#
# Table structure for table 'videos'
#

# DROP TABLE IF EXISTS videos;
CREATE TABLE `videos` (
  `id` int(11) NOT NULL auto_increment,
  `asset_id` int(11) default NULL,
  `asset_type` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `video_file_name` varchar(255) default NULL,
  `video_content_type` varchar(255) default NULL,
  `video_file_size` int(11) default NULL,
  `video_updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_videos_on_asset_id` (`asset_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Dumping data for table 'videos'
#

INSERT INTO videos VALUES (1,91,'Company','2009-01-06 11:02:07','2009-01-06 11:02:07','Lal_baug.flv','video/x-flv',1455275,'2009-01-06 16:32:07');

