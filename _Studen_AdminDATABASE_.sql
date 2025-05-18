-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 18, 2025 at 08:20 PM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `400011200`
--

-- --------------------------------------------------------

--
-- Table structure for table `advisoremail`
--

DROP TABLE IF EXISTS `advisoremail`;
CREATE TABLE IF NOT EXISTS `advisoremail` (
  `Email` varchar(50) DEFAULT NULL,
  `StaffAdvisorID` varchar(10) DEFAULT NULL,
  KEY `StaffAdvisorID` (`StaffAdvisorID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `advisoremail`
--

INSERT INTO `advisoremail` (`Email`, `StaffAdvisorID`) VALUES
('testuser1@example.com ', 'SA001\r'),
('testuser2@example.com', 'SA001\r'),
('testuser3@example.com  ', 'SA001\r'),
('sampleemail2@example.com   ', 'SA002\r'),
('placeholder3@example.com  ', 'SA005\r'),
('dbtestuser4@example.com', 'SA004\r'),
('testemail5@example.com ', 'SA007\r'),
('fakeuser6@example.com  ', 'SA008\r'),
('fakeuser67@example.com  ', 'SA009\r'),
('testing7@example.com  ', 'SA010\r'),
('devuser8@example.com    ', 'SA011\r'),
('example9@example.com    ', 'SA012\r'),
('exame9@example.com    ', 'SA012\r'),
('databasetest10@example.com  ', 'SA014\r');

-- --------------------------------------------------------

--
-- Table structure for table `club`
--

DROP TABLE IF EXISTS `club`;
CREATE TABLE IF NOT EXISTS `club` (
  `ClubID` varchar(20) DEFAULT NULL,
  `StaffAdvisorID` varchar(10) DEFAULT NULL,
  `ClubName` varchar(50) DEFAULT NULL,
  `MeetingDays` varchar(12) DEFAULT NULL,
  `MeetingTimes` varchar(20) DEFAULT NULL,
  `MeetingLocation` varchar(10) DEFAULT NULL,
  `Fees` varchar(10) DEFAULT NULL,
  `ClubStatus` varchar(10) DEFAULT NULL,
  `ClubDescription` varchar(256) DEFAULT NULL,
  `MembershipSize` int DEFAULT NULL,
  `RequiredEquipmentandMaterials` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `club`
--

INSERT INTO `club` (`ClubID`, `StaffAdvisorID`, `ClubName`, `MeetingDays`, `MeetingTimes`, `MeetingLocation`, `Fees`, `ClubStatus`, `ClubDescription`, `MembershipSize`, `RequiredEquipmentandMaterials`) VALUES
('CID001', 'SA001', 'Art History Club', 'Mondays', '3:30pm - 4:30pm', 'CR001', '$5.00 ', 'Active', 'This is a club where you can analyze and present historic artistic masterpieces and hold discussions on the subject of art history. You will also get to discuss and practice techniques that art historians use to preserve valuable pieces of art.', 20, 'NULL\r'),
('CID002', 'SA002', 'Photography Club', 'Wednesdays ', '12:00pm - 12:45pm', 'CR002', '$10.00 ', 'Active', '\"If you’re interested in snapping photos or if you have a fancy camera that you don’t know how to use, photography club is for you. You could talk with fellow team members about how to take a great photo and how to analyze famous photos. \"', 25, 'CAMERA\r'),
('CID003', 'SA003', 'Cermaics Club', 'Thursdays', '3:00pm - 4:00pm', 'CR003', '$20.00 ', 'Inactive', '\" If you’re interested in forming art from clay, stone, and other molding materials, a ceramics club could be for you. In this club, you can discuss how pottery has changed throughout history, from Ancient Greece to today.\"', 10, 'NULL\r'),
('CID004', 'SA004', 'Literary Magazine Club', 'Tuesdays', '12:00pm - 12:45pm', 'CR004', '$10.00 ', 'Active', '\"This is a great way for students to combine interests in both the arts and journalism.In this club, you’ll work with a team to select student work and to encourage students to play with different themes or subjects throughout the year.\"', 10, 'NULL\r'),
('CID005', 'SA005', 'Drama Club ', 'Mondays', ' 4:00pm - 5:00pm', 'MNH', '$5.00 ', 'Inactive', '\"If you want the opportunity to act and practice your interpretation skills with a group, this is the club to join. You may get to audition for and star in plays for your school, and perhaps might even participate in acting competitions.\"', 30, 'NULL\r'),
('CID006', 'SA006', 'Improv Club', 'Fridays', '12:00pm - 12:45pm', 'MNH', '$5.00 ', 'Active', '\" People who do improv and participate in improv performances and competitions say it’s one of the most fun activities they do. By joining this club, you’ll learn how to think on your feet and become comfortable with presenting in front of an audience.\"', 30, 'NULL\r'),
('CID007', 'SA007', 'Film Club ', 'Thursdays', '12:00pm -12:45pm', 'CR007', '$5.00 ', 'Active', '\"This is the club for people who love to watch movies, and for those who want to become a director or be a part of the film industry one day. Through film club, you may get to watch great films as well as create your own film productions.\"', 30, 'NULL\r'),
('CID008', 'SA008', 'Science Olympiad ', 'Tuesdays', '3:30pm - 4:30pm', 'CR008', '$5.00 ', 'Active', '\"If you want to go into science or if science really interests you, consider putting your knowledge into a competition with the Science Olympiad. This club will be a great way for you to pick up some material and get ahead in your science classes. \"', 10, 'NULL\r'),
('CID009', 'SA009', 'Speech and Debate Club', 'Fridays', '12:00pm - 12:45pm', 'CR009', '$0.00 ', 'Active', '\"If you want to get good at public speaking, reporting on current events, and making effective arguments, speech and debate is the club for you. Through this club, you’ll have the opportunity to compete in a variety of events such as 45-minute debates.\"', 20, 'NULL\r'),
('CID010', 'SA010', 'Mathletes ', 'Wednesdays ', '12:00pm - 12:45pm', 'CR010', '$5.00 ', 'Inactive', '\" If math, statistics, or numbers in general spark your interest, consider working with them competitively by joining Mathletes.\"', 20, 'NULL\r'),
('CID011', 'SA011', 'History Club ', 'Thursdays', '12:00pm - 12:45pm', 'CR011', '$10.00 ', 'Active', '\"If you’re a history buff, consider joining a club dedicated to the subject. Through history club, you’ll get to learn about and discuss important historical eras and events. You even get to take trips down to famous historical sites to visualize history.\"', 25, 'NULL\r'),
('CID012', 'SA012', 'Foreign Language Club ', 'Tuesdays', '3:00pm - 4:00pm', 'CR012', '$5.00 ', 'Active', '\"Every high school student is required to learn a foreign language, and what better way to get better at a foreign language than to immerse yourself in it through a club? In this club we will discuss various topics in foriegn languages.\"', 25, 'NULL\r'),
('CID013', 'SA013', 'Yearbook Club ', 'Fridays', '3:00pm - 4:00pm', 'CR013', '$20.00 ', 'Active', '\"As a member of the yearbook club, you’ll document your fellow students doing amazing things throughout the year, and your reports will be put in print for the entire school to see. This club will give you something great to show for your efforts.\"', 10, 'NULL\r'),
('CID014', 'SA014', 'Academic Decathalon ', 'Mondays', '12:00pm - 12:45pm', 'CR014', '$5.00 ', 'Active', '\" Academic Decathlons are competitions where students are tested in a variety of academic subjects via multiple choice tests, performance events, and an essay. You get to work in a team, and you can compete no matter what your grades and GPA are.\"', 10, 'NULL\r'),
('CID015', 'SA015', 'Multicultural Club', 'Wednesdays ', '3:30pm - 4:30pm', 'CR015', '$0.00 ', 'Inactive', 'Multicultural Club is a great way for students to meet others who may come from diverse backgrounds. Students can bring various cultural artefacts. Joining Multicultural Club is a great way to orient yourself with other perspectives and cultures.', 30, 'NULL\r'),
('CID016', 'SA001', 'International Club', 'Mondays', '12:00pm - 12:45pm', 'CR016', '$0.00 ', 'Active', '\"Outside of history class, there is probably no better way to learn about other countries and their histories, cultures, and traditions. Members will meet new people, learn new foreign languages, celebrate new holidays, and expand their horizons.\"', 30, 'NULL\r'),
('CID017', 'SA002', 'Music Club', 'Wednesdays ', '3:00pm - 4:00pm', 'MSR', '$10.00 ', 'Active', '\"One of the most overlooked extracurricular topics students can explore is music.  Music Club is a great way to stimulate interest in the arts in an accessible manner. After all, music is called the universal language, so why not learn about it?\"', 20, 'INSTRUMENT OF CHOICE\r'),
('CID018', 'SA003', 'Fashion Club ', 'Fridays', '4:00pm - 5:00pm', 'CTR', '$20.00 ', 'Inactive', '\"Getting involved in Fashion Club is a great way to explore and grow an interest in the fashion industry. In Fashion Club, students can discuss fashion-heavy events, and look through books filled with fashion history.\"', 20, 'FABRIC \r'),
('CID019', 'SA004', 'Chess Club ', 'Tuesdays', '12:00pm - 12:45pm', 'CR019', '$5.00 ', 'Active', '\"Chess is a game that requires strategy, careful thinking, and practice. By joining the chess club, you’ll learn new strategies to beat your opponents and have the opportunity to practice playing against other students, giving you a fun challenge. \"', 20, 'NULL\r'),
('CID020', 'SA005', 'Anime Club ', 'Thursdays', '3:30pm - 4:30pm', 'CR020', '$0.00 ', 'Active', '\"If you’re an anime fanatic, here is your opportunity to participate in a fandom with your classmates. In this club, you’ll be able to watch all of your favorite anime, attend some anime conventions as a group, and maybe even draw some anime characters!\"', 20, 'NULL\r'),
('CID021', 'SA006', 'Video Game Club ', 'Fridays', '12:00pm - 12:45pm', 'CR021', '$10.00 ', 'Active', '\"If playing video games is your favorite pastime, a video game club may be perfect for you. You will have the opportunity to play the games you love and learn about some new games.\"', 30, 'NULL\r'),
('CID022', 'SA007', 'Religion Club ', 'Wednesdays ', '12:00pm - 12:45pm', 'CR022', '$0.00 ', 'Inactive', '\"Through this club, you will be able to engage in sophisticated discussions about religions and their texts, and also participate in school-held religious festivals, celebrations, and rituals with the club.\"', 30, 'NULL\r'),
('CID023', 'SA008', 'Outdoor Club ', 'Saturdays', '9:00am - 3:00pm', 'PKL', '$20.00 ', 'Active', 'Add some adventure to your high school career by joining a club that focuses on outdoor activities. You’ll get to engage in some fun outdoor physical activities with some great classmates who share the same sense of adventure.', 20, 'TENT AND OUTDOOR SUPPLIES\r'),
('CID024', 'SA009', 'Book Club', 'Tuesdays', '12:00pm - 12:45pm', 'LIB', '$20.00 ', 'Active', '\"If you enjoy reading and want to make sure that your busy schedule doesn’t prevent you from engaging with good literature, join book club. You’ll be able to engage in critical discussions of each book.\"', 20, 'NULL\r'),
('CID025', 'SA010', 'Creative Writing Club', 'Thursdays', '12:00pm - 12:45pm', 'CR025', '$10.00 ', 'Inactive', '\"Want to write short stories or novels? A creative writing club is a good place for you to start. By joining this club, you’ll see your writing skills really improve as you practice writing constantly and receive helpful feedback from your peers.\"', 10, 'NULL\r'),
('CID026', 'SA011', 'Robotics Club', 'Fridays', '3:30pm - 4:30pm', 'CSR', '$30.00 ', 'Active', '\"Robotics professionals are in high demand in today’s tech companies, where machine learning and artificial intelligence are hot topics. If you have a passion in this field robotics club could set you up for a lucrative career in the future.\"', 20, 'NULL\r'),
('CID027', 'SA012', 'Cooking Club ', 'Mondays', '4:00pm - 5:00pm', 'FNR', '$30.00 ', 'Active', '\"For emerging foodies, Cooking Club is an opportunity to build a repertoire of culinary skills alongside your friends. Each week club members will engage in a friendly competition to see who can cook the best dish. \"', 20, 'NULL\r'),
('CID028', 'SA013', 'Glee Club', 'Wednesdays ', '4:00pm - 5:00pm', 'MSR', '$10.00 ', 'Inactive', '\"Glee Club is an outlet for students interested in music to perform in different capacities, usually entailing a large ensemble covering and singing popular songs.  The songs will be chosen by students, giving them a chance to be creative.\"', 30, 'NULL\r'),
('CID029', 'SA014', 'Key Club', 'Saturdays', '4:00pm - 5:00pm', 'PKL', '$20.00 ', 'Active', '\"By joining the Key Club, you’ll get to engage in various volunteering and charity events in your school and local community.In Key Club you’ll get to meet new people and give back to your community in the process.\"', 30, 'NULL\r'),
('CID030', 'SA015', 'Environment  Club ', 'Saturdays', '12:00pm - 3:30pm', 'PKL', '$20.00 ', 'Active', '\"If saving Mother Earth is something you’re passionate about, consider joining an environment club, where you will get to engage in various projects to help clean up the local community. Examples of activities include cleaning up beaches, recycling.\"', 20, 'NULL\r');

-- --------------------------------------------------------

--
-- Table structure for table `clubmembership`
--

DROP TABLE IF EXISTS `clubmembership`;
CREATE TABLE IF NOT EXISTS `clubmembership` (
  `StudentID` varchar(10) NOT NULL,
  `ClubID` varchar(10) NOT NULL,
  `ClubPayment` varchar(10) DEFAULT NULL,
  `SubscriptionStatus` varchar(10) NOT NULL,
  `RegisterID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`StudentID`,`ClubID`,`SubscriptionStatus`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `clubmembership`
--

INSERT INTO `clubmembership` (`StudentID`, `ClubID`, `ClubPayment`, `SubscriptionStatus`, `RegisterID`) VALUES
('SS001', 'CID001', 'Paid', 'Active', 'RID001\r'),
('SS001', 'CID002', 'Not Paid', 'Inactive', 'RID002\r'),
('SS002', 'CID003', 'Paid', 'Active', 'RID003\r'),
('SS002', 'CID004', 'Paid', 'Active', 'RID004\r'),
('SS003', 'CID005', 'Paid', 'Active', 'RID005\r'),
('SS003', 'CID006', 'Not Paid', 'Active', 'RID006\r'),
('SS003', 'CID007', 'Paid', 'Active', 'RID007\r'),
('SS004', 'CID008', 'Paid', 'Active', 'RID008\r'),
('SS004', 'CID009', 'Paid', 'Active', 'RID009\r'),
('SS005', 'CID010', 'Paid', 'Active', 'RID010\r'),
('SS006', 'CID011', 'Not Paid', 'Inactive', 'RID011\r'),
('SS007', 'CID012', 'Paid', 'Active', 'RID012\r'),
('SS008', 'CID013', 'Paid', 'Active', 'RID013\r'),
('SS008', 'CID014', 'Not Paid', 'Active', 'RID014\r'),
('SS009', 'CID015', 'Paid', 'Inactive', 'RID015\r'),
('SS009', 'CID016', 'Paid', 'Active', 'RID016\r'),
('SS009', 'CID017', 'Paid', 'Active', 'RID017\r'),
('SS010', 'CID018', 'Paid', 'Active', 'RID018\r'),
('SS011', 'CID019', 'Not Paid', 'Inactive', 'RID019\r'),
('SS012', 'CID020', 'Paid', 'Active', 'RID020\r'),
('SS013', 'CID021', 'Paid', 'Active', 'RID021\r'),
('SS013', 'CID022', 'Paid', 'Active', 'RID022\r'),
('SS015', 'CID023', 'Paid', 'Active', 'RID023\r'),
('SS015', 'CID024', 'Paid', 'Active', 'RID024\r'),
('SS015', 'CID025', 'Not Paid', 'Inactive', 'RID025\r'),
('SS017', 'CID026', 'Paid', 'Active', 'RID026\r'),
('SS017', 'CID027', 'Paid', 'Active', 'RID027\r'),
('SS017', 'CID028', 'Not Paid', 'Active', 'RID028\r'),
('SS018', 'CID029', 'Paid', 'Active', 'RID029\r'),
('SS019', 'CID030', 'Not Paid', 'Inactive', 'RID030\r'),
('SS020', 'CID001', 'Paid', 'Active', 'RID031\r'),
('SS021', 'CID002', 'Paid', 'Active', 'RID032\r'),
('SS022', 'CID003', 'Not Paid', 'Inactive', 'RID033\r'),
('SS022', 'CID004', 'Paid', 'Active', 'RID034\r'),
('SS022', 'CID005', 'Paid', 'Active', 'RID035\r'),
('SS023', 'CID006', 'Not Paid', 'Inactive', 'RID036\r'),
('SS024', 'CID007', 'Not Paid', 'Inactive', 'RID037\r'),
('SS024', 'CID008', 'Paid', 'Active', 'RID038\r'),
('SS025', 'CID009', 'Paid', 'Active', 'RID039\r'),
('SS026', 'CID010', 'Not Paid', 'Inactive', 'RID040\r'),
('SS027', 'CID011', 'Paid', 'Active', 'RID041\r'),
('SS028', 'CID012', 'Paid', 'Active', 'RID042\r'),
('SS029', 'CID013', 'Not Paid', 'Active', 'RID043\r'),
('SS029', 'CID014', 'Paid', 'Active', 'RID044\r'),
('SS030', 'CID015', 'Not Paid', 'Active', 'RID045\r'),
('SS030', 'CID016', 'Not Paid', 'Inactive', 'RID046\r'),
('SS030', 'CID017', 'Paid', 'Active', 'RID047\r'),
('SS030', 'CID018', 'Paid', 'Active', 'RID048\r'),
('SS030', 'CID019', 'Paid', 'Active', 'RID049\r'),
('SS031', 'CID020', 'Paid', 'Active', 'RID050\r'),
('SS032', 'CID021', 'Not Paid', 'Inactive', 'RID051\r'),
('SS033', 'CID022', 'Paid', 'Active', 'RID052\r'),
('SS035', 'CID023', 'Paid', 'Active', 'RID053\r'),
('SS035', 'CID024', 'Paid', 'Active', 'RID054\r'),
('SS036', 'CID025', 'Paid', 'Active', 'RID055\r'),
('SS037', 'CID026', 'Not Paid', 'Inactive', 'RID056\r'),
('SS038', 'CID027', 'Paid', 'Active', 'RID057\r'),
('SS038', 'CID028', 'Not Paid', 'Active', 'RID058\r'),
('SS038', 'CID029', 'Paid', 'Active', 'RID059\r'),
('SS039', 'CID030', 'Not Paid', 'Inactive', 'RID060\r'),
('SS039', 'CID001', 'Paid', 'Active', 'RID061\r'),
('SS040', 'CID002', 'Paid', 'Active', 'RID062\r'),
('SS041', 'CID003', 'Paid', 'Active', 'RID063\r'),
('SS041', 'CID004', 'Paid', 'Active', 'RID064\r'),
('SS042', 'CID005', 'Not Paid', 'Inactive', 'RID065\r'),
('SS043', 'CID006', 'Paid', 'Active', 'RID066\r'),
('SS043', 'CID007', 'Not Paid', 'Inactive', 'RID067\r'),
('SS044', 'CID008', 'Paid', 'Active', 'RID068\r'),
('SS045', 'CID009', 'Paid', 'Active', 'RID069\r'),
('SS046', 'CID010', 'Paid', 'Active', 'RID070\r'),
('SS046', 'CID011', 'Paid', 'Active', 'RID071\r'),
('SS046', 'CID012', 'Not Paid', 'Inactive', 'RID072\r'),
('SS047', 'CID013', 'Paid', 'Active', 'RID073\r'),
('SS049', 'CID014', 'Paid', 'Active', 'RID074\r'),
('SS049', 'CID015', 'Paid', 'Active', 'RID075\r'),
('SS050', 'CID016', 'Paid', 'Active', 'RID076\r'),
('SS050', 'CID017', 'Not Paid', 'Inactive', 'RID077\r'),
('SS050', 'CID018', 'Paid', 'Active', 'RID078\r');

-- --------------------------------------------------------

--
-- Table structure for table `clubyear`
--

DROP TABLE IF EXISTS `clubyear`;
CREATE TABLE IF NOT EXISTS `clubyear` (
  `YearLevelID` varchar(10) NOT NULL,
  `ClubID` varchar(10) NOT NULL,
  PRIMARY KEY (`YearLevelID`,`ClubID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `clubyear`
--

INSERT INTO `clubyear` (`YearLevelID`, `ClubID`) VALUES
('CLS1', 'CID008\r'),
('CLS1', 'CID025\r'),
('CLS2', 'CID008\r'),
('CLS2', 'CID025\r'),
('CLS3', 'CID007\r'),
('CLS3', 'CID008\r'),
('CLS3', 'CID023\r'),
('CLS3', 'CID025\r'),
('CLS4', 'CID007\r'),
('CLS4', 'CID008\r'),
('CLS4', 'CID023\r'),
('CLS4', 'CID025\r'),
('FF1', 'CID001\r'),
('FF1', 'CID004\r'),
('FF1', 'CID006\r'),
('FF1', 'CID015\r'),
('FF1', 'CID024\r'),
('FF1', 'CID029\r'),
('FF2', 'CID001\r'),
('FF2', 'CID004\r'),
('FF2', 'CID006\r'),
('FF2', 'CID024\r'),
('FF2', 'CID029\r'),
('FF3', 'CID001\r'),
('FF3', 'CID004\r'),
('FF3', 'CID027\r'),
('FF3', 'CID029\r'),
('FF3', 'CID030\r'),
('FF4', 'CID001\r'),
('FF4', 'CID004\r'),
('FF4', 'CID010\r'),
('FF4', 'CID011\r'),
('FF4', 'CID012\r'),
('FF4', 'CID016\r'),
('FF4', 'CID026\r'),
('FF4', 'CID027\r'),
('FF4', 'CID028\r'),
('FF4', 'CID030\r'),
('FF5', 'CID001\r'),
('FF5', 'CID004\r'),
('FF5', 'CID010\r'),
('FF5', 'CID011\r'),
('FF5', 'CID012\r'),
('FF5', 'CID013\r'),
('FF5', 'CID016\r'),
('FF5', 'CID018\r'),
('FF5', 'CID019\r'),
('FF5', 'CID026\r'),
('FF5', 'CID027\r'),
('FF5', 'CID028\r'),
('FF5', 'CID030\r'),
('FFL6', 'CID002\r'),
('FFL6', 'CID003\r'),
('FFL6', 'CID005\r'),
('FFL6', 'CID009\r'),
('FFL6', 'CID013\r'),
('FFL6', 'CID014\r'),
('FFL6', 'CID017\r'),
('FFL6', 'CID018\r'),
('FFL6', 'CID019\r'),
('FFL6', 'CID020\r'),
('FFL6', 'CID021\r'),
('FFL6', 'CID026\r'),
('FFL6', 'CID027\r'),
('FFL6', 'CID028\r'),
('FFL6', 'CID030\r'),
('FFU6', 'CID002\r'),
('FFU6', 'CID003\r'),
('FFU6', 'CID005\r'),
('FFU6', 'CID009\r'),
('FFU6', 'CID013\r'),
('FFU6', 'CID014\r'),
('FFU6', 'CID017\r'),
('FFU6', 'CID018\r'),
('FFU6', 'CID019\r'),
('FFU6', 'CID020\r'),
('FFU6', 'CID022\r'),
('FFU6', 'CID026\r'),
('FFU6', 'CID027\r'),
('FFU6', 'CID028\r'),
('FFU6', 'CID030\r');

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

DROP TABLE IF EXISTS `register`;
CREATE TABLE IF NOT EXISTS `register` (
  `RegisterID` varchar(10) NOT NULL,
  `StudentID` varchar(10) DEFAULT NULL,
  `ClubID` varchar(10) DEFAULT NULL,
  `DateOfAttendance` date DEFAULT NULL,
  PRIMARY KEY (`RegisterID`),
  KEY `StudentID` (`StudentID`),
  KEY `ClubID` (`ClubID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`RegisterID`, `StudentID`, `ClubID`, `DateOfAttendance`) VALUES
('RID001', 'SS001', 'CID001', '2023-02-07'),
('RID002', 'SS001', 'CID002', '2023-02-07'),
('RID003', 'SS002', 'CID003', '2023-02-13'),
('RID004', 'SS002', 'CID004', '2023-03-10'),
('RID005', 'SS003', 'CID005', '2023-03-10'),
('RID006', 'SS003', 'CID006', '2023-03-15'),
('RID007', 'SS003', 'CID007', '2023-03-12'),
('RID008', 'SS004', 'CID008', '2023-03-13'),
('RID009', 'SS004', 'CID009', '2023-03-12'),
('RID010', 'SS005', 'CID010', '2023-04-10'),
('RID011', 'SS006', 'CID011', '2023-03-16'),
('RID012', 'SS007', 'CID012', '2023-04-04'),
('RID013', 'SS008', 'CID013', '2023-03-18'),
('RID014', 'SS008', 'CID014', '2023-05-10'),
('RID015', 'SS009', 'CID015', '2023-03-20'),
('RID016', 'SS009', 'CID016', '2023-05-21'),
('RID017', 'SS009', 'CID017', '2023-03-22'),
('RID018', 'SS010', 'CID018', '2023-03-23'),
('RID019', 'SS011', 'CID019', '2023-03-24'),
('RID020', 'SS012', 'CID020', '2023-04-25'),
('RID021', 'SS013', 'CID021', '2023-03-26'),
('RID022', 'SS013', 'CID022', '2023-03-27'),
('RID023', 'SS015', 'CID023', '2023-03-28'),
('RID024', 'SS015', 'CID024', '2023-04-25'),
('RID025', 'SS015', 'CID025', '2023-04-30');

-- --------------------------------------------------------

--
-- Table structure for table `staffadvisor`
--

DROP TABLE IF EXISTS `staffadvisor`;
CREATE TABLE IF NOT EXISTS `staffadvisor` (
  `StaffAdvisorID` varchar(10) NOT NULL,
  `StaffFName` varchar(20) DEFAULT NULL,
  `StaffLName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`StaffAdvisorID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `staffadvisor`
--

INSERT INTO `staffadvisor` (`StaffAdvisorID`, `StaffFName`, `StaffLName`) VALUES
('SA001', 'Klay', ' Thompson    '),
('SA002', ' Bortmelo', ' Manning\r'),
('SA003', ' Jason', ' Tatum\r'),
('SA004', ' Ichibe ', ' Kurosaki\r'),
('SA005', ' Fred ', ' Flinstone\r'),
('SA006', 'Wilma ', 'Flinstone\r'),
('SA007', ' Riley ', 'Reid\r'),
('SA010', ' Hisoka ', ' Pedonting\r'),
('SA011', ' Jeff ', ' Bozos\r'),
('SA132', ' Nanami ', ' Harrington \r');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `StudentID` varchar(10) NOT NULL,
  `YearLevelID` varchar(10) DEFAULT NULL,
  `FName` varchar(20) DEFAULT NULL,
  `LName` varchar(20) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  PRIMARY KEY (`StudentID`),
  KEY `YearLevelID` (`YearLevelID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`StudentID`, `YearLevelID`, `FName`, `LName`, `BirthDate`) VALUES
('SS001', 'FF3', 'Lana', 'Bradshaw', '2009-07-07'),
('SS002', 'FF2', 'Maisey', 'Lopez', '2004-08-16'),
('SS003', 'CLS4', 'Carl', 'Burton', '2012-10-28'),
('SS004', 'CLS1', 'Marwa', 'Krueger', '2015-10-17'),
('SS005', 'FF2', 'Josh', 'Winters', '2016-05-12'),
('SS006', 'INA', 'Brett', 'Neal', '2017-08-07'),
('SS007', 'INA', 'Bret', 'Wu', '2016-05-12'),
('SS008', 'FFU6', 'Anne', 'Roach', '2015-02-06'),
('SS009', 'FF4', 'Aidan', 'Pruitt', '2008-02-28'),
('SS010', 'CLS4', 'Rico', 'Fields', '2012-04-23'),
('SS011', 'INB', 'Christine', 'Allison', '2016-12-16'),
('SS012', 'CLS4', 'Nia', 'Patton', '2012-10-16'),
('SS013', 'CLS2', 'Stephanie', 'Wright', '2014-02-06'),
('SS014', 'CLS2', 'Dylan', 'Browning', '2014-12-19'),
('SS015', 'CLS2', 'Lowri', 'Espinoza', '2014-08-29'),
('SS016', 'FF4', 'Lilian', 'Christensen', '2008-04-14'),
('SS017', 'INA', 'Tatiana', 'Shields', '2017-02-12'),
('SS018', 'CLS1', 'Robin', 'Wang', '2015-11-17'),
('SS019', 'INB', 'Luisa', 'Bentley', '2016-08-27'),
('SS020', 'REP', 'Dawn', 'Lawrence', '2018-06-18'),
('SS021', 'REP', 'Kamran', 'Walls', '2018-08-12'),
('SS022', 'CLS4', 'Genevieve', 'Medina', '2012-11-15'),
('SS023', 'REP', 'Alice', 'Mclean', '2018-09-21'),
('SS024', 'FFL6', 'Georgiana', 'Bauer', '2006-04-21'),
('SS025', 'FF3', 'Johnny', 'Weiss', '2009-08-11'),
('SS026', 'FFL6', 'Zackary', 'Marshall', '2006-06-19'),
('SS027', 'FF1', 'Veronica', 'Brandt', '2011-08-15'),
('SS028', 'FFL6', 'Betsy', 'Moses', '2006-10-17'),
('SS029', 'CLS1', 'Joanna', 'Rivers', '2015-12-15'),
('SS030', 'INA', 'Shane', 'Davidson', '2017-01-21'),
('SS031', 'CLS3', 'Julius', 'Valenzuela', '2013-04-03'),
('SS032', 'CLS2', 'Summer', 'Miller', '2014-02-27'),
('SS033', 'INB', 'Erik', 'Willis', '2016-11-01'),
('SS034', 'CLS2', 'Kaylum', 'George', '2014-11-24'),
('SS035', 'FF3', 'Leon', 'Campbell', '2009-08-17'),
('SS036', 'CLS1', 'Dale', 'Whitaker', '2015-03-16'),
('SS037', 'FF1', 'Ahmed', 'Butler', '2011-08-19'),
('SS038', 'FF1', 'Phoebe', 'O\'Brien', '2011-11-14'),
('SS039', 'FF1', 'Saad', 'Houston', '2011-07-11'),
('SS040', 'INB', 'Zaynah', 'Cobb', '2016-12-19'),
('SS041', 'INA', 'Oliwier', 'Lambert', '2017-06-01'),
('SS042', 'FFL6', 'Macauley', 'Trevino', '2006-07-22'),
('SS043', 'FFL6', 'Emilie', 'Barton', '2006-02-08'),
('SS044', 'CLS4', 'Roxanne', 'Wyatt', '2012-03-08'),
('SS045', 'FF5', 'Jacob', 'Pollard', '2007-02-01'),
('SS046', 'FF4', 'Kyan', 'Conway', '2008-09-12'),
('SS047', 'FFL6', 'Jazmin', 'Jordan', '2006-03-05'),
('SS048', 'FF5', 'Aaron', 'Wilkerson', '2007-05-03'),
('SS049', 'FF3', 'Tommy', 'Mata', '2009-06-13'),
('SS050', 'FF5', 'Theo', 'Ryan', '2007-09-17'),
('SS052', 'INA', 'Roger', 'Manning', '2005-12-14'),
('SS051', 'CLS2', 'Jordan', 'Farrell', '2003-05-12'),
('SS053', 'FF2', 'Greg', 'Baxter', '2004-07-15'),
('SS054', 'FF5', 'Bob', 'Marl', '2008-02-14'),
('SS058', 'CLS3', 'Rodney', 'Farrell', '2010-04-10'),
('SS056', 'CLS1', 'Jeff', 'Pharrell', '2004-06-17'),
('SS057', 'CLS3', 'Rodney', 'Farrell', '2010-04-10'),
('SS059', 'FF3', 'Jayden', 'Farrell', '2005-06-14'),
('SS060', 'FFL6', 'Fred', 'Flinstone', '2000-05-14'),
('SS061', 'INB', 'Wilma', 'Flinstone', '2018-06-12'),
('SS062', 'FF3', 'Jada', 'Rock', '2003-05-12'),
('SS063', 'FF4', 'Hana', 'Roach', '2009-08-15');

-- --------------------------------------------------------

--
-- Table structure for table `studentemail`
--

DROP TABLE IF EXISTS `studentemail`;
CREATE TABLE IF NOT EXISTS `studentemail` (
  `StudentID` varchar(10) DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  PRIMARY KEY (`Email`),
  KEY `StudentID` (`StudentID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `studentemail`
--

INSERT INTO `studentemail` (`StudentID`, `Email`) VALUES
('SS057', 'rod.far@highlearn.acad.edu'),
('SS001', 'lana.bradshaw@highlearn.acad.edu'),
('SS002', 'maisey.lopez@highlearn.acad.edu'),
('SS003', 'carl.burton@highlearn.acad.edu'),
('SS004', 'marwa.krueger@highlearn.acad.edu'),
('SS005', 'josh.winters@email.com'),
('SS006', 'aishah.neal@highlearn.acad.edu'),
('SS007', 'bret.wu@email.com'),
('SS008', 'anne.roach@highlearn.acad.edu'),
('SS009', 'aidan.pruitt@highlearn.acad.edu'),
('SS010', 'rico.fields@highlearn.acad.edu'),
('SS011', 'christine.allison@highlearn.acad.edu'),
('SS012', 'nia.patton@highlearn.acad.edu'),
('SS013', 'stephanie.wright@highlearn.acad.edu'),
('SS014', 'dylan.browning@highlearn.acad.edu'),
('SS015', 'lowri.espinoza@highlearn.acad.edu'),
('SS016', 'lilian.christensen@highlearn.acad.edu'),
('SS017', 'tatiana.shields@highlearn.acad.edu'),
('SS018', 'robin.wang@highlearn.acad.edu'),
('SS019', 'luisa.bentley@highlearn.acad.edu'),
('SS020', 'dawn.lawrence@highlearn.acad.edu'),
('SS021', 'kamran.walls@highlearn.acad.edu'),
('SS022', 'genevieve.medina@highlearn.acad.edu'),
('SS023', 'alice.mclean@highlearn.acad.edu'),
('SS024', 'georgiana.bauer@highlearn.acad.edu'),
('SS025', 'johnny.weiss@highlearn.acad.edu'),
('SS026', 'zackary.marshall@highlearn.acad.edu'),
('SS027', 'veronica.brandt@highlearn.acad.edu'),
('SS028', 'betsy.moses@highlearn.acad.edu'),
('SS029', 'joanna.rivers@highlearn.acad.edu'),
('SS030', 'shane.davidson@highlearn.acad.edu'),
('SS031', 'julius.valenzuela@highlearn.acad.edu'),
('SS032', 'summer.miller@highlearn.acad.edu'),
('SS033', 'erik.willis@highlearn.acad.edu'),
('SS034', 'kaylum.george@highlearn.acad.edu'),
('SS035', 'leon.campbell@highlearn.acad.edu'),
('SS036', 'dale.whitaker@highlearn.acad.edu'),
('SS037', 'ahmed.butler@highlearn.acad.edu'),
('SS038', 'phoebe.o\'brien@highlearn.acad.edu'),
('SS039', 'saad.houston@highlearn.acad.edu'),
('SS040', 'zaynah.cobb@highlearn.acad.edu'),
('SS041', 'oliwier.lambert@highlearn.acad.edu'),
('SS042', 'macauley.trevino@highlearn.acad.edu'),
('SS043', 'emilie.barton@highlearn.acad.edu'),
('SS044', 'roxanne.wyatt@highlearn.acad.edu'),
('SS045', 'jacob.pollard@highlearn.acad.edu'),
('SS046', 'kyan.conway@highlearn.acad.edu'),
('SS047', 'jazmin.jordan@highlearn.acad.edu'),
('SS048', 'aaron.wilkerson@highlearn.acad.edu'),
('SS049', 'tommy.mata@highlearn.acad.edu'),
('SS050', 'theo.ryan@highlearn.acad.edu'),
('SS059', 'jayden.farrell@highlearn.acad.edu'),
('SS060', 'fred.flint@email.com'),
('SS061', 'wilma.flint@email.com'),
('SS062', 'jada.rock@email.com'),
('SS063', 'hana.roach@email.com');

-- --------------------------------------------------------

--
-- Table structure for table `userid`
--

DROP TABLE IF EXISTS `userid`;
CREATE TABLE IF NOT EXISTS `userid` (
  `LoginID` varchar(10) DEFAULT NULL,
  `AccessLevel` int DEFAULT NULL,
  `LoginPassword` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `userid`
--

INSERT INTO `userid` (`LoginID`, `AccessLevel`, `LoginPassword`) VALUES
('SS001', 1, 'G8b9VSWCEj5d\r'),
('SA001', 2, 'kpXJ3tnpK8eu\r'),
('SS002', 1, 'nr7GSSkRPQ27\r'),
('SA004', 2, 'xxyVwaDmdvBx\r'),
('SS003', 1, 's9Pk8cPSF9d3\r'),
('SS004', 1, 'KVTxEKPxcJwV\r'),
('SS005', 1, 'fFFdQGZnLuKg\r'),
('SA003', 2, 'hqSwPWfYTn8y\r'),
('SS006', 1, 'sJYJgGmkFTaL\r'),
('SS007', 1, 'aGkQxt4emEmy\r'),
('SA004', 2, 'ggZ7xRsAVzhQ\r'),
('SS008', 1, 'wUSLjf3M8cNt\r'),
('SS009', 1, 'tLDHHwQ88XcB\r'),
('SS010', 1, 'NhmKsQeUesDB\r'),
('SS011', 1, 'U8BhNdgNLxps\r'),
('SS012', 1, 'twY9tKwxeA2b\r'),
('SS013', 1, '87372tVKkkcP\r'),
('SS014', 1, 'y3afub9AC2bj\r'),
('SS015', 1, 'TkDvY4qUNrqX\r'),
('SS016', 1, 'EBGXJPWxbvhv\r'),
('SS017', 1, 'xu7ntgck4243\r'),
('SS018', 1, '4us6xTBCAdRY\r'),
('SS019', 1, 'YZvZar6eEnFF\r'),
('SS020', 1, 'PPFTDwVhajh3\r'),
('SS021', 1, 'Wck2csg7ubJP\r'),
('SS022', 1, 'ULLWwLjtrkPg\r'),
('SS023', 1, 'uBRG8C9NLwz2\r'),
('SS024', 1, '6KcC92qzHymq\r'),
('SS025', 1, 'A48fqZkc2yDJ\r'),
('SS026', 1, 'fxeFsUzt4LEQ\r'),
('SS027', 1, 'BnGqq7vEvSTh\r'),
('SA005', 2, 'xjmfnaBLc4nu\r'),
('SA006', 2, 'wqbF9yWZg4MW\r'),
('SS028', 1, 'JKseQbHJLec5\r'),
('SS029', 1, '6Dn6JFPbCsQA\r'),
('SS030', 1, '7eBS5dkqRAYM\r'),
('SA007', 2, 'WCU6RYsbssuT\r'),
('SS031', 1, 'TEvACrhGRb4r\r'),
('SS032', 1, 'heGEPEhX64Mw\r'),
('SS033', 1, '5HrhSpA9hGCR\r'),
('SS034', 1, 'fpYGnYR89yKw\r'),
('SS035', 1, 'af2dJh835gN2\r'),
('SS036', 1, 'GSAcxmrsxSJW\r'),
('SS037', 1, '3W2nbX9HHMYU\r'),
('SS038', 1, 'TzmhuHFefmrB\r'),
('SS039', 1, 'P4y3FGyZRZaJ\r'),
('SA008', 2, 'EPmnuVyevN2E\r'),
('SS040', 1, '43xG3xhuuQef\r'),
('SS041', 1, 'hTzThDphpEXu\r'),
('SA009', 2, 'Ax9vYXGyzwRb\r');

-- --------------------------------------------------------

--
-- Table structure for table `yearlevelgroup`
--

DROP TABLE IF EXISTS `yearlevelgroup`;
CREATE TABLE IF NOT EXISTS `yearlevelgroup` (
  `YearLevelID` varchar(10) NOT NULL,
  `YearLevelName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`YearLevelID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `yearlevelgroup`
--

INSERT INTO `yearlevelgroup` (`YearLevelID`, `YearLevelName`) VALUES
('REP', 'Reception'),
('INA', 'Infants A'),
('INB', 'Infants B'),
('CLS1', 'Class 1'),
('CLS2', 'Class 2'),
('CLS3', 'Class 3'),
('CLS4', 'Class 4'),
('FF1', 'First Form'),
('FF2', 'Second Form'),
('FF3', 'Third Form'),
('FF4', 'Fourth Form'),
('FF5', 'Fifth Form'),
('FFL6', 'Lower sixth Form'),
('FFU6', 'Upper sixth Form');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
