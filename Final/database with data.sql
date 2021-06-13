/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.19 : Database - bookmanagementsystem
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bookmanagementsystem` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `bookmanagementsystem`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `userName` varchar(25) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `admin` */

insert  into `admin`(`userName`,`password`) values ('admin','d033e22ae348aeb566fc214aec3585c4da997');

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `bookId` int NOT NULL AUTO_INCREMENT,
  `bookName` varchar(100) NOT NULL,
  `authorName` varchar(100) NOT NULL,
  `price` int NOT NULL,
  `bookCategory` varchar(10) NOT NULL,
  `available` int NOT NULL,
  `photo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`bookId`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `book` */

insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (26,'Web Technologies HTML, JavaScript, PHP, Java, JSP, ASP.NET and AJAX Black Book','Kogent Learning Solutions Inc.',727,'new',118,'new732609623.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (27,'JavaScript Modern Web Development','Alok Ranjan, Abhilasha Sinha, Ranjit Battewad',689,'new',222,'new117247437.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (28,'Mastering HTML, CSS & JavaScript Web Publishing','Laura Lemay, Rafe Colburn, Jennifer Kyrnin',495,'new',212,'new385075369.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (29,'HTML & CSS for Beginners','iCodeAcademy',1774,'new',50,'new590608439.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (30,'HTML & CSS Fifth Edition','Thomas A. Powell',680,'new',257,'new787618947.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (31,'JavaScript Programming Made Easy For Beginners And Intermediates','Craig Berg',823,'new',59,'new238244666.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (32,'HTML, CSS, JavaScript, jQuery Interactive front-end web development','Jon Duckett',3350,'new',49,'new735832635.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (33,'Object Oriented Programming with Angular','Balram Chavan',597,'new',51,'new233592831.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (34,'Beginning Angular with TypeScript updated to Angular 9','Greg Lim',1693,'new',59,'new112781206.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (35,'Node JS Guide Book','Dhruti Shah',269,'new',139,'new212396269.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (36,'Beginning Node.js, Express & MondoDB Development','Greg Lim',860,'new',99,'new219949225.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (37,'Node.js Web Development Fifth Edition','David Herron',2894,'new',51,'new287023881.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (38,'The Complete Reference MySQL','Vikram Vaswani',709,'new',64,'new130226002.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (39,'PHP and MySQL for Dynamic Web Sites Fourth Edition','Larry Ullman',360,'new',25,'new207868615.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (40,'Learn SQL with MySQL','Ashwin Pajankar',399,'new',100,'new646172600.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (41,'Fundamentals of Android App Development','Sujit Kumar Mishra',298,'new',100,'new574068156.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (42,'MondoDB in Action Second Edition','Kyle Banker, Pefer Bakkum, Shaun Verch, Douglas Garrett, Tim Hawkins',799,'new',100,'new785835620.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (43,'MondoDB The Definitive Guide Powerful and Scalable Data Storage','Shannon Bradshow, Eoin Brazil & Kristina Chodorow',2847,'new',49,'new372381579.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (44,'Android Studio 4.1 Development Essentials Kotlin Edition','Android Studio',4117,'new',100,'new775978619.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (45,'Android Studio Cookbook Design, debug and test your apps using Android Studio','Mike van Drongelen',2539,'new',119,'new534638828.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (46,'Beginning Flutter A hands On Guide To App Development','Macro L. Napoli',2351,'new',102,'new514526254.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (47,'MariaDB Crash Course','Ben Forta',3306,'new',90,'new696764730.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (48,'Practical PHP 7, MySQL 8, and MariaDB Website Databases','Adrian W.West, Steve Prettyman',1799,'new',120,'new200984722.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (49,'The Complete Reference PHP','Steven Holzner',349,'new',40,'new920303670.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (50,'PHP Web Development with Macromedia Dreamweaver MX 2004','Allan Kent and David Powers with Rachel Andrew',798,'new',90,'new670234900.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (51,'ASP.NET 4.5 (Covers C# and VB Codes) Black Book','Kogent Learning Solution Inc.',625,'new',100,'new652199521.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (52,'Programming ASP.NET Core','Dino Esposito',549,'new',90,'new982119963.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (53,'The Complete Reference ASP.NET','Matthew MacDonald',680,'new',110,'new571323672.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (54,'Learning with Python','Allen Downey, Jeffrey Elkner, Chris Meyers',333,'new',150,'new722396710.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (55,'Python for Data Science for Dummies 2nd Edition','John Paul Mueller',643,'new',179,'new413565907.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (56,'Machine Learning using Python','Manaranjan Pradhan | U Dinesh Kumar',512,'new',120,'new701729221.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (57,'Python for Data Science Handbook','Jake VanderPlas',1250,'new',90,'new218882808.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (58,'Python Core, Data Analysis, Machine Learning, Data Science','Tony Coding and Michael Smith',2703,'new',52,'new920871484.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (59,'Computer Science with python','Sumita Arora',525,'new',120,'new610652366.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (60,'Data Science Projects with Python','Stephen Klosterman',2159,'new',130,'new938295903.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (61,'Python Data Science Essentials Third Edition','Alberto Boschetti and Luca Massaron',2531,'new',120,'new898799647.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (62,'Machine Learning (in Python and R) for Dummies','John Paul Mueller, Luca Massaron',559,'new',250,'new114784685.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (63,'Artificial Intelligence with Python','Prateek Joshi',3304,'new',250,'new150550689.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (64,'Python Machine Learning By Example Third Edition','Yuxi (Hayden) Liu',2278,'new',100,'new781974213.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (65,'R for Everyone Second Edition','Jared P. Lander',503,'new',250,'new122906227.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (66,'R for Biginners','Sandip Rakshit',573,'new',52,'new866477603.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (67,'MATLAB an Introduction with Application Fourth Edition','Amos Gilat',529,'new',210,'new839452885.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (68,'MATLAB Programming for Engineers','Stephen J. Chapman',569,'new',150,'new534295987.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (69,'Computer NetWorking 6th Edition','James F. Kurose, Keith W. Ross',835,'new',120,'new875287631.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (70,'Cryptography and Network Security Seventh Edition','William Stallings',679,'new',150,'new818601789.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (71,'Computer Networks B.tech','V. S. Bagad and I. A. Dhotre',395,'new',220,'new633629709.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (72,'Software Engineering','Ian Sommerville',265,'new',250,'new843923463.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (73,'Software Engineering Principles and Applications','Tom Halt',11718,'new',260,'new782692864.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (74,'Head First Servlets & JSP Java Web Development','Bryan Bashan, Kathy Sierra & Bert Bates',2699,'new',250,'new672566147.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (75,'Beginning JSP, JSF and Tomcat Java Web Development Second Edition','Giulio Zambon',699,'new',190,'new145377831.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (76,'Building Websites with Django','Awanish Ranjan',498,'new',150,'new999938316.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (77,'Object Oriented Programming Using C++','SIA Publisher',179,'new',190,'new118324049.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (78,'Object Oriented Programming Using C++ and Java','E. Balagurusamy',480,'new',180,'new453385550.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (79,'Computer Graphics C version Second Edition','Donald D. Hearn | M. Pauline Baker',480,'new',220,'new409062066.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (80,'Computer Graphics with Virtual Reality Systems Third Edition','Rajesh K. Maurya',674,'new',160,'new490440954.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (81,'E-Business and E-Commerce Management Strategy, Implementation and Practice','Dave Chaffey',700,'new',110,'new746995421.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (82,'E-Commerce An Indian Perspective','P.T. Joseph, S.J.',476,'new',220,'new302820110.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (83,'Learning Genetic Algorithms with Python','Ivan Gridin',498,'new',250,'new986164989.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (84,'Data Structure and Algorithms Made Easy','Narasimha Karumanchi',618,'new',220,'new903853035.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (85,'Data Structures using C & C++ Second Edition','Yedidyah Langsam, Moshe J. Augenstein, Aaron M. Tenenbaum',632,'new',180,'new151771659.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (86,'Data Structure First Edition','Seymour Lipschutz',499,'new',150,'new970645575.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (87,'The Little Book Of Julia Algorithms','Ahan Sengupta, William Lau',874,'new',160,'new700928734.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (88,'Julia for Data Science','Anshul Joshi',3704,'new',218,'new581044729.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (89,'Julia 1.0 Programming Cookbook','Bogumit Kaminshi and Przemyslaw Szufel',2919,'new',218,'new630980077.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (90,'Java The Complete Reference Eleventh Edition','Herbert Schildt',780,'new',150,'new462957947.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (91,'The Complete Reference C++ Fourth Edition','Herbert Schildt',598,'new',250,'new427514705.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (92,'The C++ Programming Language Third Edition','Bjarne Stroustrup',852,'new',190,'new562693349.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (93,'Clean Code A Handbook of Agile Software Craftsmanship','Robert C. Martin',280,'new',152,'new286608636.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (94,'Let Up C++','Yashavant Kanetkar',399,'new',149,'new734366411.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (95,'Let Up C','Yashavant Kanetkar',299,'new',149,'new395613705.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (96,'Database Management System (DBMS) A practical approach','Dr. Rajiv Chopra',546,'new',190,'new429231018.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (97,'RDBMS In-Depth','Dr. Madhavi Vaidya',968,'new',150,'new651665134.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (98,'The Complete Reference C Fourth Edition','Herbert Schildt',498,'new',218,'new766658564.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (100,'Julia: High Performance Programming','Ivo Balbeart, Avik Sengupta, Malcolm Sherrington',3199,'new',149,'new600357495.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (102,'The Complete Reference C Fourth Edition','Herbert Schildt',250,'old',26,'old179009102.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (103,'Database Management System (DBMS)','Dr. Rajiv Chopra',220,'old',24,'old398855675.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (104,'Let Up C','Yashavant Kanetkar',100,'old',56,'new179284937.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (105,'Let Up C++','Yashavant Kanetkar',110,'old',50,'old607858497.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (106,'The Complete Reference C++ Fourth Edition','Herbert Schildt',230,'old',35,'old518965097.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (107,'Java The Complete Reference Eleventh Edition','Herbert Schildt',320,'old',40,'old888977642.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (108,'Julia: Hign Performance Programming','Ivo Balbaert, Avik Sengupta, Malcolm Sherrington',1100,'old',20,'old727503299.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (109,'Data Structure First Edition','Seymour Lipschutz',210,'old',36,'old124218151.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (110,'Data Structures using C & C++ Second Edition','Yedidyah Langsam, Moshe J. Augenstein, Aaron M. Tenenbaum',300,'old',20,'old300772541.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (111,'Learning Genetic Algorithms with Python','Ivan Gridin',210,'old',49,'old545795594.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (112,'E-Commerce An Indian Perspective','P.T. Joseph, S.J.',200,'old',20,'old280453253.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (113,'Computer Graphics C version Second Edition','Donald D. Hearn | M. Pauline Baker',210,'old',38,'old217310527.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (114,'Object Oriented Programming Using C++ and Java','E. Balagurusamy',180,'old',20,'old811355249.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (115,'Head First Servlets & JSP Java Web Development','Bryan Bashan, Kathy Sierra & Bert Bates',1250,'old',20,'old843840765.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (116,'Software Engineering Principles and Applications','Tom Halt',5999,'old',12,'old125879890.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (117,'Cryptography and Network Security Seventh Edition','William Stallings',320,'old',20,'old549121775.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (118,'MATLAB an Introduction with Application Fourth Edition','Amos Gilat',200,'old',40,'old234873437.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (119,'R for Everyone Second Edition','Jared P. Lander',190,'old',20,'old380113233.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (120,'Machine Learning using Python','Manaranjan Pradhan | U Dinesh Kumar',260,'old',25,'old186239146.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (121,'Python for Data Science for Dummies 2nd Edition','John Paul Mueller, Luca Massaron',330,'old',20,'old971779661.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (122,'PHP Web Development with Macromedia Dreamweaver MX 2004','Allan Kent and David Powers with Rachel Andrew',399,'old',18,'old154724186.jpg');
insert  into `book`(`bookId`,`bookName`,`authorName`,`price`,`bookCategory`,`available`,`photo`) values (123,'The Complete Reference MySQL Indian Edition','Vikram Vaswani',299,'old',60,'old437272919.jpg');

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `bookId` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `bookIdCart` (`bookId`),
  KEY `userIdCart` (`userId`),
  CONSTRAINT `bookIdCart` FOREIGN KEY (`bookId`) REFERENCES `book` (`bookId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userIdCart` FOREIGN KEY (`userId`) REFERENCES `useraccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `cart` */

/*Table structure for table `forgot` */

DROP TABLE IF EXISTS `forgot`;

CREATE TABLE `forgot` (
  `email` varchar(50) NOT NULL,
  `otp` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `forgot` */

/*Table structure for table `ordercart` */

DROP TABLE IF EXISTS `ordercart`;

CREATE TABLE `ordercart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderId` int NOT NULL,
  `bookName` varchar(100) NOT NULL,
  `authorName` varchar(100) NOT NULL,
  `quantity` int NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cartOrderId` (`orderId`),
  CONSTRAINT `cartOrderId` FOREIGN KEY (`orderId`) REFERENCES `orderlist` (`orderId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ordercart` */

/*Table structure for table `orderlist` */

DROP TABLE IF EXISTS `orderlist`;

CREATE TABLE `orderlist` (
  `orderId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `price` int NOT NULL,
  `paymentMethod` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'No',
  `name` varchar(30) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address1` varchar(30) DEFAULT NULL,
  `address2` varchar(30) DEFAULT NULL,
  `landmark` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `pincode` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `orderUserId` (`userId`),
  CONSTRAINT `orderUserId` FOREIGN KEY (`userId`) REFERENCES `useraccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `orderlist` */

/*Table structure for table `shipping` */

DROP TABLE IF EXISTS `shipping`;

CREATE TABLE `shipping` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address1` varchar(30) DEFAULT NULL,
  `address2` varchar(30) DEFAULT NULL,
  `landmark` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `pincode` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipUserId` (`userId`),
  CONSTRAINT `shipUserId` FOREIGN KEY (`userId`) REFERENCES `useraccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `shipping` */

/*Table structure for table `useraccount` */

DROP TABLE IF EXISTS `useraccount`;

CREATE TABLE `useraccount` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `active` tinyint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `useraccount` */

/*Table structure for table `userverifications` */

DROP TABLE IF EXISTS `userverifications`;

CREATE TABLE `userverifications` (
  `email` varchar(50) NOT NULL,
  `token` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `userverifications` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
