-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 17, 2016 at 07:07 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `student`
--

-- --------------------------------------------------------

--
-- Table structure for table `academicyear`
--

CREATE TABLE IF NOT EXISTS `academicyear` (
  `ID` int(10) unsigned NOT NULL,
  `acaYear` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `academicyear`
--

INSERT INTO `academicyear` (`ID`, `acaYear`) VALUES
(1, '2013'),
(2, '2014'),
(3, '2015'),
(4, '2016');

-- --------------------------------------------------------

--
-- Table structure for table `addmission`
--

CREATE TABLE IF NOT EXISTS `addmission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `studentId` varchar(45) DEFAULT NULL,
  `examid` varchar(45) DEFAULT NULL,
  `regno` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `addmission`
--

INSERT INTO `addmission` (`id`, `studentId`, `examid`, `regno`) VALUES
(2, '195', '3', '2014G0051'),
(3, '196', '4', '2014G0052'),
(4, '198', '5', '2014G0054'),
(5, '199', '6', '2014G0055'),
(6, '196', '7', '2014G0052'),
(7, '199', '8', '2014G0055'),
(8, '273', '9', '2016MA0017'),
(9, '199', '9', '2014G0055');

-- --------------------------------------------------------

--
-- Table structure for table `attendence`
--

CREATE TABLE IF NOT EXISTS `attendence` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `regNo` varchar(50) NOT NULL,
  `classId` varchar(50) NOT NULL,
  `attendTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=184 ;

--
-- Dumping data for table `attendence`
--

INSERT INTO `attendence` (`id`, `regNo`, `classId`, `attendTime`) VALUES
(93, '195', 'Physics_2014', '2013-07-09 22:51:08'),
(94, '198', 'Sinhala_2014', '2013-07-10 08:13:18'),
(95, '199', 'Java_2014', '2013-07-10 10:44:57'),
(96, '200', 'Physics_2014', '2013-07-13 22:47:34'),
(97, '199', 'ICT_2014', '2013-07-29 13:32:07'),
(98, '199', 'Physics_2014', '2013-08-03 13:32:46'),
(99, '195', 'Physics_2014', '2013-09-05 22:53:39'),
(100, '195', 'Physics_2014', '2013-11-03 13:07:16'),
(101, '195', 'Physics_2014', '2013-11-10 10:15:04'),
(102, '195', 'Physics_2014', '2013-11-20 09:17:33'),
(103, '195', 'Physics_2014', '2013-11-22 14:04:06'),
(104, '197', 'Physics_2014', '2016-03-02 22:46:04'),
(105, '270', 'Physics_2014', '2016-03-24 22:42:05'),
(106, '209', 'Physics_2014', '2016-03-24 22:46:09'),
(107, '196', 'ICT_2014', '2016-03-26 09:34:46'),
(108, '198', 'ICT_2014', '2016-03-26 09:35:27'),
(109, '199', 'ICT_2014', '2016-03-26 09:35:53'),
(110, '270', 'ICT_2014', '2016-03-26 09:36:13'),
(111, '199', 'ICT_2014', '2016-03-28 23:26:00'),
(112, '270', 'Physics_2014', '2016-03-28 23:40:36'),
(113, '272', 'Physics_2014', '2016-03-29 21:24:09'),
(114, '271', 'Physics_2014', '2016-03-29 21:24:31'),
(115, '271', 'Physics_2014', '2016-03-29 23:26:30'),
(116, '272', 'Physics_2014', '2016-03-29 23:42:09'),
(117, '207', 'Physics_2014', '2016-03-30 00:43:36'),
(118, '202', 'ICT_2014', '2016-03-30 00:46:38'),
(119, '272', 'Sinhala_2014', '2016-03-31 00:13:40'),
(120, '274', 'Physics_2014', '2016-04-01 11:33:49'),
(121, '274', 'Physics_2014', '2016-04-03 18:06:36'),
(122, '273', 'Physics_2014', '2016-04-03 18:40:05'),
(123, '270', 'Physics_2014', '2016-04-03 21:56:16'),
(124, '270', 'Physics_2014', '2016-04-04 19:49:57'),
(125, '271', 'Physics_2014', '2016-04-04 21:02:53'),
(126, '272', 'Physics_2014', '2016-04-04 22:24:09'),
(127, '273', 'Physics_2014', '2016-04-05 07:56:28'),
(128, '274', 'Physics_2014', '2016-04-05 08:09:11'),
(129, '270', 'Physics_2014', '2016-04-06 10:28:04'),
(130, '271', 'Physics_2014', '2016-04-06 10:38:07'),
(131, '273', 'Physics_2014', '2016-04-06 10:50:43'),
(132, '274', 'Physics_2014', '2016-04-06 11:04:47'),
(133, '209', 'Physics_2014', '2016-04-06 12:40:08'),
(134, '204', 'ICT_2014', '2016-04-06 12:41:00'),
(135, '200', 'Physics_2014', '2016-04-06 12:44:44'),
(136, '195', 'Physics_2014', '2016-04-06 12:47:58'),
(137, '196', 'Physics_2014', '2016-04-06 13:01:48'),
(138, '204', 'Physics_2014', '2016-04-06 20:52:09'),
(139, '209', 'Physics_2014', '2016-04-06 21:07:03'),
(140, '273', 'Physics_2014', '2016-04-06 22:06:12'),
(141, '271', 'Physics_2014', '2016-04-06 22:12:31'),
(142, '274', 'Physics_2014', '2016-04-06 22:16:05'),
(143, '274', 'Java_2014', '2016-04-08 09:11:47'),
(144, '271', 'ICT_2014', '2016-04-08 09:12:38'),
(145, '212', 'Sinhala_2014', '2016-04-08 09:13:21'),
(146, '273', 'Physics_2014', '2016-04-09 16:20:19'),
(147, '274', 'Java_2014', '2016-04-09 16:21:28'),
(148, '271', 'Java_2014', '2016-04-09 16:40:35'),
(149, '272', 'Sinhala_2014', '2016-04-09 16:43:10'),
(150, '274', 'Physics_2014', '2016-04-10 10:06:20'),
(151, '273', 'Java_2014', '2016-04-10 10:08:52'),
(152, '273', 'Physics_2014', '2016-04-10 20:03:31'),
(173, '275', 'Java_2014', '2016-06-08 16:58:45'),
(174, '274', 'Java_2014', '2016-06-08 17:00:12'),
(175, '273', 'Sinhala_2014', '2016-06-08 17:05:45'),
(176, '195', 'CS_2016', '2016-06-09 13:04:03'),
(177, '273', 'CS_2016', '2016-06-09 13:04:41'),
(178, '275', 'Java_2014', '2016-06-10 10:23:22'),
(179, '271', 'CS_2016', '2016-06-10 11:35:06'),
(180, '300', 'CS_2016', '2016-06-10 13:37:52'),
(181, '274', 'Physics_2014', '2016-06-10 13:38:26'),
(182, '273', 'Physics_2014', '2016-06-10 13:38:44'),
(183, '270', 'Java_2014', '2016-06-10 14:36:12');

-- --------------------------------------------------------

--
-- Table structure for table `calender`
--

CREATE TABLE IF NOT EXISTS `calender` (
  `Dte` varchar(45) NOT NULL,
  `Time` varchar(45) NOT NULL,
  `ClassCategory` varchar(100) NOT NULL,
  `LecturerName` varchar(100) NOT NULL,
  PRIMARY KEY (`Dte`,`Time`,`ClassCategory`,`LecturerName`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `classcategory`
--

CREATE TABLE IF NOT EXISTS `classcategory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `classId` varchar(45) NOT NULL,
  `lectureName` varchar(45) DEFAULT NULL,
  `subject` varchar(45) DEFAULT NULL,
  `Fee` decimal(20,2) DEFAULT '0.00',
  `paymentCategory` varchar(45) DEFAULT NULL,
  `startTime` varchar(45) DEFAULT NULL,
  `endTime` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `classcategory`
--

INSERT INTO `classcategory` (`id`, `classId`, `lectureName`, `subject`, `Fee`, `paymentCategory`, `startTime`, `endTime`) VALUES
(5, 'Physics_2014', 'Dinesh Hettiarachchi', 'Physics', '1000.00', 'M', '2013-07-08', '2013-07-20'),
(6, 'ICT_2014', 'Roshan Rolanka', 'ICT', '800.00', 'M', '2013-07-10', '2016-07-14'),
(7, 'Sinhala_2014', 'Ranil Prabath', 'Sinhala', '600.00', 'M', '2013-07-01', '2015-07-31'),
(8, 'Java_2014', 'Veranga ', 'Java', '1500.00', 'M', '2013-07-10', '2014-07-09'),
(9, 'CS_2016', 'Anuradha Prabhath', 'Matlab', '2000.00', 'M', '2016-06-20', '2016-08-19'),
(10, 'Java2', 'abcd', 'Java', '500.00', 'M', '2016-06-09', '2016-11-25');

-- --------------------------------------------------------

--
-- Table structure for table `classinfo`
--

CREATE TABLE IF NOT EXISTS `classinfo` (
  `classId` int(10) NOT NULL AUTO_INCREMENT,
  `Description` varchar(200) NOT NULL,
  `Subject` varchar(45) NOT NULL,
  `Stream` varchar(45) NOT NULL,
  `RegYear` varchar(45) NOT NULL,
  `WeekDay` varchar(45) NOT NULL,
  `StartTime` varchar(45) NOT NULL,
  `EndTime` varchar(45) NOT NULL,
  `ClassType` varchar(45) NOT NULL,
  PRIMARY KEY (`classId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `classlocation`
--

CREATE TABLE IF NOT EXISTS `classlocation` (
  `ID` int(10) unsigned NOT NULL,
  `Location` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `classyear`
--

CREATE TABLE IF NOT EXISTS `classyear` (
  `MyYear` varchar(45) NOT NULL,
  PRIMARY KEY (`MyYear`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `classyear`
--

INSERT INTO `classyear` (`MyYear`) VALUES
('2013'),
('2014'),
('2015'),
('2016');

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE IF NOT EXISTS `exams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `classid` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `examdate` varchar(45) DEFAULT NULL,
  `examStartTime` varchar(45) DEFAULT NULL,
  `examEndTime` varchar(45) DEFAULT NULL,
  `examnumber` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`id`, `classid`, `description`, `examdate`, `examStartTime`, `examEndTime`, `examnumber`) VALUES
(3, '5', 'Physics_2014', '2013-07-20', '08:00', '11:00', 'Physics_2014_T1'),
(4, '6', 'ICT_2014_Test1', '2013-07-26', '08:00', '11:00', 'ICT_2014_Test1'),
(5, '7', 'Sinhala_2014_T1', '2013-07-20', '10:00', '12:00', 'Sinhala_2014_T1'),
(6, '8', 'Java_2014_T1', '2013-07-25', '10:00', '12:00', 'Java_2014_T1'),
(7, '6', 'Term Test 2014', '2016-03-30', '08:00', '12:00', 'GIT'),
(8, '8', 'Pre test for term test', '2016-03-31', '13:00', '17:00', 'Pre Test'),
(9, '8', 'jkjkj', '2016-06-22', '07:10', '10:10', 'End sem'),
(10, '9', 'Mid Sem', '2016-06-30', '10:00', '12:00', 'CS_mid');

-- --------------------------------------------------------

--
-- Table structure for table `exam_marks`
--

CREATE TABLE IF NOT EXISTS `exam_marks` (
  `RegNo` varchar(45) NOT NULL,
  `classId` varchar(45) NOT NULL,
  `examNo` varchar(45) NOT NULL,
  `marks` double DEFAULT NULL,
  `SubjectNo` varchar(45) DEFAULT NULL,
  `Month` varchar(45) DEFAULT NULL,
  `Year` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`RegNo`,`classId`,`examNo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exam_marks`
--

INSERT INTO `exam_marks` (`RegNo`, `classId`, `examNo`, `marks`, `SubjectNo`, `Month`, `Year`) VALUES
('2014G0051', 'Physics_2014', 'Physics_2014T1', 60, NULL, NULL, NULL),
('2014G0054', 'Sinhala_2014', 'Sinhala_2014_T1', 75, NULL, NULL, NULL),
('2014G0055', 'ICT_2014', 'ICT_2014_Test1', 74, NULL, NULL, NULL),
('2014G0057', 'ICT_2014', 'ICT_2014_Test1', 70, NULL, NULL, NULL),
('2014G0057', 'Physics_2014', 'Physics_2014_T1', 88, NULL, NULL, NULL),
('2016EM0058', 'Java_2014', 'Physics_2014_T1', 80, NULL, NULL, NULL),
('2016MA0017', 'Physics_2014', 'Physics_2014_T1', 87, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `generateregno`
--

CREATE TABLE IF NOT EXISTS `generateregno` (
  `No` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Yer` varchar(45) NOT NULL,
  `Symbol` varchar(45) NOT NULL,
  PRIMARY KEY (`No`,`Yer`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10154 ;

--
-- Dumping data for table `generateregno`
--

INSERT INTO `generateregno` (`No`, `Yer`, `Symbol`) VALUES
(1000, '2012', 'M'),
(10022, '2012', 'V'),
(10023, '2012', 'V'),
(10024, '2012', 'XX'),
(10025, '2012', 'xx'),
(10026, '2012', 'V'),
(10027, '2012', 'V'),
(10028, '2012', 'V'),
(10029, '2012', 'V'),
(10030, '2012', 'V'),
(10031, '2012', 'V'),
(10032, '2012', 'V'),
(10033, '2012', 'V'),
(10034, '2012', 'V'),
(10035, '2012', 'V'),
(10036, '2012', 'V'),
(10037, '2012', 'V'),
(10038, '2012', 'V'),
(10039, '2012', 'V'),
(10040, '2012', 'V'),
(10041, '2012', 'V'),
(10042, '2012', 'V'),
(10043, '2012', 'V'),
(10044, '2012', 'V'),
(10045, '2012', 'V'),
(10046, '2012', 'V'),
(10047, '2012', 'V'),
(10048, '2012', 'V'),
(10049, '2012', 'V'),
(10050, '2012', 'V'),
(10051, '2012', 'V'),
(10052, '2012', 'V'),
(10053, '2012', 'V'),
(10054, '2012', 'V'),
(10055, '2012', 'V'),
(10056, '2012', 'V'),
(10057, '2012', 'V'),
(10058, '2012', 'V'),
(10059, '2012', 'V'),
(10060, '2012', 'V'),
(10061, '2012', 'V'),
(10062, '2012', 'V'),
(10063, '2012', 'V'),
(10064, '2012', 'V'),
(10065, '2012', 'V'),
(10066, '2012', 'V'),
(10067, '2012', 'V'),
(10068, '2012', 'V'),
(10069, '2012', 'V'),
(10070, '2012', 'V'),
(10071, '2012', 'V'),
(10072, '2012', 'V'),
(10073, '2012', 'V'),
(10074, '2012', 'V'),
(10075, '2012', 'V'),
(10076, '2012', 'V'),
(10077, '2012', 'M'),
(10078, '2012', 'M'),
(10079, '2012', 'M'),
(10080, '2012', 'M'),
(10081, '2012', 'M'),
(10082, '2012', 'M'),
(10083, '2012', 'M'),
(10084, '2012', 'M'),
(10085, '2012', 'M'),
(10086, '2012', 'M'),
(10087, '2012', 'M'),
(10088, '2012', 'M'),
(10089, '2012', 'M'),
(10090, '2012', 'M'),
(10091, '2012', 'M'),
(10092, '2012', 'M'),
(10093, '2012', 'M'),
(10094, '2012', 'M'),
(10095, '2012', 'M'),
(10096, '2012', 'M'),
(10097, '2012', 'M'),
(10098, '2012', 'M'),
(10099, '2012', 'M'),
(10100, '2012', 'M'),
(10101, '2012', 'M'),
(10102, '2012', 'M'),
(10103, '2012', 'M'),
(10104, '2012', 'M'),
(10105, '2012', 'M'),
(10106, '2012', 'M'),
(10107, '2012', 'M'),
(10108, '2012', 'M'),
(10109, '2012', 'M'),
(10110, '2012', 'M'),
(10111, '2012', 'M'),
(10112, '2012', 'M'),
(10113, '2012', 'M'),
(10114, '2012', 'M'),
(10115, '2012', 'M'),
(10116, '2012', 'M'),
(10117, '2012', 'M'),
(10118, '2012', 'M'),
(10119, '2012', 'M'),
(10120, '2012', 'M'),
(10121, '2012', 'M'),
(10122, '2012', 'M'),
(10123, '2012', 'M'),
(10124, '2012', 'M'),
(10125, '2012', 'M'),
(10126, '2012', 'M'),
(10127, '2012', 'M'),
(10128, '2012', 'M'),
(10129, '2012', 'M'),
(10130, '2012', 'M'),
(10131, '2012', 'M'),
(10132, '2012', 'M'),
(10133, '2012', 'M'),
(10134, '2012', 'M'),
(10135, '2012', 'M'),
(10136, '2012', 'M'),
(10137, '2012', 'M'),
(10138, '2012', 'M'),
(10139, '2012', 'M'),
(10140, '2012', 'M'),
(10141, '2012', 'M'),
(10142, '2012', 'M'),
(10143, '2012', 'M'),
(10144, '2012', 'M'),
(10145, '2012', 'M'),
(10146, '2012', 'M'),
(10147, '2012', 'M'),
(10148, '2012', 'M'),
(10149, '2012', 'M'),
(10150, '2012', 'M'),
(10151, '2012', 'M'),
(10152, '2012', 'M'),
(10153, '2012', 'M');

-- --------------------------------------------------------

--
-- Table structure for table `generateregnogalle`
--

CREATE TABLE IF NOT EXISTS `generateregnogalle` (
  `No` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Yer` varchar(45) NOT NULL,
  `Symbol` varchar(45) NOT NULL,
  PRIMARY KEY (`No`,`Yer`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=60 ;

--
-- Dumping data for table `generateregnogalle`
--

INSERT INTO `generateregnogalle` (`No`, `Yer`, `Symbol`) VALUES
(1, '2014', 'EM'),
(2, '2014', 'EM'),
(3, '2014', 'EM'),
(4, '2014', 'EM'),
(5, '2014', 'EM'),
(6, '2014', 'EM'),
(7, '2014', 'EM'),
(8, '2014', 'EM'),
(9, '2014', 'EM'),
(10, '2014', 'EM'),
(11, '2014', 'EM'),
(12, '2014', 'EM'),
(13, '2014', 'EM'),
(14, '2014', 'EM'),
(15, '2014', 'EM'),
(16, '2014', 'EM'),
(17, '2014', 'EM'),
(18, '2014', 'EM'),
(19, '2014', 'EM'),
(20, '2014', 'EM'),
(21, '2014', 'EM'),
(22, '2014', 'EM'),
(23, '2014', 'EM'),
(24, '2014', 'EM'),
(25, '2014', 'EM'),
(26, '2014', 'EM'),
(27, '2014', 'EM'),
(28, '2014', 'EM'),
(29, '2014', 'EM'),
(30, '2014', 'EM'),
(31, '2014', 'EM'),
(32, '2014', 'EM'),
(33, '2014', 'EM'),
(34, '2014', 'EM'),
(35, '2014', 'EM'),
(36, '2014', 'EM'),
(37, '2014', 'EM'),
(38, '2014', 'EM'),
(39, '2014', 'EM'),
(40, '2014', 'EM'),
(41, '2014', 'EM'),
(42, '2014', 'EM'),
(43, '2014', 'EM'),
(44, '2014', 'EM'),
(45, '2014', 'EM'),
(46, '2014', 'EM'),
(47, '2014', 'EM'),
(48, '2014', 'EM'),
(49, '2014', 'EM'),
(50, '2014', 'EM'),
(51, '2014', 'EM'),
(52, '2014', 'EM'),
(53, '2014', 'EM'),
(54, '2014', 'EM'),
(55, '2014', 'EM'),
(56, '2016', 'EM'),
(57, '2016', 'EM'),
(58, '2016', 'EM'),
(59, '2016', 'EM');

-- --------------------------------------------------------

--
-- Table structure for table `generateregnomatara`
--

CREATE TABLE IF NOT EXISTS `generateregnomatara` (
  `No` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Yer` varchar(45) NOT NULL,
  `Symbol` varchar(45) NOT NULL,
  PRIMARY KEY (`No`,`Yer`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `generateregnomatara`
--

INSERT INTO `generateregnomatara` (`No`, `Yer`, `Symbol`) VALUES
(1, '2012', 'M'),
(2, '2012', 'M'),
(3, '2014', 'M'),
(4, '2014', 'M'),
(5, '2014', 'M'),
(6, '2014', 'M'),
(7, '2016', 'MA'),
(8, '2016', 'MA'),
(9, '2016', 'MA'),
(10, '2016', 'MA'),
(11, '2016', 'MA'),
(12, '2016', 'MA'),
(13, '2016', 'MA'),
(14, '2016', 'MA'),
(15, '2016', 'MA'),
(16, '2016', 'MA'),
(17, '2016', 'MA'),
(18, '2016', 'MA'),
(19, '2016', 'MA'),
(20, '2015', 'MA'),
(21, '2015', 'MA'),
(22, '2015', 'MA'),
(23, '2015', 'MA'),
(24, '2016', 'MA'),
(25, '2016', 'MA'),
(26, '2016', 'MA'),
(27, '2016', 'MA'),
(28, '2016', 'MA'),
(29, '2016', 'MA'),
(30, '2016', 'MA');

-- --------------------------------------------------------

--
-- Table structure for table `generateregnotangalle`
--

CREATE TABLE IF NOT EXISTS `generateregnotangalle` (
  `No` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Yer` varchar(45) NOT NULL,
  `Symbol` varchar(45) NOT NULL,
  PRIMARY KEY (`No`,`Yer`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `generateregnotangalle`
--

INSERT INTO `generateregnotangalle` (`No`, `Yer`, `Symbol`) VALUES
(1, '2016', 'TA'),
(2, '2016', 'TA'),
(3, '2016', 'TA'),
(4, '2016', 'TA'),
(5, '20169', 'TA'),
(6, '2016', 'TA');

-- --------------------------------------------------------

--
-- Table structure for table `generateregnothissa`
--

CREATE TABLE IF NOT EXISTS `generateregnothissa` (
  `No` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Yer` varchar(45) NOT NULL,
  `Symbol` varchar(45) NOT NULL,
  PRIMARY KEY (`No`,`Yer`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `generateregnothissa`
--

INSERT INTO `generateregnothissa` (`No`, `Yer`, `Symbol`) VALUES
(1, '201456', 'TH'),
(2, '2016', 'TH');

-- --------------------------------------------------------

--
-- Table structure for table `iddetails`
--

CREATE TABLE IF NOT EXISTS `iddetails` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `createdTime` datetime NOT NULL,
  `addmission` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=192 ;

--
-- Dumping data for table `iddetails`
--

INSERT INTO `iddetails` (`ID`, `name`, `createdTime`, `addmission`) VALUES
(156, '113-6-9-20.pdf', '2013-07-09 21:20:38', 'Y'),
(157, '113-6-9-26.pdf', '2013-07-09 21:26:33', 'N'),
(158, '113-6-10-49.pdf', '2013-07-10 00:49:47', 'Y'),
(159, '113-6-10-55.pdf', '2013-07-10 00:55:59', 'Y'),
(160, '113-6-10-58.pdf', '2013-07-10 00:58:35', 'N'),
(161, '113-6-10-16.pdf', '2013-07-10 07:16:21', 'N'),
(162, '113-6-10-24.pdf', '2013-07-10 07:24:51', 'Y'),
(163, '113-6-10-25.pdf', '2013-07-10 07:25:05', 'Y'),
(164, '113-6-10-26.pdf', '2013-07-10 07:26:04', 'Y'),
(165, '113-6-10-35.pdf', '2013-07-10 07:35:12', 'Y'),
(166, '113-6-10-38.pdf', '2013-07-10 07:38:15', 'Y'),
(167, '113-6-10-39.pdf', '2013-07-10 07:39:47', 'Y'),
(168, '113-6-10-41.pdf', '2013-07-10 07:41:08', 'Y'),
(169, '113-6-10-44.pdf', '2013-07-10 07:44:53', 'Y'),
(170, '113-6-10-50.pdf', '2013-07-10 07:50:27', 'Y'),
(171, '113-6-10-42.pdf', '2013-07-10 10:42:39', 'N'),
(172, '113-6-10-49.pdf', '2013-07-10 10:49:45', 'Y'),
(173, '116-2-20-15.pdf', '2016-03-20 08:15:12', 'N'),
(174, '116-2-20-0.pdf', '2016-03-20 09:00:55', 'N'),
(175, '116-2-20-19.pdf', '2016-03-20 09:19:50', 'N'),
(176, '116-2-20-26.pdf', '2016-03-20 09:26:30', 'N'),
(177, '116-2-20-39.pdf', '2016-03-20 09:39:00', 'N'),
(178, '116-2-20-18.pdf', '2016-03-20 18:18:10', 'N'),
(179, '116-2-24-29.pdf', '2016-03-24 18:29:22', 'Y'),
(180, '116-2-24-37.pdf', '2016-03-24 18:37:30', 'Y'),
(181, '116-2-24-52.pdf', '2016-03-24 18:52:45', 'Y'),
(182, '116-3-1-38.pdf', '2016-04-01 11:38:32', 'N'),
(183, '116-3-1-39.pdf', '2016-04-01 11:39:23', 'Y'),
(184, '116-3-8-2.pdf', '2016-04-08 09:02:52', 'N'),
(185, '116-3-8-3.pdf', '2016-04-08 09:03:40', 'Y'),
(186, '116-3-9-54.pdf', '2016-04-09 07:54:57', 'N'),
(187, '116-5-8-40.pdf', '2016-06-08 08:40:02', 'N'),
(188, '116-5-8-22.pdf', '2016-06-08 17:22:23', 'Y'),
(189, '116-5-8-32.pdf', '2016-06-08 17:32:04', 'N'),
(190, '116-5-10-40.pdf', '2016-06-10 13:40:07', 'N'),
(191, '116-5-10-43.pdf', '2016-06-10 13:43:47', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `lecturer`
--

CREATE TABLE IF NOT EXISTS `lecturer` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `RegNo` varchar(45) NOT NULL,
  `classId` varchar(45) NOT NULL,
  `fee` varchar(45) NOT NULL,
  `payingMonth` varchar(45) NOT NULL,
  `PAYINGYEAR` varchar(45) NOT NULL,
  `paidDate` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `RegNo`, `classId`, `fee`, `payingMonth`, `PAYINGYEAR`, `paidDate`) VALUES
(8, '2014G0051', 'Physics_2014', '1000.0', 'July', '2013', '2013-07-09 00:00:00'),
(9, '2014G0052', 'ICT_2014', '800.0', 'August', '2013', '2013-07-10 00:00:00'),
(10, '2014G0054', 'Sinhala_2014', '600.0', 'August', '2013', '2013-07-10 00:00:00'),
(11, '2014G0055', 'Java_2014', '1500.0', 'August', '2013', '2013-07-10 00:00:00'),
(12, '2014G0053', 'Physics_2014', '1000.0', 'January', '2012', '2016-03-10 00:00:00'),
(13, '2016MA0014', 'Sinhala_2014', '600.0', 'January', '2012', '2016-03-24 00:00:00'),
(14, '2016MA0017', 'Physics_2014', '1000.0', 'April', '2016', '2016-04-05 00:00:00'),
(15, '2014EM0002', 'CS_2016', '1000.0', 'June', '2016', '2016-06-07 00:00:00'),
(16, '2016MA0017', 'CS_2016', '1000.0', 'June', '2016', '2016-06-07 00:00:00'),
(17, '2016MA0019', 'CS_2016', '2000.0', 'June', '2016', '2016-06-08 00:00:00'),
(18, '2016MA0019', 'Physics_2014', '1000.0', 'January', '2012', '2016-06-08 00:00:00'),
(19, '2016MA0017', 'Java_2014', '1500.0', 'June', '2016', '2016-06-08 00:00:00'),
(20, '2016EM0059', 'CS_2016', '2000.0', 'June', '2016', '2016-06-10 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `relatedsubjectforstream`
--

CREATE TABLE IF NOT EXISTS `relatedsubjectforstream` (
  `streamid` varchar(10) NOT NULL,
  `subjectid` varchar(45) NOT NULL,
  PRIMARY KEY (`streamid`,`subjectid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sampleregno`
--

CREATE TABLE IF NOT EXISTS `sampleregno` (
  `Location` varchar(45) NOT NULL DEFAULT '',
  `Yer` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`Location`,`Yer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sampleregno`
--

INSERT INTO `sampleregno` (`Location`, `Yer`) VALUES
('Matara', 'null');

-- --------------------------------------------------------

--
-- Table structure for table `stream`
--

CREATE TABLE IF NOT EXISTS `stream` (
  `streamId` varchar(45) NOT NULL DEFAULT '',
  `streamName` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`streamId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `studentidlocation`
--

CREATE TABLE IF NOT EXISTS `studentidlocation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `docNo` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `attendTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `studentinfo`
--

CREATE TABLE IF NOT EXISTS `studentinfo` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `REGNO` varchar(45) DEFAULT NULL,
  `FULLNAME` varchar(400) DEFAULT NULL,
  `INITIALS` varchar(45) DEFAULT NULL,
  `LASTNAME` varchar(200) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `ADDRESS` varchar(500) DEFAULT NULL,
  `DISTRICT` varchar(100) DEFAULT NULL,
  `MOBILE` varchar(15) DEFAULT NULL,
  `EMAIL` varchar(200) DEFAULT NULL,
  `ALYEAR` varchar(10) DEFAULT NULL,
  `SEX` varchar(10) DEFAULT NULL,
  `NIC` varchar(10) DEFAULT NULL,
  `TITLE` varchar(45) DEFAULT NULL,
  `STATUS` varchar(10) DEFAULT NULL,
  `STU_IMAGE` mediumblob,
  `IMG_NAME` varchar(300) DEFAULT NULL,
  `FatherName` varchar(200) DEFAULT NULL,
  `FatherJob` varchar(100) DEFAULT NULL,
  `FatherPhone` varchar(45) DEFAULT NULL,
  `MotherName` varchar(200) DEFAULT NULL,
  `MotherJob` varchar(100) DEFAULT NULL,
  `MotherPhone` varchar(45) DEFAULT NULL,
  `SubjectStream` varchar(45) DEFAULT NULL,
  `School` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=302 ;

--
-- Dumping data for table `studentinfo`
--

INSERT INTO `studentinfo` (`ID`, `REGNO`, `FULLNAME`, `INITIALS`, `LASTNAME`, `DOB`, `ADDRESS`, `DISTRICT`, `MOBILE`, `EMAIL`, `ALYEAR`, `SEX`, `NIC`, `TITLE`, `STATUS`, `STU_IMAGE`, `IMG_NAME`, `FatherName`, `FatherJob`, `FatherPhone`, `MotherName`, `MotherJob`, `MotherPhone`, `SubjectStream`, `School`) VALUES
(195, '840983277', 'Veranga Sooriyabandara', '07-APR-1984', 'Male', NULL, '66A Ovitigamuwa Puhulwella', 'Matara', NULL, 'vsooriyabandara@gmail.com', '', NULL, '840983277V', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mathematics', ' '),
(196, '2014G0052', 'Hoshani Wijelath Arachchi', '11-JUL-1985', 'Female', NULL, 'No 3 Victoriya Gardens Kirinda', 'Ampara', '0773339865', 'hoshi@gmail.com', '', NULL, '850983277V', NULL, NULL, NULL, NULL, 'Kumara Gunadasa', 'Teacher', '0767893241', 'Sriyani Chandralatha', 'Teacher', '0765431245', 'Mathematics', ' Southlands College Galle'),
(197, '2014G0053', 'Hoshani Wijelath Arachchi', '11-JUL-1985', 'Female', NULL, 'No 3 Victoriya Gardens Kirinda', 'Ampara', '0773339865', 'hoshi@gmail.com', '', NULL, '850983277V', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mathematics', ' '),
(198, '2014G0054', 'Dimuthu Lakmal', '04-JUL-1995', 'Male', NULL, 'New Town Embilipitiya', 'Gampaha', NULL, 'dimuthu@yahoo.com', '', NULL, '900876544V', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mathematics', ' '),
(199, '2014G0055', 'Saman Kumara', '15-SEP-1988', 'Male', NULL, 'New Town , Colombo 04', 'Ampara', '0713557555', 'saman@yahoo.com', '', NULL, '888888888V', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ICT', ' '),
(200, '2014G0056', 'Amila  ABC', '13-JUL-2013', 'Male', NULL, 'Address', 'Matara', '0715823316', 'vera@gmail.com', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Commerce', ' '),
(201, '2014G0057', 'veranga Sooriyabandara', '15-SEP-1990', 'Male', NULL, 'Sumira Ovitigamuwa Puhulwella', 'District', '0773339865', 'veranga@bcsc.lk', '', NULL, '840983277V', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ICT', ' '),
(202, '2014G0058', 'Veranga Sooriyabandara', '07-NOV-2013', 'Female', NULL, 'Sumira Ovitigamuwa Puhulwella', 'Matara', '0784335678', 'veranga@bcsc.lk', '', NULL, '888888866V', NULL, NULL, NULL, NULL, 'Father Name', 'Teacher', '773339865', 'Mother Name', 'Mother job', '713557555', 'Art', ' 0784567789'),
(203, '2014M0006', 'v', '10-NOV-2013', 'Male', NULL, 'a', 'Hambantota', '773339865', '', '', NULL, '', NULL, NULL, NULL, NULL, '', '', '', '', '', '', 'Commerce', ' '),
(204, '2015T0003', 'Hoshani ransi', '05-NOV-1985', 'Female', NULL, 'Kirinda', 'Matara', '0773339865', '', '', NULL, '850983277V', NULL, NULL, NULL, NULL, '', '', '', '', '', '', 'Science', ''),
(205, '2015T0004', 'Vera Test', '16-NOV-1990', 'Male', NULL, 'Sumira Ovitigamuwa', 'Hambantota', '0713557555', 'vsooriyabandara@gmail.com', '', NULL, '878787988V', NULL, NULL, NULL, NULL, 'FN', 'FJ', 'FP', 'MN', 'MJ', 'MP', 'Art', ''),
(206, 'nullT0005', 'Full Name', '14-NOV-2013', 'Male', NULL, 'Address', 'Hambantota', '0773339865', '', '', NULL, '888888888V', NULL, NULL, NULL, NULL, 'FN', 'FJ', 'FP', 'MN', 'MJ', 'MP', 'Languages', ''),
(207, '2014T0006', 'Full ', '01-NOV-2013', 'Male', NULL, 'Add', 'Galle', '0773339865', 'veranga@bcsc.lk', '', NULL, '999999999V', NULL, NULL, NULL, NULL, 'FN', 'FJ', 'FP', 'MN', 'MJ', 'MP', 'Art', ''),
(208, '2014T0007', 'F', '01-NOV-2013', 'Male', NULL, 'A', 'Hambantota', '0775556789', '', '', NULL, '', NULL, NULL, NULL, NULL, 'FN', 'FJ', 'FP', 'MN', 'MJ', 'MP', 'Art', ''),
(209, '2014EM0001', 'VERANGA SOORIYABANDARA', '06-NOV-2013', 'Male', NULL, 'Address', 'Ratnapura', NULL, '', '', NULL, '888888888N', NULL, NULL, NULL, NULL, 'FN', 'FJ', 'FP', 'MN', 'MJ', 'MP', 'Commerce', NULL),
(210, '2014EM0002', 'FN', '01-NOV-2013', 'Male', NULL, 'ADDRESS', 'Ratnapura', '0783675656', '', '', NULL, '777777777V', NULL, NULL, NULL, NULL, 'FN', 'FJ', 'fp', 'MN', 'MJ', 'mp', 'Commerce', 'KANUMULDENIYA MV'),
(211, '2014EM0003', 'FN', '07-APR-1984', 'Male', NULL, '', 'Galle', '', '', '', NULL, '840983277V', NULL, NULL, NULL, NULL, '', '', '', '', '', '', 'stream', ''),
(212, '2014EM0004', 'HOSHANI RANSI WANAMALI WIJELATHARACHCHI', '05-NOV-1985', 'Female', NULL, 'PUHUGAHAKORATUWA OVITIGAMUWA PUHULWELLA', 'Matara', '0783861242', 'HOSHANI@GMAIL.COM', '', NULL, '858103339V', NULL, NULL, NULL, NULL, 'GUNARATHNA WIJELATHARACHCHI', 'SUBJECT MATTER OFFICER', '0412287629', 'KANTHI HEWAGE', '', '', 'Science', 'KANUMULDENIYA MV'),
(270, '2016MA0014', 'SAMAN KAMALANATH', '28-FEB-1990', 'Male', NULL, 'AKURAMBODA, PALLEPOLA', 'Galle', '0713235567', 'ANPRABHATH@GMAIL.COM', '', 'Male', '900595115v', NULL, NULL, NULL, NULL, 'BANDARA KAMALANATH', 'BANK OFFICER', '0789956435', 'PAVITRA SAMARAKOON', 'TEACHER', '0785564312', 'Agriculture', 'WEERA KEPPETIPOLA NATIONAL COLLEGE'),
(271, '2016MA0015', 'HARSHA KARUNATISSA', '28-FEB-1993', 'Male', NULL, 'BINGIRIYA, KURUNEGALA', 'Hambantota', '07123456781', 'ANPRABHATH@GMAIL.COM', '', 'Male', '930593214v', NULL, NULL, NULL, NULL, 'SAMAN SAMARASINGHE', 'TEACHER', '0762341567', 'CHITRA SUMANAPALA', 'TEACHER', '0768904532', 'Mathematics', 'MALIYADEWA COLLEGE, KURUNEGALA'),
(272, '2016MA0016', 'NILUKA PIYASINGHE', '01-FEB-1994', 'Male', NULL, 'PALAPATWALA, MATALE', 'Galle', '0719856378', 'ANURADHE.PRABHATH@GMAIL.COM', '', 'Male', '940324556v', NULL, NULL, NULL, NULL, 'SUNIL PIYASINGHE', 'DOCTOR', '0763245578', 'LAKMINI PIYASINGHE', 'TEACHER', '0768904456', 'Mathematics', 'ST.THOMAS COLLEGE, MATALE'),
(273, '2016MA0017', 'THARINDU DARSHANA`', '20-MAR-1992', NULL, NULL, 'RATHNAPURA', 'Ratnapura', '0763238866', 'ANPRABHATH@GMAIL.COM', '', 'Male', '920684225v', NULL, NULL, NULL, NULL, 'THILINA SUBASINGHE', 'TEACHER', '0758962255', 'PRIYANTHI SUBASINGHE', 'TEACHER', '0762239683', 'Mathematics', 'SIVALI CENTRAL COLLEGE'),
(274, '2016MA0018', 'ANURADHA DHANANJAYA', '07-FEB-1991', 'Male', NULL, 'MAWANELLA, KEGALLE', 'Galle', '0789007856', 'ANPRABHATH@GMAIL.COM', '', 'Male', '910384345v', NULL, NULL, NULL, NULL, 'SUNIL BANDARA', 'TEACHER', '0768943322', 'SRIYANI BANDARA', 'TEACHER', '0768899564', 'Science', 'DHARMARAJA COLLEGE'),
(275, '2016MA0019', 'SALINDA KUMARA MALALGODA', '18-FEB-1987', NULL, NULL, 'NO: 55, BEACH ROAD, COLOMBO 03', 'Matara', '0710429236', 'SALINDA@GMAIL.COM', '', 'Male', '880493114v', NULL, NULL, NULL, NULL, 'SARANGA MALALGODA', 'TEACHER', '0780429236', 'SHWETHA MALALGODA', 'None', '0780529336', 'Agriculture', 'ROYAL COLLEGE'),
(292, '2016EM0058', 'GAYAN', '18-FEB-1984', NULL, NULL, 'MATALE', 'Embilipitiya', '0710429236', 'gmherath@gmail.com', '', 'Male', '840493114v', NULL, NULL, NULL, NULL, '', '', '', '', '', '', 'stream', ''),
(300, '2016EM0059', 'PRABHATH', '18-FEB-1992', NULL, NULL, 'MATALE', 'Embilipitiya', '', 'anuradhe.prabhath@gmail.com', '', 'Male', '920493114v', NULL, NULL, NULL, NULL, '', '', '', '', '', '', 'Commerce', ''),
(301, '2016MA0030', 'GAYAN MADHURA', '17-NOV-1984', NULL, NULL, 'MATALE', 'Matara', '', 'gmherath@gmail.com', '', 'Male', '843223745V', NULL, NULL, NULL, NULL, '', '', '', '', '', '', 'stream', '');

-- --------------------------------------------------------

--
-- Table structure for table `student_class`
--

CREATE TABLE IF NOT EXISTS `student_class` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `studentId` int(10) unsigned NOT NULL,
  `classId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `student_class`
--

INSERT INTO `student_class` (`id`, `studentId`, `classId`) VALUES
(9, 195, 5),
(10, 196, 6),
(11, 198, 7),
(12, 199, 8),
(13, 285, 8),
(14, 274, 5),
(15, 274, 8),
(16, 292, 5),
(17, 292, 8),
(18, 300, 9);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE IF NOT EXISTS `subject` (
  `subjectid` varchar(45) NOT NULL,
  `subjectName` varchar(100) NOT NULL,
  PRIMARY KEY (`subjectid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `s_month`
--

CREATE TABLE IF NOT EXISTS `s_month` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `month` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `s_month`
--

INSERT INTO `s_month` (`id`, `month`) VALUES
(1, 'JANUARY'),
(2, 'FEBRUARY'),
(3, 'MARCH'),
(4, 'APRIL'),
(5, 'MAY'),
(6, 'JUNE'),
(7, 'JULY'),
(8, 'AUGUST'),
(9, 'SEPTEMBER'),
(10, 'OCTOBER'),
(11, 'NOVEMBER'),
(12, 'DECEMBER');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `USERNAME` varchar(45) NOT NULL DEFAULT '',
  `PASSWORD` varchar(60) DEFAULT '',
  `USERROLE` varchar(45) DEFAULT '',
  `CREATEDBY` varchar(45) DEFAULT '',
  `CDATE` date DEFAULT NULL,
  PRIMARY KEY (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`USERNAME`, `PASSWORD`, `USERROLE`, `CREATEDBY`, `CDATE`) VALUES
('', '', 'System', 'admin', '2016-03-20'),
('admin', 'admin123', 'administrator', 'soori', '2012-08-08'),
('admin2', 'admin2', 'Administrator', 'admin', '2016-06-07'),
('anuradha', 'cdef', 'System', 'admin', '2016-03-20'),
('gayan', 'gayan', 'System', 'admin', '2012-12-30'),
('hoshi', 'hoshi', 'Administrator', 'admin', '2012-12-30'),
('suser', 'suser', 'System', 'admin', '2016-06-10'),
('user1', '12345', 'System', 'admin', '2016-06-10');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
