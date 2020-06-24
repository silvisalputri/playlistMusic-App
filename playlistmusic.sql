-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2020 at 07:34 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `playlistmusic`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_album`
--

CREATE TABLE `tb_album` (
  `id_album` int(11) NOT NULL,
  `id_artist` int(11) NOT NULL,
  `name_album` varchar(255) NOT NULL,
  `date_released` date NOT NULL,
  `rating` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_album`
--

INSERT INTO `tb_album` (`id_album`, `id_artist`, `name_album`, `date_released`, `rating`) VALUES
(1, 2, 'Midnight Memories', '2013-11-23', 4.2),
(2, 3, 'V', '2014-08-29', 4.4),
(3, 4, 'Spectrum', '2019-11-15', 4.8),
(4, 5, 'Abbey Road', '1969-09-26', 4.5),
(5, 1, 'Lover', '2019-08-23', 4.5),
(6, 6, 'The Sailor', '2019-07-29', 4.8);

-- --------------------------------------------------------

--
-- Table structure for table `tb_artist`
--

CREATE TABLE `tb_artist` (
  `id_artist` int(11) NOT NULL,
  `name_artist` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_artist`
--

INSERT INTO `tb_artist` (`id_artist`, `name_artist`) VALUES
(1, 'Taylor Swift'),
(2, 'One Direction'),
(3, 'Maroon 5'),
(4, 'Westlife'),
(5, 'The Beatles'),
(6, 'Rich Brian');

-- --------------------------------------------------------

--
-- Table structure for table `tb_genre`
--

CREATE TABLE `tb_genre` (
  `id_genre` int(11) NOT NULL,
  `name_genre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_genre`
--

INSERT INTO `tb_genre` (`id_genre`, `name_genre`) VALUES
(1, 'Pop'),
(2, 'Jazz'),
(3, 'RnB'),
(4, 'Blues'),
(5, 'Metal'),
(6, 'Rap');

-- --------------------------------------------------------

--
-- Table structure for table `tb_song`
--

CREATE TABLE `tb_song` (
  `id_song` int(11) NOT NULL,
  `id_artist` int(11) NOT NULL,
  `id_album` int(11) NOT NULL,
  `song_title` varchar(255) NOT NULL,
  `id_genre` int(11) NOT NULL,
  `date_released` date NOT NULL,
  `duration` int(11) NOT NULL,
  `rating` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_song`
--

INSERT INTO `tb_song` (`id_song`, `id_artist`, `id_album`, `song_title`, `id_genre`, `date_released`, `duration`, `rating`) VALUES
(1, 1, 5, 'I Forgot That You Existed', 2, '2019-08-23', 175, 4.7),
(2, 2, 1, 'Midnight Memories', 3, '2013-11-23', 176, 4.2),
(3, 3, 2, 'Coming Back For You', 1, '1998-08-01', 231, 4.5),
(4, 4, 3, 'Dynamite', 5, '2019-07-05', 273, 4.7),
(5, 5, 4, 'Come Together', 4, '1969-10-06', 259, 4.5);

-- --------------------------------------------------------

--
-- Stand-in structure for view `viewsong`
-- (See below for the actual view)
--
CREATE TABLE `viewsong` (
`id_song` int(11)
,`name_artist` varchar(255)
,`name_album` varchar(255)
,`song_title` varchar(255)
,`name_genre` varchar(255)
,`date_released` date
,`duration` int(11)
,`rating` float
);

-- --------------------------------------------------------

--
-- Structure for view `viewsong`
--
DROP TABLE IF EXISTS `viewsong`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewsong`  AS  (select `tb_song`.`id_song` AS `id_song`,`tb_artist`.`name_artist` AS `name_artist`,`tb_album`.`name_album` AS `name_album`,`tb_song`.`song_title` AS `song_title`,`tb_genre`.`name_genre` AS `name_genre`,`tb_song`.`date_released` AS `date_released`,`tb_song`.`duration` AS `duration`,`tb_song`.`rating` AS `rating` from (((`tb_song` join `tb_artist` on(`tb_song`.`id_artist` = `tb_artist`.`id_artist`)) join `tb_album` on(`tb_song`.`id_album` = `tb_album`.`id_album`)) join `tb_genre` on(`tb_song`.`id_genre` = `tb_genre`.`id_genre`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_album`
--
ALTER TABLE `tb_album`
  ADD PRIMARY KEY (`id_album`),
  ADD UNIQUE KEY `id_artist` (`id_artist`);

--
-- Indexes for table `tb_artist`
--
ALTER TABLE `tb_artist`
  ADD PRIMARY KEY (`id_artist`);

--
-- Indexes for table `tb_genre`
--
ALTER TABLE `tb_genre`
  ADD PRIMARY KEY (`id_genre`);

--
-- Indexes for table `tb_song`
--
ALTER TABLE `tb_song`
  ADD PRIMARY KEY (`id_song`),
  ADD UNIQUE KEY `id_artist` (`id_artist`),
  ADD UNIQUE KEY `id_album` (`id_album`),
  ADD UNIQUE KEY `id_genre` (`id_genre`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_album`
--
ALTER TABLE `tb_album`
  MODIFY `id_album` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tb_genre`
--
ALTER TABLE `tb_genre`
  MODIFY `id_genre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_song`
--
ALTER TABLE `tb_song`
  MODIFY `id_song` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_album`
--
ALTER TABLE `tb_album`
  ADD CONSTRAINT `tb_album_ibfk_1` FOREIGN KEY (`id_artist`) REFERENCES `tb_artist` (`id_artist`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_song`
--
ALTER TABLE `tb_song`
  ADD CONSTRAINT `tb_song_ibfk_1` FOREIGN KEY (`id_artist`) REFERENCES `tb_artist` (`id_artist`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_song_ibfk_2` FOREIGN KEY (`id_album`) REFERENCES `tb_album` (`id_album`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_song_ibfk_3` FOREIGN KEY (`id_genre`) REFERENCES `tb_genre` (`id_genre`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
