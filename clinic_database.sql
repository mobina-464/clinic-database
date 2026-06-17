-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: clinicdb
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `AppointmentID` int NOT NULL,
  `PatientID` int DEFAULT NULL,
  `DentistID` int DEFAULT NULL,
  `ServiceID` int DEFAULT NULL,
  `AppDate` date DEFAULT NULL,
  `AppTime` time DEFAULT NULL,
  `Description` text COLLATE utf8mb4_unicode_ci,
  `Status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`AppointmentID`),
  KEY `FK_AppPatient` (`PatientID`),
  KEY `FK_AppDentist` (`DentistID`),
  KEY `FK_AppService` (`ServiceID`),
  CONSTRAINT `FK_AppDentist` FOREIGN KEY (`DentistID`) REFERENCES `dentists` (`DentistID`),
  CONSTRAINT `FK_AppPatient` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`PatientID`),
  CONSTRAINT `FK_AppService` FOREIGN KEY (`ServiceID`) REFERENCES `services` (`ServiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (1,1,101,6,'2023-10-01','09:00:00','نصب براکت','انجام شده'),(2,2,102,1,'2023-10-01','10:30:00','درد شدید','انجام شده'),(3,3,103,9,'2023-10-02','11:00:00','ویزیت اطفال','لغو شده'),(4,4,104,3,'2023-10-02','16:00:00','ترمیم قدامی','انجام شده'),(5,5,105,10,'2023-10-03','17:30:00','جراحی لثه','انجام شده'),(6,6,106,5,'2023-10-04','09:00:00','مرحله اول ایمپلنت','در انتظار'),(7,7,107,2,'2023-10-05','12:00:00','جرم‌گیری عمومی','انجام شده'),(8,8,108,4,'2023-10-06','14:00:00','کشیدن عقل','در انتظار'),(9,9,109,1,'2023-10-07','18:00:00','ادامه عصب‌کشی','انجام شده');
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dentists`
--

DROP TABLE IF EXISTS `dentists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dentists` (
  `DentistID` int NOT NULL,
  `FullName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Specialty` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PhoneNumber` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`DentistID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dentists`
--

LOCK TABLES `dentists` WRITE;
/*!40000 ALTER TABLE `dentists` DISABLE KEYS */;
INSERT INTO `dentists` VALUES (101,'دکتر علی کاظمی','متخصص ارتودنسی','09121112233'),(102,'دکتر مریم نوری','جراح فک و صورت','09122223344'),(103,'دکتر رضا رستمی','متخصص اطفال','09123334455'),(104,'دکتر سارا داوودی','متخصص ترمیمی','09124445566'),(105,'دکتر امیر بهرامی','متخصص لثه (پریو)','09125556677'),(106,'دکتر مینا شریفی','متخصص ایمپلنت','09126667788'),(107,'دکتر حسن زند','دندان‌پزشک عمومی','09127778899'),(108,'دکتر الهام نیکو','دندان‌پزشک عمومی','09128889900'),(109,'دکتر فرهاد فلاح','جراح فک','09129990011'),(110,'دکتر ژاله کیانی','متخصص زیبایی','09120001122');
/*!40000 ALTER TABLE `dentists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `installments`
--

DROP TABLE IF EXISTS `installments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `installments` (
  `PaymentID` int NOT NULL,
  `AppointmentID` int DEFAULT NULL,
  `Amount` decimal(18,2) DEFAULT NULL,
  `DueDate` date DEFAULT NULL,
  `PaymentStatus` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `FK_PaymentApp` (`AppointmentID`),
  CONSTRAINT `FK_PaymentApp` FOREIGN KEY (`AppointmentID`) REFERENCES `appointments` (`AppointmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `installments`
--

LOCK TABLES `installments` WRITE;
/*!40000 ALTER TABLE `installments` DISABLE KEYS */;
INSERT INTO `installments` VALUES (1,1,5000000.00,'2023-11-01','پرداخت شده'),(2,2,1500000.00,'2023-10-01','پرداخت شده'),(3,4,850000.00,'2023-10-02','پرداخت شده'),(4,5,2500000.00,'2023-10-15','معوقه'),(5,6,6000000.00,'2023-11-04','در انتظار'),(6,7,500000.00,'2023-10-05','پرداخت شده'),(7,9,1500000.00,'2023-10-07','پرداخت شده'),(8,1,5000000.00,'2023-12-01','در انتظار'),(9,5,2500000.00,'2023-11-15','در انتظار'),(10,6,6000000.00,'2023-12-04','در انتظار');
/*!40000 ALTER TABLE `installments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurances`
--

DROP TABLE IF EXISTS `insurances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insurances` (
  `InsuranceID` int NOT NULL,
  `InsuranceName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ExpiryDate` date DEFAULT NULL,
  `CoveragePercent` int DEFAULT NULL,
  PRIMARY KEY (`InsuranceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurances`
--

LOCK TABLES `insurances` WRITE;
/*!40000 ALTER TABLE `insurances` DISABLE KEYS */;
INSERT INTO `insurances` VALUES (1,'تامین اجتماعی','2025-12-01',30),(2,'سلامت ایرانیان','2024-11-20',20),(3,'نیروهای مسلح','2025-01-15',50),(4,'بیمه دانا','2025-05-10',70),(5,'بیمه ایران','2025-08-30',60),(6,'آتیه سازان حافظ','2024-12-25',40),(7,'بیمه البرز','2025-02-14',50),(8,'بیمه پارسیان','2025-03-20',45),(9,'بیمه معلم','2025-04-01',35),(10,'بانک ملی','2026-01-01',90);
/*!40000 ALTER TABLE `insurances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicalrecords`
--

DROP TABLE IF EXISTS `medicalrecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicalrecords` (
  `RecordID` int NOT NULL,
  `PatientID` int DEFAULT NULL,
  `DentistID` int DEFAULT NULL,
  `CreationDate` date DEFAULT NULL,
  `DiagnosedDiseases` text COLLATE utf8mb4_unicode_ci,
  `Treatment` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`RecordID`),
  KEY `FK_RecordPatient` (`PatientID`),
  KEY `FK_RecordDentist` (`DentistID`),
  CONSTRAINT `FK_RecordDentist` FOREIGN KEY (`DentistID`) REFERENCES `dentists` (`DentistID`),
  CONSTRAINT `FK_RecordPatient` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicalrecords`
--

LOCK TABLES `medicalrecords` WRITE;
/*!40000 ALTER TABLE `medicalrecords` DISABLE KEYS */;
INSERT INTO `medicalrecords` VALUES (1,1,101,'2023-01-10','ناهنجاری فک','شروع ارتودنسی'),(2,2,102,'2023-02-15','پوسیدگی عمیق','عصب‌کشی کانال ۲'),(3,3,103,'2023-03-20','پوسیدگی دندان شیری','ترمیم سطحی'),(4,4,104,'2023-04-05','حساسیت دندانی','ترمیم با کامپوزیت'),(5,5,105,'2023-05-12','تحلیل لثه','پیوند بافت'),(6,6,106,'2023-06-18','فقدان دندان ۶','جراحی ایمپلنت'),(7,7,107,'2023-07-22','جرم شدید','بروساژ و جرم‌گیری'),(8,8,108,'2023-08-30','شکستگی دندان عقل','خارج کردن دندان'),(9,9,109,'2023-09-05','عفونت ریشه','آنتی‌بیوتیک و درمان ریشه'),(10,10,110,'2023-10-01','تغییر رنگ دندان','بلیچینگ خانگی');
/*!40000 ALTER TABLE `medicalrecords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `PatientID` int NOT NULL AUTO_INCREMENT,
  `NationalID` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FullName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Gender` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `Address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PhoneNumber` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `InsuranceID` int DEFAULT NULL,
  PRIMARY KEY (`PatientID`),
  UNIQUE KEY `NationalID` (`NationalID`),
  KEY `FK_PatientInsurance` (`InsuranceID`),
  CONSTRAINT `FK_PatientInsurance` FOREIGN KEY (`InsuranceID`) REFERENCES `insurances` (`InsuranceID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'127001','رضا حسنی','مرد','1990-05-15','تهران، خیابان ولیعصر، پلاک ۱۰','09129998877',1),(2,'127002','مریم اکبری','زن','1995-08-20','تهران، پونک','09120002222',2),(3,'127003','علی احمدی','مرد','1988-02-10','اصفهان، خ جی','09130003333',3),(4,'127004','مینا مرادی','زن','2000-01-01','شیراز، معالی آباد','09170004444',4),(5,'127005','سعید کریمی','مرد','1985-12-12','تبریز، آبرسان','09140005555',5),(6,'127006','زهرا باقری','زن','1992-03-25','مشهد، سجاد','09150006666',6),(7,'127007','امیر عباسی','مرد','1970-11-30','اهواز، کیانپارس','09160007777',NULL),(8,'127008','نرگس رضایی','زن','1982-06-14','کرمان، بلوار جمهوری','09138888888',8),(9,'127009','حسین موسوی','مرد','1998-09-09','رشت، گلسار','09110009999',9),(10,'127010','لیلا همتی','زن','1994-07-07','یزد، خ کاشانی','09350001010',10);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `ServiceID` int NOT NULL,
  `ServiceName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` text COLLATE utf8mb4_unicode_ci,
  `Cost` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`ServiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'عصب‌کشی','درمان ریشه دندان',1500000.00),(2,'جرم‌گیری','پاکسازی رسوبات و جرم',500000.00),(3,'ترمیم کامپوزیت','پر کردن با مواد همرنگ',850000.00),(4,'کشیدن دندان','خارج کردن دندان عفونی',400000.00),(5,'ایمپلنت','کاشت دندان دائمی تیتانیوم',12000000.00),(6,'ارتودنسی','ردیف کردن دندان‌ها',25000000.00),(7,'بلیچینگ','سفید کردن تخصصی دندان',2500000.00),(8,'روکش سرامیکی','پوشش محافظ دندان',3500000.00),(9,'ویزیت تخصصی','معاینه و طرح درمان',150000.00),(10,'جراحی لثه','اصلاح بافت لثه',5000000.00);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `StaffID` int NOT NULL,
  `FullName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PhoneNumber` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HireDate` date DEFAULT NULL,
  `Username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'احمد پناهی','09120000001','1400-01-01','admin','1234'),(2,'سپیده راد','09120000002','1400-02-15','sepideh','s123'),(3,'نیلوفر امینی','09120000003','1401-05-10','nilo','nilo99'),(4,'کامران شاد','09120000004','1401-06-01','kamran','k77'),(5,'ژاله ناصری','09120000005','1402-01-20','zhaleh','z123'),(6,'بابک رادمنش','09120000006','1402-03-05','babak','b90'),(7,'سیمین حیدری','09120000007','1402-04-12','simin','s55'),(8,'پویا نادری','09120000008','1402-05-20','pouya','p33'),(9,'نازنین عبدی','09120000009','1402-06-15','nazanin','n22'),(10,'فرهاد مجدی','09120000010','1402-07-01','farhad','f11');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17  9:35:03
