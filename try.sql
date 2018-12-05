- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 05, 2018 at 05:17 AM
-- Server version: 5.6.34-log
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `AdminCode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auther`
--

CREATE TABLE `auther` (
  `AutherId` int(11) NOT NULL,
  `AutherName` varchar(100) DEFAULT NULL,
  `AutherBestcollection` varchar(45) DEFAULT NULL,
  `bestcollection_BestcollectionContant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bestcollection`
--

CREATE TABLE `bestcollection` (
  `BestcollectionContant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contant`
--

CREATE TABLE `contant` (
  `IsbnNnumber` int(11) NOT NULL DEFAULT '0',
  `ItemTitle` varchar(100) DEFAULT NULL,
  `NumberPage` int(11) DEFAULT NULL,
  `user_UserId` int(11) NOT NULL,
  `admin_AdminCode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contant-auther`
--

CREATE TABLE `contant-auther` (
  `contant_IsbnNnumber` int(11) NOT NULL,
  `contant_user_UserId` int(11) NOT NULL,
  `contant_admin_AdminCode` int(11) NOT NULL,
  `auther_AutherId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contant-genre`
--

CREATE TABLE `contant-genre` (
  `contant_IsbnNnumber` int(11) NOT NULL,
  `contant_user_UserId` int(11) NOT NULL,
  `contant_admin_AdminCode` int(11) NOT NULL,
  `genre_GenerType` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `edition`
--

CREATE TABLE `edition` (
  `EditionNumber` int(11) NOT NULL,
  `contant_IsbnNnumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `form`
--

CREATE TABLE `form` (
  `FormType` varchar(100) NOT NULL,
  `contant_IsbnNnumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `GenreId` int(11) NOT NULL,
  `GenerType` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `printdate`
--

CREATE TABLE `printdate` (
  `PrintdateDate` int(11) NOT NULL,
  `contant_IsbnNnumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserId` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `Username` varchar(45) DEFAULT NULL,
  `UserEmail` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`AdminCode`);

--
-- Indexes for table `auther`
--
ALTER TABLE `auther`
  ADD PRIMARY KEY (`AutherId`,`bestcollection_BestcollectionContant`);

--
-- Indexes for table `bestcollection`
--
ALTER TABLE `bestcollection`
  ADD PRIMARY KEY (`BestcollectionContant`);

--
-- Indexes for table `contant`
--
ALTER TABLE `contant`
  ADD PRIMARY KEY (`IsbnNnumber`,`admin_AdminCode`);

--
-- Indexes for table `contant-auther`
--
ALTER TABLE `contant-auther`
  ADD PRIMARY KEY (`contant_IsbnNnumber`,`contant_user_UserId`,`contant_admin_AdminCode`,`auther_AutherId`);

--
-- Indexes for table `contant-genre`
--
ALTER TABLE `contant-genre`
  ADD PRIMARY KEY (`contant_IsbnNnumber`,`contant_user_UserId`,`contant_admin_AdminCode`,`genre_GenerType`);

--
-- Indexes for table `edition`
--
ALTER TABLE `edition`
  ADD PRIMARY KEY (`contant_IsbnNnumber`);

--
-- Indexes for table `form`
--
ALTER TABLE `form`
  ADD PRIMARY KEY (`contant_IsbnNnumber`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`GenerType`);

--
-- Indexes for table `printdate`
--
ALTER TABLE `printdate`
  ADD PRIMARY KEY (`PrintdateDate`,`contant_IsbnNnumber`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

