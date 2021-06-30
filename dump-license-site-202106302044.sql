-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: server-license.mysql.database.azure.com    Database: license-site
-- ------------------------------------------------------
-- Server version	5.6.47.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `__efmigrationshistory`
--

DROP TABLE IF EXISTS `__efmigrationshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__efmigrationshistory`
--

LOCK TABLES `__efmigrationshistory` WRITE;
/*!40000 ALTER TABLE `__efmigrationshistory` DISABLE KEYS */;
INSERT INTO `__efmigrationshistory` VALUES ('20210430101923_DBInit','5.0.5');
/*!40000 ALTER TABLE `__efmigrationshistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apache`
--

DROP TABLE IF EXISTS `apache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apache` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `weight` double NOT NULL DEFAULT '0',
  `attUsing` tinyint(1) DEFAULT NULL COMMENT 'Доступ. Разрешен(true), запрещен(false) или не оговорено ( null)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apache`
--

LOCK TABLES `apache` WRITE;
/*!40000 ALTER TABLE `apache` DISABLE KEYS */;
/*!40000 ALTER TABLE `apache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetroleclaims`
--

DROP TABLE IF EXISTS `aspnetroleclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetroleclaims` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `RoleId` varchar(255) NOT NULL,
  `ClaimType` longtext,
  `ClaimValue` longtext,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetRoleClaims_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetroleclaims`
--

LOCK TABLES `aspnetroleclaims` WRITE;
/*!40000 ALTER TABLE `aspnetroleclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetroleclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetroles`
--

DROP TABLE IF EXISTS `aspnetroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetroles` (
  `Id` varchar(255) NOT NULL,
  `Name` varchar(256) DEFAULT NULL,
  `NormalizedName` varchar(256) DEFAULT NULL,
  `ConcurrencyStamp` longtext,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RoleNameIndex` (`NormalizedName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetroles`
--

LOCK TABLES `aspnetroles` WRITE;
/*!40000 ALTER TABLE `aspnetroles` DISABLE KEYS */;
INSERT INTO `aspnetroles` VALUES ('34ae434f-6b24-4079-bad1-1e4b17ec15c1','admin','ADMIN','2e04d271-167a-49df-b6cd-d12b995268a6');
/*!40000 ALTER TABLE `aspnetroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserclaims`
--

DROP TABLE IF EXISTS `aspnetuserclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetuserclaims` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(255) NOT NULL,
  `ClaimType` longtext,
  `ClaimValue` longtext,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetUserClaims_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserclaims`
--

LOCK TABLES `aspnetuserclaims` WRITE;
/*!40000 ALTER TABLE `aspnetuserclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserlogins`
--

DROP TABLE IF EXISTS `aspnetuserlogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetuserlogins` (
  `LoginProvider` varchar(255) NOT NULL,
  `ProviderKey` varchar(255) NOT NULL,
  `ProviderDisplayName` longtext,
  `UserId` varchar(255) NOT NULL,
  PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  KEY `IX_AspNetUserLogins_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserlogins`
--

LOCK TABLES `aspnetuserlogins` WRITE;
/*!40000 ALTER TABLE `aspnetuserlogins` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserlogins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserroles`
--

DROP TABLE IF EXISTS `aspnetuserroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetuserroles` (
  `UserId` varchar(255) NOT NULL,
  `RoleId` varchar(255) NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `IX_AspNetUserRoles_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserroles`
--

LOCK TABLES `aspnetuserroles` WRITE;
/*!40000 ALTER TABLE `aspnetuserroles` DISABLE KEYS */;
INSERT INTO `aspnetuserroles` VALUES ('995b4393-6796-4ae0-b58e-58028781f46d','34ae434f-6b24-4079-bad1-1e4b17ec15c1');
/*!40000 ALTER TABLE `aspnetuserroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetusers`
--

DROP TABLE IF EXISTS `aspnetusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetusers` (
  `Id` varchar(255) NOT NULL,
  `UserName` varchar(256) DEFAULT NULL,
  `NormalizedUserName` varchar(256) DEFAULT NULL,
  `Email` varchar(256) DEFAULT NULL,
  `NormalizedEmail` varchar(256) DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext,
  `SecurityStamp` longtext,
  `ConcurrencyStamp` longtext,
  `PhoneNumber` longtext,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime(6) DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  KEY `EmailIndex` (`NormalizedEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetusers`
--

LOCK TABLES `aspnetusers` WRITE;
/*!40000 ALTER TABLE `aspnetusers` DISABLE KEYS */;
INSERT INTO `aspnetusers` VALUES ('995b4393-6796-4ae0-b58e-58028781f46d','admin','ADMIN','mail@mail.ru','MAIL@MAIL.RU',1,'AQAAAAEAACcQAAAAELBTGE/cD4LJ/XXCA1+LwVP0kq+IkU1j1of8k9kYNwTT9wS1GoDeSQAlPfoBnZpsSA==','','cf492314-a46d-465a-9cf3-a83960e101a3',NULL,0,0,NULL,0,0);
/*!40000 ALTER TABLE `aspnetusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetusertokens`
--

DROP TABLE IF EXISTS `aspnetusertokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetusertokens` (
  `UserId` varchar(255) NOT NULL,
  `LoginProvider` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Value` longtext,
  PRIMARY KEY (`UserId`,`LoginProvider`,`Name`),
  CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetusertokens`
--

LOCK TABLES `aspnetusertokens` WRITE;
/*!40000 ALTER TABLE `aspnetusertokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetusertokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license`
--

DROP TABLE IF EXISTS `license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license` (
  `Id` char(36) CHARACTER SET ascii NOT NULL,
  `license_name` longtext,
  `DateAdded` datetime(6) NOT NULL,
  `lic_full_name` varchar(255) DEFAULT NULL,
  `lic_full_name_rus` varchar(255) DEFAULT NULL,
  `lic_pluses` varchar(1000) DEFAULT NULL,
  `lic_minuses` varchar(1000) DEFAULT NULL,
  `lic_sameprograms` varchar(255) DEFAULT NULL,
  `lic_description` varchar(1000) DEFAULT NULL,
  `lic_url_agreement_en` varchar(255) DEFAULT NULL,
  `lic_url_agreement_ru` varchar(255) DEFAULT NULL,
  `maincat_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license`
--

LOCK TABLES `license` WRITE;
/*!40000 ALTER TABLE `license` DISABLE KEYS */;
INSERT INTO `license` VALUES ('185bd88b-d37b-401e-84af-030231542fa8','MIT','2021-04-30 10:19:23.000000','MIT license','Лицензия MIT','Использование;Копирование;Изменение;Объединение;Публикация;Распространение;Сублицензирование;Продажа','Коммерческое использование;Обязательный открытый исходный код','X Window System,   Expat,  MetaKit,  PuTTY,  Mono,  Ruby on Rails,  Twisted,  JQuery,  Prototype,  Wayland','лицензия открытого и свободного программного обеспечения; разработанная Массачусетским технологическим институтом. Лицензия MIT является одной из самых ранних свободных лицензий; так как она относительно проста и иллюстрирует некоторые из основных принципов свободного лицензирования. Она является разрешительной лицензией; то есть позволяет программистам использовать лицензируемый код в закрытом программном обеспечении при условии; что текст лицензии предоставляется вместе с этим программным обеспечением. ','https://opensource.org/licenses/mit-license.php','https://ru.wikipedia.org/wiki/%D0%9B%D0%B8%D1%86%D0%B5%D0%BD%D0%B7%D0%B8%D1%8F_MIT',1),('257725ee-8970-4100-be9e-446e0d8797d0','Creative common BY NС','2021-04-30 10:19:23.000000','Creative Commons Attribution-NonCommercial License Version 3.0','Общее творчество Некоммерческая лицензия','Использование;Изменение;Распространения;Публичный показ;Включение в коллекцию','Использование в коммерческих целях;Распространение в коммерческих целях','Не указаны','Одна из лицензий группы лицензий Creative commons','https://creativecommons.org/licenses/by-nc/4.0/deed.en','https://creativecommons.org/licenses/by-nc/4.0/deed.ru',1),('296f0e9c-f1f8-46a2-9b35-49710689b9a9','WTFPL','2021-04-30 10:19:23.000000','Do What The Fuck You Want To Public License','Делайте что хотите лицензия','Изменение;Копирование;Использование в коммерческих целях','Просим не забывать о неотъемлемости самого авторского права на первичный контент','Популярных и широраспространненых программ - нет','Лицензия; разрешающая делать всё что угодно с контентом расптространяемым под данной лицензией.','http://www.wtfpl.net/','#',1),('3408eda0-1ad1-4502-b50d-86412f01816c','Mozilla Public 2.0','2021-04-30 10:19:23.000000','Mozilla Public License 2.0','Публичная лицензия от Mozila 2.0','Использование;Воспроизведение;Изменение;Демонстрацию;Исполнение;Лицензирование;Распространение','Ограничения по использованию торговых марок и логотипов; Отказ от ответственности','Apache Flex, Armadillo, LibreOffice, Mozilla Firefox','одна из лицензий на свободном программном обеспечении. MPL используется в качестве лицензии для Mozilla Suite, Mozilla Firefox, Mozilla Thunderbird и других программ, разработанных Mozilla.','https://www.mozilla.org/en-US/MPL/2.0/','https://ru.bmstu.wiki/Mozilla_Public_License',1),('38c05056-c9bd-4eaa-add4-46d7bcea2337','Apache 2.0','2021-04-30 10:19:23.000000','Apache License 2.0','Лицензия Apache 2.0','Изменение;Воспроизведение;Открытая демонстрация; Открытое использование; Сублицензирование;Распространение ','Отказ от ответственности;Ограничение по использованию торговой марки','Entity Framework, Android (ОС), Android Studio, ASP.NET,ASP.NET Core, DBeaver',' лицензирование производных работ в рамках других лицензий разрешается при соблюдении условий Apache License 2.0. Основные изменения: упрощение использования лицензии для не ASF-проектов, улучшение совместимости с GPL, возможность использовать ссылку на описание лицензии вместо того, чтобы описывать её в каждом файле.\r\n ','https://www.apache.org/licenses/LICENSE-2.0.html','http://licenseit.ru/wiki/index.php/Apache_License_version_2.0',1),('45a433b0-bec2-4a37-b502-c14b5015c2ee','Google maps api license','2021-04-30 10:19:23.000000','Google maps api license','Условия предоставления услуг API Карт Google Maps/Google Планета Земля','Доступ;Использование;Публикация;Отображение','Удалять;Скрывать;Модифицировать;Сохранять;Обрабатывать;Необходимо приобрести лицензию API Premier Карт Google для сайтов с ограниченным кругом лиц пользования','Google карты','Лицензия разработанная специально для использование данных из карт google в сторонних сервисах.','https://developers.google.com/maps/terms-20180207','#',1),('4a2bb1e3-457f-4498-b858-857311ed3181','Proprietary software','2021-04-30 10:19:23.000000','Proprietary software','Проприетарное программное обеспечение','Обращение к техническую поддержку; Получение обновлений;','Чаще всего обязательное к покупке; Закрытый исходный код; Запрет на изменение','Windows, winrar, iTunes, skype, mac, microsoft office','Программное обеспечение являющееся частной собственностью авторов или правообладателей и не удовлетворяющее критериям свободного ПО.','#','#',3),('52f94ffd-4e75-4903-a063-f250d8e45b5e','Fair use','2021-04-30 10:19:23.000000','Fair use','Добросовестное использование','Использование отдельных фрагментов без получения разрешений; Использование в образовательных и аналитических целях; Публичное представление','Фрагменты должны быть малой частью конечного продукта; Коммерческое использование','Любой видеоролик на youtube с критическим обзором  фильма и кадрами из этого фильма.','это юридическое понятие, согласно которому в некоторых ситуациях можно повторно использовать материалы, защищенные авторским правом, не получая специальное разрешение от правообладателя. Примеры такого использования можно найти в приведенных ниже видео. ','https://www.multiplechronicconditions.org/fair-use-act-disclaimer','https://ru.wikipedia.org/wiki/%D0%94%D0%BE%D0%B1%D1%80%D0%BE%D1%81%D0%BE%D0%B2%D0%B5%D1%81%D1%82%D0%BD%D0%BE%D0%B5_%D0%B8%D1%81%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5',3),('5a95c6f3-29f0-4810-83f8-416e697f336d','Creative Commons BY NC SA','2021-04-30 10:19:23.000000','Creative Commons Attribution-NonCommercial-ShareAlike License Version 3.0','Общее творчество Некоммерческая и без изменения лицензии ','Использование;Изменение;Распространения;Публичный показ;Включение в коллекцию;','Атрибуция;Нельзя менять лицензию; Коммерческое использование','Не указаны','Одна из лицензий группы лицензий Creative commons','https://creativecommons.org/licenses/by-nc-sa/4.0/deed.en','https://creativecommons.org/licenses/by-nc-sa/4.0/deed.ru',1),('623a8d3a-2b80-452e-855b-a7bf01dd25a0','Creative Commons BY','2021-04-30 10:19:23.000000','Creative Commons Attribution License Version 3.0','Общее творчество Только атрибуция','Использование;Воспроизведение;Изменение;Демонстрацию;Исполнение;Лицензирование;Распространение;Коммерческое использование','При изменении явно указать об изменении работы;Указать автора оригинала;Приложить URL на используемую лицензию','Не указаны','Одна из лицензий группы лицензий Creative commons','https://creativecommons.org/licenses/by/4.0/deed.en','https://creativecommons.org/licenses/by/4.0/deed.ru',1),('6ad74aa3-0b2d-465b-8064-5db3971114ab','Open Font','2021-04-30 10:19:23.000000','Open Font License','Открытия лицензия шрифтов','Бесплатное внедрение в любое ПО;Использование; Объединение; Модификацию;Распространение','Коммерческое использование; Атрибуция; Указание лицензии','Не указаны','Открытия лицензия шрифтов разработанная компанией Google. Шрифты распространяемые по данной лицензии могут использоваться где угодно с любой целью.','https://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=OFL','#',1),('6e0d1f63-73cc-4db1-8103-0a07b11eaa44','Public Domain','2021-04-30 10:19:23.000000','Public Domain','Общественное достояние','Ограничений нет;','Ограничений нет; ','СУБД SQL Lite, Википедия,7-zip',' совокупность творческих произведений, имущественные авторские права на которые истекли или никогда не существовали. Также «общественным достоянием» иногда называют изобретения, срок патента на которые истёк. Распространять и использовать общественное достояние могут все без ограничений.','https://creativecommons.org/publicdomain/zero/1.0/','https://creativecommons.org/publicdomain/zero/1.0/deed.ru',1),('773ec4ed-f886-4a70-9651-a5595abcdb8e','Creative common BY ND','2021-04-30 10:19:23.000000','Creative Commons Attribution-NoDerivs License Version 3.0','Общее творчество Без изменения исходного объекта','Использование;Распространения;Публичный показ;Включение в коллекцию;Коммерческое использование','Изменение;\nСоздание производных произведений','Не указаны','Одна из лицензий группы лицензий Creative commons','https://creativecommons.org/licenses/by-nd/4.0/deed.en','https://creativecommons.org/licenses/by-nd/4.0/deed.ru',1),('7dd08ddd-e1d6-418e-8a25-6be72fbdd6d6','BSD 3-Clause “New”','2021-04-30 10:19:23.000000','BSD 3-Clause \"New\" or \"Revised\" License','Программная лицензия университета Беркли','Использование;Изменение;Использование изменёных;Распространение;Распространение измененных.','Производные программы имеют ту же лицензию ','Компилятор Pascal','Лицензия используемая в основном для распространения UNIX-подобных операционных систем.','https://choosealicense.com/licenses/bsd-3-clause/','https://ru.bmstu.wiki/BSD_%D0%BB%D0%B8%D1%86%D0%B5%D0%BD%D0%B7%D0%B8%D1%8F',1),('8554b7d0-3f6b-4335-bd09-92cc97614750','DrWeb 2011','2021-04-30 10:19:23.000000','DrWeb 2011 License','Лицензия от DrWeb','Обращение к техническую поддержку; Получение обновлений;','Чаще всего обязательное к покупке; Закрытый исходный код; Запрет на изменение','DrWeb 2011','Лицензия созданная компанией производителем антириуса DrWeb.','https://license.drweb.com/agreement/','#',2),('981c3c9e-cbdd-4594-a537-1101c23adb82','GNU GPL 3.0','2021-04-30 10:19:23.000000','General public license','Универсальная общественная лицензия','Копировать;		Модифицировать;Распространять (в том числе на коммерческой основе);Свобода запуска программы с любой целью','Все производные программы получают вышеперечисленные права;Обязательный открытый исходный код;Изменение текста лицензии;Использование в проприетарном ПО','Браузеры FireFox,  Chrome,  Opera,  месседжер Skype,  архиватор 7-zip, видеоплеер KMPlayer,  3D редактор blender','Лицензия на свободное программное обеспечение; созданная в рамках проекта GNU в 1988 г.; по которой автор передаёт программное обеспечение в общественную собственность','https://www.gnu.org/licenses/gpl-3.0.en.html','https://www.gnu.org/licenses/gpl-3.0.ru.html',1),('a1cba820-2cd1-4204-8098-baed98c598cc','Open source','2021-04-30 10:19:23.000000','Open source','Открытый исходный код','Некоммерческое использование; Редактирование;','Обязательное распространение с открытым исходным кодом; Коммереское использование','Wordpress, git, mysql, gimp, php','Программы с открытым исходным кодом. Open source не является лицензией самой по себе, но является широким определением применяемым к программам распространяемым под свободными лицензями.','https://opensource.org/docs/osd','http://citkit.ru/articles/272/',3),('a6170c1e-5d01-4a9f-acb5-5f21fae39ddd','Unlicense','2021-04-30 10:19:23.000000','Unlicense','Без указания лицензии','После получения разрешения можно делать всё что-угодно согласно условиям договора; ;','Использование без получения разрешения от автора; ','Не указаны','Если не указать никакую лицензию для вашего объекта авторского права, произведения. Будут действовать стандартные правила и законы авторского права.','#','http://www.consultant.ru/document/cons_doc_LAW_64629/0b318126c43879a845405f1fb1f4342f473a1eda/',3),('be79a5b1-e1e0-4c09-81a4-1380d8d3d81c','Creative Commons BY SA','2021-04-30 10:19:23.000000','Creative Commons Attribution-ShareAlike License Version 3.0','Общее творчество Без изменения лицензии','Использование;Изменение;Распространения;Публичный показ;Включение в коллекцию;Коммерческое использование','Атрибуция;Нельзя менять лицензию','Не указаны','Одна из лицензий группы лицензий Creative commons','https://creativecommons.org/licenses/by-sa/4.0/deed.eu','https://creativecommons.org/licenses/by-sa/4.0/deed.ru',1),('d0004058-9c94-4e1d-8d5d-735152698d1a','Creative common BY NС ND','2021-04-30 10:19:23.000000','Creative Commons Attribution-NonCommercial-NoDerivs License Version 3.0','Общее творчество Некоммерческая лицензия. Без изменения исходного объекта','Использование;Распространения;Публичный показ;Включение в коллекцию','Изменение;\r\nСоздание производных произведений;Коммерческое использование','Не указаны','Одна из лицензий группы лицензий Creative commons',NULL,NULL,1),('f2a89fb3-9cfd-49a3-86dc-8302a649a557','Flaticon','2021-04-30 10:19:23.000000','Flaticon License','Flaticon лицензия','Изменять;Использовать в коммерческих продуктах','Указание автора;Указание ссылки на оригинальные иконки;Ионки запрещено добавлять в сторонние каталоги иконок;Использовать в коммерческих целях если главным элементом контента является иконка','Данный сайт использует Flaticon иконки','Лицензия разработанная для иконок на сайте flaticon.com','https://www.freepikcompany.com/legal#nav-flaticon-agreement','#',3),('f372a718-1577-4302-b1a8-d3b1d09fed52','Copyleft','2021-04-30 10:19:23.000000','Copyleft','Копилефт','Редактировать;Изменять;Использовать в коммерческих продуктах','Указание лицензии;Размещение текста лицензии','Список отсуствует из за специфичности данной лицензии','1)позволяет использовать оригинальные (исходные) работы при создании новых (производных) работ без получения разрешения владельца авторского права;\r\n2)требует; чтобы два пункта этого списка присутствовали в лицензии производной работы.','https://copyleft.org/','#',3);
/*!40000 ALTER TABLE `license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license_apache`
--

DROP TABLE IF EXISTS `license_apache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license_apache` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `weight` double NOT NULL DEFAULT '0',
  `attUsing` tinyint(1) DEFAULT NULL COMMENT 'Доступ. Разрешен(true), запрещен(false) или не оговорено ( null)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license_apache`
--

LOCK TABLES `license_apache` WRITE;
/*!40000 ALTER TABLE `license_apache` DISABLE KEYS */;
INSERT INTO `license_apache` VALUES (1,'Разрешено ВСЁ',0,0),(2,'Разрешено использование в неккоммерческих целях',0.22,1),(3,'Разрешено использование в коммерческих целях',0.22,1),(4,'Разрешено изменять исходный ОАП',0.22,1),(5,'Разрешено включать в сторонние коллекции объектов АП',0.22,1),(6,'Разрешено изменять лицензию исходного ОАП',0.22,1),(7,'Разрешено использование в закрытом программном обеспечении(ПО)',0.18,1),(8,'Разрешено использовать изменную версию ОАП',0.18,1),(9,'Разрешено копировать исходный ОАП',0.12,1),(10,'Разрешено объединение с другими объектами АП',0.12,1),(11,'Разрешено распространение без исходного кода',0.12,1),(12,'Разрешено переводить на другие языки',0.1,1),(13,'Разрешено распространять измененную версию ОАП',0.1,1),(14,'Разрешено распространять оригинальную версию',0.1,1),(15,'Разрешено распространение без отказа от ответственности',-1,1),(16,'Разрешено изменять в целях улучшения',0.1,1);
/*!40000 ALTER TABLE `license_apache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license_bsd3`
--

DROP TABLE IF EXISTS `license_bsd3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license_bsd3` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `weight` double NOT NULL DEFAULT '0',
  `attUsing` tinyint(1) DEFAULT NULL COMMENT 'Доступ. Разрешен(true), запрещен(false) или не оговорено ( null)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license_bsd3`
--

LOCK TABLES `license_bsd3` WRITE;
/*!40000 ALTER TABLE `license_bsd3` DISABLE KEYS */;
INSERT INTO `license_bsd3` VALUES (1,'Разрешено ВСЁ',0,0),(2,'Разрешено использование в неккоммерческих целях',0.2,1),(3,'Разрешено использование в коммерческих целях',0.13,1),(4,'Разрешено изменять исходный ОАП',0.11,1),(5,'Разрешено включать в сторонние коллекции объектов АП',0.13,1),(6,'Разрешено изменять лицензию исходного ОАП',0.13,1),(7,'Разрешено использование в закрытом программном обеспечении(ПО)',0.03,1),(8,'Разрешено использовать изменную версию ОАП',0.1,1),(9,'Разрешено копировать исходный ОАП',0.03,1),(10,'Разрешено объединение с другими объектами АП',0.03,1),(11,'Разрешено распространение без исходного кода',0.03,1),(12,'Разрешено переводить на другие языки',0.02,1),(13,'Разрешено распространять измененную версию ОАП',0.02,1),(14,'Разрешено распространять оригинальную версию',0.02,1),(15,'Разрешено распространение без отказа от ответственности',-1,1),(16,'Разрешено изменять в целях улучшения',0.02,1);
/*!40000 ALTER TABLE `license_bsd3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license_cc_by`
--

DROP TABLE IF EXISTS `license_cc_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license_cc_by` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `weight` double NOT NULL DEFAULT '0',
  `attUsing` tinyint(1) DEFAULT NULL COMMENT 'Доступ. Разрешен(true), запрещен(false) или не оговорено ( null)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license_cc_by`
--

LOCK TABLES `license_cc_by` WRITE;
/*!40000 ALTER TABLE `license_cc_by` DISABLE KEYS */;
INSERT INTO `license_cc_by` VALUES (1,'Разрешено ВСЁ',0,0),(2,'Разрешено использование в неккоммерческих целях',0.09,1),(3,'Разрешено использование в коммерческих целях',0.09,1),(4,'Разрешено изменять исходный ОАП',0.09,1),(5,'Разрешено включать в сторонние коллекции объектов АП',0.09,1),(6,'Разрешено изменять лицензию исходного ОАП',0.09,1),(7,'Разрешено использование в закрытом программном обеспечении(ПО)',0.09,1),(8,'Разрешено использовать изменную версию ОАП',0.09,0),(9,'Разрешено копировать исходный ОАП',0.06,1),(10,'Разрешено объединение с другими объектами АП',0.07,1),(11,'Разрешено распространение без исходного кода',0.01,1),(12,'Разрешено переводить на другие языки',0.02,1),(13,'Разрешено распространять измененную версию ОАП',0.03,1),(14,'Разрешено распространять оригинальную версию',0.09,1),(15,'Разрешено распространение без отказа от ответственности',-1,1),(16,'Разрешено изменять в целях улучшения',0.09,1);
/*!40000 ALTER TABLE `license_cc_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license_cc_by_nc`
--

DROP TABLE IF EXISTS `license_cc_by_nc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license_cc_by_nc` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `weight` double NOT NULL DEFAULT '0',
  `attUsing` tinyint(1) DEFAULT NULL COMMENT 'Доступ. Разрешен(true), запрещен(false) или не оговорено ( null)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license_cc_by_nc`
--

LOCK TABLES `license_cc_by_nc` WRITE;
/*!40000 ALTER TABLE `license_cc_by_nc` DISABLE KEYS */;
INSERT INTO `license_cc_by_nc` VALUES (1,'Разрешено ВСЁ',0,0),(2,'Разрешено использование в неккоммерческих целях',0.11,1),(3,'Разрешено использование в коммерческих целях',-0.5,1),(4,'Разрешено изменять исходный ОАП',0.11,1),(5,'Разрешено включать в сторонние коллекции объектов АП',0.09,1),(6,'Разрешено изменять лицензию исходного ОАП',0.09,1),(7,'Разрешено использование в закрытом программном обеспечении(ПО)',0.11,1),(8,'Разрешено использовать изменную версию ОАП',0.11,1),(9,'Разрешено копировать исходный ОАП',0.06,1),(10,'Разрешено объединение с другими объектами АП',0.07,1),(11,'Разрешено распространение без исходного кода',0.01,1),(12,'Разрешено переводить на другие языки',0.02,1),(13,'Разрешено распространять измененную версию ОАП',0.03,1),(14,'Разрешено распространять оригинальную версию',0.09,1),(15,'Разрешено распространение без отказа от ответственности',-0.5,1),(16,'Разрешено изменять в целях улучшения',0.1,1);
/*!40000 ALTER TABLE `license_cc_by_nc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license_cc_by_nc_nd`
--

DROP TABLE IF EXISTS `license_cc_by_nc_nd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license_cc_by_nc_nd` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `weight` double NOT NULL DEFAULT '0',
  `attUsing` tinyint(1) DEFAULT NULL COMMENT 'Доступ. Разрешен(true), запрещен(false) или не оговорено ( null)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license_cc_by_nc_nd`
--

LOCK TABLES `license_cc_by_nc_nd` WRITE;
/*!40000 ALTER TABLE `license_cc_by_nc_nd` DISABLE KEYS */;
INSERT INTO `license_cc_by_nc_nd` VALUES (1,'Разрешено ВСЁ',0,0),(2,'Разрешено использование в неккоммерческих целях',0.08,1),(3,'Разрешено использование в коммерческих целях',-0.33,1),(4,'Разрешено изменять исходный ОАП',0.08,1),(5,'Разрешено включать в сторонние коллекции объектов АП',0.05,1),(6,'Разрешено изменять лицензию исходного ОАП',0.13,1),(7,'Разрешено использование в закрытом программном обеспечении(ПО)',0.13,1),(8,'Разрешено использовать изменную версию ОАП',0.05,1),(9,'Разрешено копировать исходный ОАП',0.09,1),(10,'Разрешено объединение с другими объектами АП',0.05,1),(11,'Разрешено распространение без исходного кода',0.13,1),(12,'Разрешено переводить на другие языки',0.08,1),(13,'Разрешено распространять измененную версию ОАП',-0.33,1),(14,'Разрешено распространять оригинальную версию',0.05,1),(15,'Разрешено распространение без отказа от ответственности',-0.34,1),(16,'Разрешено изменять в целях улучшения',0.08,1);
/*!40000 ALTER TABLE `license_cc_by_nc_nd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license_cc_by_nc_sa`
--

DROP TABLE IF EXISTS `license_cc_by_nc_sa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license_cc_by_nc_sa` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `weight` double NOT NULL DEFAULT '0',
  `attUsing` tinyint(1) DEFAULT NULL COMMENT 'Доступ. Разрешен(true), запрещен(false) или не оговорено ( null)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license_cc_by_nc_sa`
--

LOCK TABLES `license_cc_by_nc_sa` WRITE;
/*!40000 ALTER TABLE `license_cc_by_nc_sa` DISABLE KEYS */;
INSERT INTO `license_cc_by_nc_sa` VALUES (1,'Разрешено ВСЁ',0,0),(2,'Разрешено использование в неккоммерческих целях',0.15,1),(3,'Разрешено использование в коммерческих целях',-0.33,1),(4,'Разрешено изменять исходный ОАП',0.15,1),(5,'Разрешено включать в сторонние коллекции объектов АП',0.03,1),(6,'Разрешено изменять лицензию исходного ОАП',-0.33,1),(7,'Разрешено использование в закрытом программном обеспечении(ПО)',0.15,1),(8,'Разрешено использовать изменную версию ОАП',0.09,1),(9,'Разрешено копировать исходный ОАП',0.03,1),(10,'Разрешено объединение с другими объектами АП',0.03,1),(11,'Разрешено распространение без исходного кода',0.07,1),(12,'Разрешено переводить на другие языки',0.07,1),(13,'Разрешено распространять измененную версию ОАП',0.07,1),(14,'Разрешено распространять оригинальную версию',0.07,1),(15,'Разрешено распространение без отказа от ответственности',-0.34,1),(16,'Разрешено изменять в целях улучшения',0.09,1);
/*!40000 ALTER TABLE `license_cc_by_nc_sa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license_cc_by_nd`
--

DROP TABLE IF EXISTS `license_cc_by_nd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license_cc_by_nd` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `weight` double NOT NULL DEFAULT '0',
  `attUsing` tinyint(1) DEFAULT NULL COMMENT 'Доступ. Разрешен(true), запрещен(false) или не оговорено ( null)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license_cc_by_nd`
--

LOCK TABLES `license_cc_by_nd` WRITE;
/*!40000 ALTER TABLE `license_cc_by_nd` DISABLE KEYS */;
INSERT INTO `license_cc_by_nd` VALUES (1,'Разрешено ВСЁ',0,0),(2,'Разрешено использование в неккоммерческих целях',0.08,1),(3,'Разрешено использование в коммерческих целях',0.08,1),(4,'Разрешено изменять исходный ОАП',0.08,1),(5,'Разрешено включать в сторонние коллекции объектов АП',0.05,1),(6,'Разрешено изменять лицензию исходного ОАП',0.08,1),(7,'Разрешено использование в закрытом программном обеспечении(ПО)',0.08,1),(8,'Разрешено использовать изменную версию ОАП',0.08,1),(9,'Разрешено копировать исходный ОАП',0.09,1),(10,'Разрешено объединение с другими объектами АП',0.05,1),(11,'Разрешено распространение без исходного кода',0.09,1),(12,'Разрешено переводить на другие языки',0.09,1),(13,'Разрешено распространять измененную версию ОАП',-0.5,1),(14,'Разрешено распространять оригинальную версию',0.05,1),(15,'Разрешено распространение без отказа от ответственности',-0.5,1),(16,'Разрешено изменять в целях улучшения',0.1,1);
/*!40000 ALTER TABLE `license_cc_by_nd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license_cc_by_sa`
--

DROP TABLE IF EXISTS `license_cc_by_sa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license_cc_by_sa` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `weight` double NOT NULL DEFAULT '0',
  `attUsing` tinyint(1) DEFAULT NULL COMMENT 'Доступ. Разрешен(true), запрещен(false) или не оговорено ( null)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license_cc_by_sa`
--

LOCK TABLES `license_cc_by_sa` WRITE;
/*!40000 ALTER TABLE `license_cc_by_sa` DISABLE KEYS */;
INSERT INTO `license_cc_by_sa` VALUES (1,'Разрешено ВСЁ',0,0),(2,'Разрешено использование в неккоммерческих целях',0.11,1),(3,'Разрешено использование в коммерческих целях',0.1,1),(4,'Разрешено изменять исходный ОАП',0.11,1),(5,'Разрешено включать в сторонние коллекции объектов АП',0.09,1),(6,'Разрешено изменять лицензию исходного ОАП',-0.5,1),(7,'Разрешено использование в закрытом программном обеспечении(ПО)',0.11,1),(8,'Разрешено использовать изменную версию ОАП',0.1,1),(9,'Разрешено копировать исходный ОАП',0.06,1),(10,'Разрешено объединение с другими объектами АП',0.07,1),(11,'Разрешено распространение без исходного кода',0.01,1),(12,'Разрешено переводить на другие языки',0.02,1),(13,'Разрешено распространять измененную версию ОАП',0.03,1),(14,'Разрешено распространять оригинальную версию',0.09,1),(15,'Разрешено распространение без отказа от ответственности',-0.5,1),(16,'Разрешено изменять в целях улучшения',0.1,1);
/*!40000 ALTER TABLE `license_cc_by_sa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license_copyleft`
--

DROP TABLE IF EXISTS `license_copyleft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license_copyleft` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `weight` double NOT NULL DEFAULT '0',
  `attUsing` tinyint(1) DEFAULT NULL COMMENT 'Доступ. Разрешен(true), запрещен(false) или не оговорено ( null)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license_copyleft`
--

LOCK TABLES `license_copyleft` WRITE;
/*!40000 ALTER TABLE `license_copyleft` DISABLE KEYS */;
INSERT INTO `license_copyleft` VALUES (1,'Разрешено ВСЁ',0,0),(2,'Разрешено использование в неккоммерческих целях',0.2,1),(3,'Разрешено использование в коммерческих целях',0.15,1),(4,'Разрешено изменять исходный ОАП',0.15,1),(5,'Разрешено включать в сторонние коллекции объектов АП',0.11,1),(6,'Разрешено изменять лицензию исходного ОАП',-0.33,1),(7,'Разрешено использование в закрытом программном обеспечении(ПО)',-0.34,1),(8,'Разрешено использовать изменную версию ОАП',0.13,1),(9,'Разрешено копировать исходный ОАП',0.11,1),(10,'Разрешено объединение с другими объектами АП',0.1,1),(11,'Разрешено распространение без исходного кода',-0.33,1),(12,'Разрешено переводить на другие языки',0.1,1),(13,'Разрешено распространять измененную версию ОАП',0.01,1),(14,'Разрешено распространять оригинальную версию',0.01,1),(15,'Разрешено распространение без отказа от ответственности',0.01,1),(16,'Разрешено изменять в целях улучшения',0.01,1);
/*!40000 ALTER TABLE `license_copyleft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license_gpl`
--

DROP TABLE IF EXISTS `license_gpl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license_gpl` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `weight` double NOT NULL DEFAULT '0',
  `attUsing` tinyint(1) DEFAULT NULL COMMENT 'Доступ. Разрешен(true), запрещен(false) или не оговорено ( null)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license_gpl`
--

LOCK TABLES `license_gpl` WRITE;
/*!40000 ALTER TABLE `license_gpl` DISABLE KEYS */;
INSERT INTO `license_gpl` VALUES (1,'Разрешено ВСЁ',0,0),(2,'Разрешено использование в неккоммерческих целях',0.16,1),(3,'Разрешено использование в коммерческих целях',0.13,1),(4,'Разрешено изменять исходный ОАП',0.13,1),(5,'Разрешено включать в сторонние коллекции объектов АП',0.11,1),(6,'Разрешено изменять лицензию исходного ОАП',-0.33,1),(7,'Разрешено использование в закрытом программном обеспечении(ПО)',-0.34,1),(8,'Разрешено использовать изменную версию ОАП',0.12,1),(9,'Разрешено копировать исходный ОАП',0.11,1),(10,'Разрешено объединение с другими объектами АП',0.1,1),(11,'Разрешено распространение без исходного кода',-0.33,1),(12,'Разрешено переводить на другие языки',0.1,1),(13,'Разрешено распространять измененную версию ОАП',0.01,1),(14,'Разрешено распространять оригинальную версию',0.01,1),(15,'Разрешено распространение без отказа от ответственности',0.01,1),(16,'Разрешено изменять в целях улучшения',0.01,1);
/*!40000 ALTER TABLE `license_gpl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license_mit`
--

DROP TABLE IF EXISTS `license_mit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license_mit` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `weight` double NOT NULL DEFAULT '0',
  `attUsing` tinyint(1) DEFAULT NULL COMMENT 'Доступ. Разрешен(true), запрещен(false) или не оговорено ( null)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license_mit`
--

LOCK TABLES `license_mit` WRITE;
/*!40000 ALTER TABLE `license_mit` DISABLE KEYS */;
INSERT INTO `license_mit` VALUES (1,'Разрешено ВСЁ',0.08,0),(2,'Разрешено использование в неккоммерческих целях',0.08,1),(3,'Разрешено использование в коммерческих целях',0.08,1),(4,'Разрешено изменять исходный ОАП',0.08,1),(5,'Разрешено включать в сторонние коллекции объектов АП',0.08,1),(6,'Разрешено изменять лицензию исходного ОАП',0.08,1),(7,'Разрешено использование в закрытом программном обеспечении(ПО)',0.08,1),(8,'Разрешено использовать изменную версию ОАП',0.08,1),(9,'Разрешено копировать исходный ОАП',0.08,1),(10,'Разрешено объединение с другими объектами АП',0.08,0),(11,'Разрешено распространение без исходного кода',0.08,1),(12,'Разрешено переводить на другие языки',0.08,1),(13,'Разрешено распространять измененную версию ОАП',0.08,1),(14,'Разрешено распространять оригинальную версию',0.08,1),(15,'Разрешено распространение без отказа от ответственности',0.08,1),(16,'Разрешено изменять в целях улучшения',0.08,1);
/*!40000 ALTER TABLE `license_mit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license_mozila`
--

DROP TABLE IF EXISTS `license_mozila`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license_mozila` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `weight` double NOT NULL DEFAULT '0',
  `attUsing` tinyint(1) DEFAULT NULL COMMENT 'Доступ. Разрешен(true), запрещен(false) или не оговорено ( null)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license_mozila`
--

LOCK TABLES `license_mozila` WRITE;
/*!40000 ALTER TABLE `license_mozila` DISABLE KEYS */;
INSERT INTO `license_mozila` VALUES (1,'Разрешено ВСЁ',0,0),(2,'Разрешено использование в неккоммерческих целях',0.2,1),(3,'Разрешено использование в коммерческих целях',0.15,1),(4,'Разрешено изменять исходный ОАП',0.15,1),(5,'Разрешено включать в сторонние коллекции объектов АП',0.11,1),(6,'Разрешено изменять лицензию исходного ОАП',-0.33,1),(7,'Разрешено использование в закрытом программном обеспечении(ПО)',-0.34,1),(8,'Разрешено использовать изменную версию ОАП',0.13,1),(9,'Разрешено копировать исходный ОАП',0.11,1),(10,'Разрешено объединение с другими объектами АП',0.1,1),(11,'Разрешено распространение без исходного кода',-0.33,1),(12,'Разрешено переводить на другие языки',0.1,1),(13,'Разрешено распространять измененную версию ОАП',0.01,1),(14,'Разрешено распространять оригинальную версию',0.01,1),(15,'Разрешено распространение без отказа от ответственности',0.01,1),(16,'Разрешено изменять в целях улучшения',0.01,1);
/*!40000 ALTER TABLE `license_mozila` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license_proprietary`
--

DROP TABLE IF EXISTS `license_proprietary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license_proprietary` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `weight` double NOT NULL DEFAULT '0',
  `attUsing` tinyint(1) DEFAULT NULL COMMENT 'Доступ. Разрешен(true), запрещен(false) или не оговорено ( null)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license_proprietary`
--

LOCK TABLES `license_proprietary` WRITE;
/*!40000 ALTER TABLE `license_proprietary` DISABLE KEYS */;
INSERT INTO `license_proprietary` VALUES (1,'Разрешено ВСЁ',0,0),(2,'Разрешено использование в неккоммерческих целях',0.2,1),(3,'Разрешено использование в коммерческих целях',0.15,1),(4,'Разрешено изменять исходный ОАП',0.15,1),(5,'Разрешено включать в сторонние коллекции объектов АП',0.11,1),(6,'Разрешено изменять лицензию исходного ОАП',-0.33,1),(7,'Разрешено использование в закрытом программном обеспечении(ПО)',-0.34,1),(8,'Разрешено использовать изменную версию ОАП',0.13,1),(9,'Разрешено копировать исходный ОАП',0.11,1),(10,'Разрешено объединение с другими объектами АП',0.1,1),(11,'Разрешено распространение без исходного кода',-0.33,1),(12,'Разрешено переводить на другие языки',0.1,1),(13,'Разрешено распространять измененную версию ОАП',0.01,1),(14,'Разрешено распространять оригинальную версию',0.01,1),(15,'Разрешено распространение без отказа от ответственности',0.01,1),(16,'Разрешено изменять в целях улучшения',0.01,1);
/*!40000 ALTER TABLE `license_proprietary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license_wtfpl`
--

DROP TABLE IF EXISTS `license_wtfpl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license_wtfpl` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `weight` double NOT NULL DEFAULT '0',
  `attUsing` tinyint(1) DEFAULT NULL COMMENT 'Доступ. Разрешен(true), запрещен(false) или не оговорено ( null)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license_wtfpl`
--

LOCK TABLES `license_wtfpl` WRITE;
/*!40000 ALTER TABLE `license_wtfpl` DISABLE KEYS */;
INSERT INTO `license_wtfpl` VALUES (1,'Разрешено ВСЁ',0.5,0),(2,'Разрешено использование в неккоммерческих целях',0.04,1),(3,'Разрешено использование в коммерческих целях',0.04,1),(4,'Разрешено изменять исходный ОАП',0.04,1),(5,'Разрешено включать в сторонние коллекции объектов АП',0.04,1),(6,'Разрешено изменять лицензию исходного ОАП',0.04,1),(7,'Разрешено использование в закрытом программном обеспечении(ПО)',0.03,1),(8,'Разрешено использовать изменную версию ОАП',0.03,1),(9,'Разрешено копировать исходный ОАП',0.03,1),(10,'Разрешено объединение с другими объектами АП',0.03,1),(11,'Разрешено распространение без исходного кода',0.03,1),(12,'Разрешено переводить на другие языки',0.03,1),(13,'Разрешено распространять измененную версию ОАП',0.03,1),(14,'Разрешено распространять оригинальную версию',0.03,1),(15,'Разрешено распространение без отказа от ответственности',0.03,1),(16,'Разрешено изменять в целях улучшения',0.03,1);
/*!40000 ALTER TABLE `license_wtfpl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_name` varchar(100) NOT NULL,
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('admin',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'license-site'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-30 20:45:39
