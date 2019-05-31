-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 31, 2019 at 10:04 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `GOGENETIC_SCHEMA`
--

-- --------------------------------------------------------

--
-- Table structure for table `command_stores`
--

CREATE TABLE `command_stores` (
  `UUID` varchar(256) NOT NULL,
  `Data` varchar(3000) NOT NULL,
  `Command` varchar(256) NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `command_stores`
--

INSERT INTO `command_stores` (`UUID`, `Data`, `Command`, `CreatedOn`) VALUES
('4340676a-1adf-45cb-bd98-50024c0ed7ac', '{\"command\":\"TestCreateCommand\",\"toDo\":{\"id\":1212,\"title\":\"Haha\"},\"uuid\":\"4340676a-1adf-45cb-bd98-50024c0ed7ac\",\"v1\":1}', 'TestCreateCommand', '2019-05-28 01:11:59'),
('d7416fa3-7b1f-4417-81bb-1e4b6350b085', '{\"command\":\"TestCreateCommand\",\"toDo\":{\"id\":1212,\"title\":\"Haha\"},\"uuid\":\"d7416fa3-7b1f-4417-81bb-1e4b6350b085\",\"v1\":1}', 'TestCreateCommand', '2019-05-28 01:13:34'),
('c73c1029-dba4-46c4-ab80-409b9252b891', '{\"command\":\"JWTCreateCommand\",\"uuid\":\"c73c1029-dba4-46c4-ab80-409b9252b891\",\"v1\":1}', 'JWTCreateCommand', '2019-05-31 03:03:09'),
('1eaa5117-77b1-45a5-a5f7-971773f10ed3', '{\"command\":\"JWTCreateCommand\",\"uuid\":\"1eaa5117-77b1-45a5-a5f7-971773f10ed3\",\"v1\":1}', 'JWTCreateCommand', '2019-05-31 03:10:58'),
('f3b271fd-f407-46bd-a769-83ef439b5154', '{\"command\":\"JWTCreateCommand\",\"user\":\"athish\",\"uuid\":\"f3b271fd-f407-46bd-a769-83ef439b5154\",\"v1\":1}', 'JWTCreateCommand', '2019-05-31 03:11:24'),
('cee8a54a-37da-4244-9320-002b7416d0cd', '{\"command\":\"JWTTokenCreatedCommand\",\"user\":\"athish\",\"uuid\":\"cee8a54a-37da-4244-9320-002b7416d0cd\",\"v1\":1}', 'JWTTokenCreatedCommand', '2019-05-31 03:15:15'),
('ee6d876e-fa49-4b70-8d6b-5cca4b6865e3', '{\"command\":\"JWTTokenCreatedCommand\",\"user\":\"athish\",\"uuid\":\"ee6d876e-fa49-4b70-8d6b-5cca4b6865e3\",\"v1\":1}', 'JWTTokenCreatedCommand', '2019-05-31 03:16:27'),
('286122b3-ee50-4030-a124-c1ac8e027547', '{\"command\":\"JWTTokenCreatedCommand\",\"user\":\"athish\",\"uuid\":\"286122b3-ee50-4030-a124-c1ac8e027547\",\"v1\":1}', 'JWTTokenCreatedCommand', '2019-05-31 17:35:11'),
('f453dd02-ecd3-463e-912e-d183fe6c0af0', '{\"command\":\"JWTTokenCreatedCommand\",\"user\":\"athish\",\"uuid\":\"f453dd02-ecd3-463e-912e-d183fe6c0af0\",\"v1\":1}', 'JWTTokenCreatedCommand', '2019-05-31 17:38:58'),
('60a5a6e6-2a98-4f9d-aeb4-290c425bc012', '{\"command\":\"JWTTokenCreatedCommand\",\"user\":\"athish\",\"uuid\":\"60a5a6e6-2a98-4f9d-aeb4-290c425bc012\",\"v1\":1}', 'JWTTokenCreatedCommand', '2019-05-31 17:39:55'),
('e57b2022-b76c-4bbf-bf77-b12e8414c7f7', '{\"command\":\"JWTTokenCreatedCommand\",\"user\":\"athish\",\"uuid\":\"e57b2022-b76c-4bbf-bf77-b12e8414c7f7\",\"v1\":1}', 'JWTTokenCreatedCommand', '2019-05-31 17:41:43'),
('375017e2-6e50-48a5-ac43-c3e190792e40', '{\"command\":\"JWTTokenCreatedCommand\",\"user\":\"athish\",\"uuid\":\"375017e2-6e50-48a5-ac43-c3e190792e40\",\"v1\":1}', 'JWTTokenCreatedCommand', '2019-05-31 17:46:54'),
('2b2fa6e5-f4d3-497c-94b7-8ee7608fdd8c', '{\"command\":\"JWTTokenCreatedCommand\",\"user\":\"athish\",\"uuid\":\"2b2fa6e5-f4d3-497c-94b7-8ee7608fdd8c\",\"v1\":1}', 'JWTTokenCreatedCommand', '2019-05-31 17:48:29'),
('268cfa86-7d6e-4940-91aa-ae1a12a123e5', '{\"command\":\"JWTTokenCreatedCommand\",\"user\":\"athish\",\"uuid\":\"268cfa86-7d6e-4940-91aa-ae1a12a123e5\",\"v1\":1}', 'JWTTokenCreatedCommand', '2019-05-31 17:48:58'),
('3235e46f-72fb-469a-a6b7-9037ea2795de', '{\"command\":\"JWTTokenCreatedCommand\",\"user\":\"dave\",\"uuid\":\"3235e46f-72fb-469a-a6b7-9037ea2795de\",\"v1\":1}', 'JWTTokenCreatedCommand', '2019-05-31 17:49:18'),
('bc0923cf-c287-442e-9231-7bd60300d71d', '{\"command\":\"JWTTokenCreatedCommand\",\"user\":\"dave\",\"uuid\":\"bc0923cf-c287-442e-9231-7bd60300d71d\",\"v1\":1}', 'JWTTokenCreatedCommand', '2019-05-31 17:53:48'),
('0df97e77-4171-45c6-8ee0-2cd1d89fd5d3', '{\"command\":\"JWTTokenCreatedCommand\",\"user\":\"dave\",\"uuid\":\"0df97e77-4171-45c6-8ee0-2cd1d89fd5d3\",\"v1\":1}', 'JWTTokenCreatedCommand', '2019-05-31 17:59:14'),
('10ea5664-aeec-4cf5-8bbb-cdf53a40fb59', '{\"command\":\"JWTTokenCreatedCommand\",\"user\":\"test\",\"uuid\":\"10ea5664-aeec-4cf5-8bbb-cdf53a40fb59\",\"v1\":1}', 'JWTTokenCreatedCommand', '2019-05-31 19:54:44');

-- --------------------------------------------------------

--
-- Table structure for table `DATABASECHANGELOG`
--

CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `DATABASECHANGELOG`
--

INSERT INTO `DATABASECHANGELOG` (`ID`, `AUTHOR`, `FILENAME`, `DATEEXECUTED`, `ORDEREXECUTED`, `EXECTYPE`, `MD5SUM`, `DESCRIPTION`, `COMMENTS`, `TAG`, `LIQUIBASE`, `CONTEXTS`, `LABELS`, `DEPLOYMENT_ID`) VALUES
('0', 'gogenetic', './Test-liquibase.xml', '2019-05-24 02:20:54', 1, 'EXECUTED', '8:b56a8c717022e6874b6fdbbac9990404', 'createTable tableName=ToDoDomains', '', NULL, '3.6.3', NULL, NULL, '8678849305');

-- --------------------------------------------------------

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

INSERT INTO `DATABASECHANGELOGLOCK` (`ID`, `LOCKED`, `LOCKGRANTED`, `LOCKEDBY`) VALUES
(1, b'0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `event_stores`
--

CREATE TABLE `event_stores` (
  `UUID` varchar(256) NOT NULL,
  `Data` varchar(3000) NOT NULL,
  `Event` varchar(256) NOT NULL,
  `Command` varchar(256) NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event_stores`
--

INSERT INTO `event_stores` (`UUID`, `Data`, `Event`, `Command`, `CreatedOn`) VALUES
('d7416fa3-7b1f-4417-81bb-1e4b6350b085', '{\"Description\":\"Haha\",\"Sno\":1212,\"command\":\"TestCreateCommand\",\"event\":\"ToDoDomainsEventCreated\",\"uuid\":\"d7416fa3-7b1f-4417-81bb-1e4b6350b085\"}', 'ToDoDomainsEventCreated', 'TestCreateCommand', '2019-05-28 01:13:34'),
('e57b2022-b76c-4bbf-bf77-b12e8414c7f7', '{\"Token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJjbGllbnQiOiJhdGhpc2giLCJleHAiOjE1NTk0MTA5MDN9.rPlfXZeLtx9ayrYCj7gGrjmqBdWwgqfzV2JAG24xvyw\",\"User\":\"athish\",\"command\":\"JWTTokenCreatedCommand\",\"event\":\"JWTTokenDomainsEventCreated\",\"uuid\":\"e57b2022-b76c-4bbf-bf77-b12e8414c7f7\"}', 'JWTTokenDomainsEventCreated', 'JWTTokenCreatedCommand', '2019-05-31 17:41:43'),
('375017e2-6e50-48a5-ac43-c3e190792e40', '{\"Token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJjbGllbnQiOiJhdGhpc2giLCJleHAiOjE1NTk0MTEyMTR9.BFLC2hweoxw83I4VsayO_e8Ng7WZUMeorIypic5QtXg\",\"User\":\"athish\",\"command\":\"JWTTokenCreatedCommand\",\"event\":\"JWTTokenDomainsEventCreated\",\"uuid\":\"375017e2-6e50-48a5-ac43-c3e190792e40\"}', 'JWTTokenDomainsEventCreated', 'JWTTokenCreatedCommand', '2019-05-31 17:46:54'),
('2b2fa6e5-f4d3-497c-94b7-8ee7608fdd8c', '{\"Token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJjbGllbnQiOiJhdGhpc2giLCJleHAiOjE1NTk0MTEzMDl9._0lAVnQMAEEm8WjPujwjWrwsmforTFCySPOFpwtY2Iw\",\"User\":\"athish\",\"command\":\"JWTTokenCreatedCommand\",\"event\":\"JWTTokenDomainsEventCreated\",\"uuid\":\"2b2fa6e5-f4d3-497c-94b7-8ee7608fdd8c\"}', 'JWTTokenDomainsEventCreated', 'JWTTokenCreatedCommand', '2019-05-31 17:48:29'),
('268cfa86-7d6e-4940-91aa-ae1a12a123e5', '{\"Token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJjbGllbnQiOiJhdGhpc2giLCJleHAiOjE1NTk0MTEzMzh9.WqNRMYv1td6WcYVxbdFXIfbPQ5D8J41N7gkqeOKFum0\",\"User\":\"athish\",\"command\":\"JWTTokenCreatedCommand\",\"event\":\"JWTTokenDomainsEventCreated\",\"uuid\":\"268cfa86-7d6e-4940-91aa-ae1a12a123e5\"}', 'JWTTokenDomainsEventCreated', 'JWTTokenCreatedCommand', '2019-05-31 17:48:58'),
('3235e46f-72fb-469a-a6b7-9037ea2795de', '{\"Token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJjbGllbnQiOiJkYXZlIiwiZXhwIjoxNTU5NDExMzU4fQ._0_MTlhYQbJKMC_yQiYzzBs2XWaI4fml31PRHcpBTAg\",\"User\":\"dave\",\"command\":\"JWTTokenCreatedCommand\",\"event\":\"JWTTokenDomainsEventCreated\",\"uuid\":\"3235e46f-72fb-469a-a6b7-9037ea2795de\"}', 'JWTTokenDomainsEventCreated', 'JWTTokenCreatedCommand', '2019-05-31 17:49:18'),
('bc0923cf-c287-442e-9231-7bd60300d71d', '{\"Token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJjbGllbnQiOiJkYXZlIiwiZXhwIjoxNTU5NDExNjI4LCJ1dWlkIjoiYmMwOTIzY2YtYzI4Ny00NDJlLTkyMzEtN2JkNjAzMDBkNzFkIn0.gDNH3WZ028cU2JEBQT-_g3ohMIqO07OJ_XHRiWrGUIg\",\"User\":\"dave\",\"command\":\"JWTTokenCreatedCommand\",\"event\":\"JWTTokenDomainsEventCreated\",\"uuid\":\"bc0923cf-c287-442e-9231-7bd60300d71d\"}', 'JWTTokenDomainsEventCreated', 'JWTTokenCreatedCommand', '2019-05-31 17:53:48'),
('0df97e77-4171-45c6-8ee0-2cd1d89fd5d3', '{\"Token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJjbGllbnQiOiJkYXZlIiwiZXhwIjoxNTU5NDExOTU0LCJ1dWlkIjoiMGRmOTdlNzctNDE3MS00NWM2LThlZTAtMmNkMWQ4OWZkNWQzIn0.iDFOCsB3lVEyBA2hk960FfQgxik-QrUeKK0SJq4MVA0\",\"User\":\"dave\",\"command\":\"JWTTokenCreatedCommand\",\"event\":\"JWTTokenDomainsEventCreated\",\"uuid\":\"0df97e77-4171-45c6-8ee0-2cd1d89fd5d3\"}', 'JWTTokenDomainsEventCreated', 'JWTTokenCreatedCommand', '2019-05-31 17:59:14'),
('10ea5664-aeec-4cf5-8bbb-cdf53a40fb59', '{\"Token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJjbGllbnQiOiJ0ZXN0IiwiZXhwIjoxNTU5NDE4ODg0LCJ1dWlkIjoiMTBlYTU2NjQtYWVlYy00Y2Y1LThiYmItY2RmNTNhNDBmYjU5In0.cmEEeMy8Udjsuhu-nE5Dul2nl298-apisGhP0uUW_rs\",\"User\":\"test\",\"command\":\"JWTTokenCreatedCommand\",\"event\":\"JWTTokenDomainsEventCreated\",\"uuid\":\"10ea5664-aeec-4cf5-8bbb-cdf53a40fb59\"}', 'JWTTokenDomainsEventCreated', 'JWTTokenCreatedCommand', '2019-05-31 19:54:44');

-- --------------------------------------------------------

--
-- Table structure for table `J_W_T_Token_Domains`
--

CREATE TABLE `J_W_T_Token_Domains` (
  `Token` varchar(600) NOT NULL,
  `User` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `J_W_T_Token_Domains`
--

INSERT INTO `J_W_T_Token_Domains` (`Token`, `User`) VALUES
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJjbGllbnQiOiJhdGhpc2giLCJleHAiOjE1NTk0MTEzMDl9._0lAVnQMAEEm8WjPujwjWrwsmforTFCySPOFpwtY2Iw', 'athish'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJjbGllbnQiOiJhdGhpc2giLCJleHAiOjE1NTk0MTEzMzh9.WqNRMYv1td6WcYVxbdFXIfbPQ5D8J41N7gkqeOKFum0', 'athish'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJjbGllbnQiOiJkYXZlIiwiZXhwIjoxNTU5NDExMzU4fQ._0_MTlhYQbJKMC_yQiYzzBs2XWaI4fml31PRHcpBTAg', 'dave'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJjbGllbnQiOiJkYXZlIiwiZXhwIjoxNTU5NDExNjI4LCJ1dWlkIjoiYmMwOTIzY2YtYzI4Ny00NDJlLTkyMzEtN2JkNjAzMDBkNzFkIn0.gDNH3WZ028cU2JEBQT-_g3ohMIqO07OJ_XHRiWrGUIg', 'dave'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJjbGllbnQiOiJkYXZlIiwiZXhwIjoxNTU5NDExOTU0LCJ1dWlkIjoiMGRmOTdlNzctNDE3MS00NWM2LThlZTAtMmNkMWQ4OWZkNWQzIn0.iDFOCsB3lVEyBA2hk960FfQgxik-QrUeKK0SJq4MVA0', 'dave'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJjbGllbnQiOiJ0ZXN0IiwiZXhwIjoxNTU5NDE4ODg0LCJ1dWlkIjoiMTBlYTU2NjQtYWVlYy00Y2Y1LThiYmItY2RmNTNhNDBmYjU5In0.cmEEeMy8Udjsuhu-nE5Dul2nl298-apisGhP0uUW_rs', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `ToDoDomains`
--

CREATE TABLE `ToDoDomains` (
  `Sno` int(11) DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `to_do_domains`
--

CREATE TABLE `to_do_domains` (
  `Sno` int(11) NOT NULL,
  `Description` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `to_do_domains`
--

INSERT INTO `to_do_domains` (`Sno`, `Description`) VALUES
(2024, 'Haha'),
(2024, 'Haha'),
(2026, 'Haha'),
(2026, 'Haha'),
(0, ''),
(0, ''),
(0, ''),
(0, ''),
(0, ''),
(9092, 'Haha'),
(2323, 'string'),
(9092, 'Haha'),
(9092, 'Haha'),
(9092, 'Haha'),
(9092, 'Haha'),
(9092, 'Haha'),
(9092, 'Haha'),
(9092, 'Haha'),
(9092, 'Haha'),
(9097, 'Haha'),
(9097, 'Haha'),
(9090, 'Haha'),
(9090, 'Haha'),
(9090, 'Haha'),
(9090, 'Haha'),
(9090, 'Haha'),
(9090, 'Haha'),
(9090, 'Haha'),
(9090, 'Haha'),
(9090, 'Haha'),
(9090, 'Haha'),
(9090, 'Haha'),
(9090, 'Haha'),
(9090, 'Haha'),
(9090, 'Haha'),
(9090, 'Haha'),
(1818, 'Haha'),
(1919, 'Haha'),
(1919, 'Haha'),
(7171, 'Haha'),
(1212, 'Haha'),
(1212, 'Haha'),
(1212, 'Haha');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `DATABASECHANGELOGLOCK`
--
ALTER TABLE `DATABASECHANGELOGLOCK`
  ADD PRIMARY KEY (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
