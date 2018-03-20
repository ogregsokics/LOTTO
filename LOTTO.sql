-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2018. Már 19. 20:49
-- Kiszolgáló verziója: 10.1.28-MariaDB
-- PHP verzió: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `lotto`
--
CREATE DATABASE IF NOT EXISTS `lotto` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `lotto`;

DELIMITER $$
--
-- Eljárások
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteAll` ()  NO SQL
DELETE FROM `lotto`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eredmenyekIN` (IN `sorsoltIN` VARCHAR(20), IN `tippekIN` VARCHAR(20), IN `talalatokIN` VARCHAR(20), IN `szamIN` INT(1), IN `elsosorIN` VARCHAR(20), IN `masodiksorIN` VARCHAR(20))  NO SQL
INSERT INTO lotto (sorsolt, tippek, talalatok, lotto.talalatokszama, lotto.elsosor, lotto.masodiksor)
VALUES (sorsoltIN, tippekIN, talalatokIN, szamIN, elsosorIN, masodiksorIN)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getProcent` (IN `szamIN` INT(3), OUT `szamOUT` VARCHAR(4))  NO SQL
SELECT 

(SELECT COUNT(id) FROM `lotto` WHERE `talalatokszama`= szamIN) /

(SELECT COUNT(id) FROM `lotto`)

* 100

INTO szamOUT$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getResults` ()  NO SQL
SELECT id FROM lotto ORDER BY id DESC$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `lotto`
--

CREATE TABLE `lotto` (
  `id` int(3) NOT NULL,
  `sorsolt` varchar(20) NOT NULL,
  `tippek` varchar(20) NOT NULL,
  `talalatok` varchar(20) NOT NULL,
  `talalatokszama` int(1) DEFAULT NULL,
  `elsosor` varchar(50) NOT NULL,
  `masodiksor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `lotto`
--

INSERT INTO `lotto` (`id`, `sorsolt`, `tippek`, `talalatok`, `talalatokszama`, `elsosor`, `masodiksor`) VALUES
(1304, '41, 76, 1, 59, 49', '81, 5, 79, 18, 1', '1', 1, '2', '4'),
(1305, '58, 8, 71, 20, 87', '49, 59, 62, 17, 31', '', 0, '', ''),
(1306, '46, 15, 37, 9, 58', '49, 65, 14, 89, 10', '', 0, '', ''),
(1307, '56, 8, 65, 46, 59', '22, 54, 40, 12, 59', '59', 1, '4', '4'),
(1308, '32, 24, 62, 58, 35', '61, 68, 44, 64, 72', '', 0, '', ''),
(1309, '42, 62, 2, 39, 65', '31, 49, 47, 52, 42', '42', 1, '0', '4'),
(1310, '16, 27, 73, 55, 18', '4, 42, 62, 77, 39', '', 0, '', ''),
(1311, '65, 78, 50, 5, 87', '73, 88, 21, 23, 39', '', 0, '', ''),
(1312, '60, 14, 22, 81, 9', '64, 72, 9, 31, 33', '9', 1, '4', '2'),
(1313, '90, 3, 52, 16, 21', '32, 50, 3, 67, 38', '3', 1, '1', '2'),
(1314, '70, 11, 75, 40, 61', '57, 64, 43, 60, 29', '', 0, '', ''),
(1315, '41, 78, 51, 25, 23', '37, 14, 13, 79, 33', '', 0, '', ''),
(1316, '21, 3, 83, 59, 81', '43, 80, 32, 4, 15', '', 0, '', ''),
(1317, '84, 40, 69, 27, 71', '65, 71, 81, 48, 40', '71, 40', 2, '4,1', '1,4'),
(1318, '28, 37, 16, 49, 5', '83, 64, 33, 51, 37', '37', 1, '1', '4'),
(1319, '66, 42, 53, 72, 46', '20, 27, 6, 69, 22', '', 0, '', ''),
(1320, '79, 33, 15, 85, 80', '53, 16, 4, 52, 47', '', 0, '', ''),
(1321, '6, 58, 57, 17, 10', '20, 49, 24, 41, 14', '', 0, '', ''),
(1322, '55, 12, 89, 73, 41', '5, 81, 49, 33, 43', '', 0, '', ''),
(1323, '8, 54, 2, 30, 38', '2, 28, 5, 68, 10', '2', 1, '2', '0'),
(1324, '10, 38, 43, 47, 15', '19, 53, 18, 57, 67', '', 0, '', ''),
(1325, '24, 27, 77, 65, 68', '2, 67, 26, 56, 57', '', 0, '', ''),
(1326, '14, 89, 74, 23, 3', '24, 23, 28, 1, 61', '23', 1, '3', '1'),
(1327, '77, 7, 60, 18, 35', '76, 41, 15, 30, 16', '', 0, '', ''),
(1328, '16, 26, 74, 20, 82', '89, 64, 52, 51, 54', '', 0, '', ''),
(1329, '9, 35, 39, 80, 83', '41, 3, 2, 42, 33', '', 0, '', ''),
(1330, '24, 74, 87, 10, 61', '51, 10, 9, 41, 70', '10', 1, '3', '1'),
(1331, '87, 17, 71, 89, 16', '7, 69, 59, 71, 43', '71', 1, '2', '3'),
(1332, '1, 65, 58, 47, 64', '55, 73, 77, 57, 40', '', 0, '', ''),
(1333, '14, 68, 29, 38, 62', '35, 11, 16, 20, 69', '', 0, '', ''),
(1334, '38, 49, 17, 51, 3', '14, 49, 81, 17, 35', '49, 17', 2, '1,2', '1,3'),
(1335, '16, 69, 76, 9, 32', '78, 46, 11, 14, 32', '32', 1, '4', '4'),
(1336, '16, 76, 19, 5, 11', '47, 13, 74, 55, 58', '', 0, '', ''),
(1337, '26, 64, 2, 56, 87', '21, 63, 67, 6, 87', '87', 1, '4', '4'),
(1338, '7, 13, 17, 51, 10', '75, 56, 9, 79, 70', '', 0, '', ''),
(1339, '51, 57, 16, 18, 62', '86, 79, 7, 60, 34', '', 0, '', ''),
(1340, '69, 57, 11, 19, 16', '49, 41, 47, 86, 38', '', 0, '', ''),
(1341, '86, 6, 81, 59, 43', '77, 32, 22, 41, 75', '', 0, '', ''),
(1342, '60, 74, 46, 38, 76', '34, 74, 57, 7, 63', '74', 1, '1', '1'),
(1343, '18, 5, 39, 38, 56', '75, 6, 73, 14, 51', '', 0, '', ''),
(1344, '8, 15, 1, 2, 67', '12, 8, 11, 18, 13', '8', 1, '0', '1'),
(1345, '61, 51, 50, 13, 41', '27, 57, 7, 89, 66', '', 0, '', ''),
(1346, '62, 28, 1, 65, 14', '69, 58, 52, 60, 83', '', 0, '', ''),
(1347, '78, 8, 71, 32, 90', '30, 36, 21, 10, 54', '', 0, '', ''),
(1348, '13, 72, 30, 37, 85', '36, 42, 80, 85, 53', '85', 1, '4', '3'),
(1349, '29, 16, 64, 79, 37', '50, 29, 66, 32, 23', '29', 1, '0', '1'),
(1350, '71, 12, 31, 21, 57', '69, 89, 77, 12, 83', '12', 1, '1', '3'),
(1351, '55, 1, 23, 76, 13', '36, 44, 67, 29, 40', '', 0, '', ''),
(1352, '85, 33, 12, 74, 26', '67, 65, 38, 52, 36', '', 0, '', ''),
(1353, '25, 5, 3, 75, 37', '14, 35, 51, 58, 47', '', 0, '', ''),
(1354, '61, 5, 89, 56, 72', '32, 17, 62, 47, 14', '', 0, '', ''),
(1355, '20, 4, 54, 63, 30', '29, 64, 69, 78, 20', '20', 1, '0', '4'),
(1356, '2, 5, 85, 57, 81', '9, 17, 5, 10, 8', '5', 1, '1', '2'),
(1357, '68, 62, 42, 23, 89', '58, 79, 15, 65, 14', '', 0, '', ''),
(1358, '83, 66, 53, 60, 52', '22, 6, 21, 71, 42', '', 0, '', ''),
(1359, '65, 17, 79, 83, 59', '8, 55, 19, 38, 23', '', 0, '', ''),
(1360, '27, 57, 4, 77, 40', '47, 9, 31, 44, 29', '', 0, '', ''),
(1361, '48, 31, 22, 13, 17', '8, 80, 90, 70, 26', '', 0, '', ''),
(1362, '30, 4, 80, 35, 41', '62, 58, 82, 20, 78', '', 0, '', ''),
(1363, '26, 3, 23, 7, 4', '29, 7, 45, 68, 62', '7', 1, '3', '1'),
(1364, '62, 13, 56, 45, 64', '30, 36, 88, 18, 13', '13', 1, '1', '4'),
(1365, '32, 65, 40, 63, 29', '48, 9, 87, 78, 69', '', 0, '', ''),
(1366, '11, 64, 49, 1, 33', '75, 76, 34, 82, 84', '', 0, '', ''),
(1367, '1, 4, 33, 60, 52', '43, 88, 76, 49, 4', '4', 1, '1', '4'),
(1368, '22, 54, 39, 2, 63', '28, 85, 16, 10, 63', '63', 1, '4', '4'),
(1369, '10, 76, 19, 6, 1', '16, 87, 10, 2, 66', '10', 1, '0', '2'),
(1370, '50, 87, 21, 14, 15', '39, 52, 8, 28, 26', '', 0, '', ''),
(1371, '20, 49, 22, 50, 30', '37, 32, 71, 53, 49', '49', 1, '1', '4'),
(1372, '25, 87, 47, 81, 56', '49, 70, 40, 64, 88', '', 0, '', ''),
(1373, '55, 21, 71, 62, 76', '40, 81, 24, 39, 6', '', 0, '', ''),
(1374, '25, 55, 82, 67, 86', '80, 31, 46, 19, 20', '', 0, '', ''),
(1375, '40, 53, 9, 29, 34', '59, 2, 69, 54, 1', '', 0, '', ''),
(1376, '30, 61, 35, 38, 13', '76, 68, 79, 85, 71', '', 0, '', ''),
(1377, '8, 14, 66, 71, 78', '36, 18, 67, 47, 43', '', 0, '', ''),
(1378, '86, 80, 7, 72, 35', '80, 57, 53, 64, 18', '80', 1, '1', '0'),
(1379, '87, 70, 45, 4, 84', '53, 52, 23, 68, 16', '', 0, '', ''),
(1380, '6, 67, 71, 80, 44', '90, 34, 71, 60, 1', '71', 1, '2', '2'),
(1381, '28, 85, 88, 40, 7', '17, 49, 4, 66, 68', '', 0, '', ''),
(1382, '84, 47, 9, 55, 78', '84, 25, 6, 31, 43', '84', 1, '0', '0'),
(1383, '23, 76, 61, 21, 54', '83, 68, 86, 46, 41', '', 0, '', ''),
(1384, '67, 88, 40, 37, 26', '27, 6, 16, 24, 64', '', 0, '', ''),
(1385, '67, 87, 18, 9, 40', '70, 33, 16, 38, 28', '', 0, '', ''),
(1386, '71, 35, 48, 21, 47', '73, 46, 89, 5, 85', '', 0, '', ''),
(1387, '35, 22, 34, 30, 70', '85, 27, 22, 70, 25', '22, 70', 2, '1,4', '2,3'),
(1388, '80, 30, 44, 8, 71', '79, 82, 55, 18, 30', '30', 1, '1', '4'),
(1389, '64, 50, 60, 66, 87', '14, 53, 11, 64, 77', '64', 1, '0', '3'),
(1390, '31, 9, 45, 17, 53', '14, 39, 70, 77, 3', '', 0, '', ''),
(1391, '85, 78, 49, 43, 41', '40, 41, 45, 50, 3', '41', 1, '4', '1'),
(1392, '90, 18, 60, 22, 21', '83, 16, 87, 68, 22', '22', 1, '3', '4'),
(1393, '40, 37, 47, 24, 17', '30, 51, 68, 37, 29', '37', 1, '1', '3'),
(1394, '22, 6, 43, 13, 60', '89, 5, 74, 17, 46', '', 0, '', ''),
(1395, '73, 17, 82, 29, 66', '64, 9, 18, 27, 12', '', 0, '', ''),
(1396, '89, 20, 55, 32, 62', '27, 76, 32, 54, 68', '32', 1, '3', '2'),
(1397, '17, 15, 56, 65, 45', '14, 52, 71, 63, 56', '56', 1, '2', '4'),
(1398, '87, 63, 56, 62, 82', '88, 86, 74, 58, 9', '', 0, '', ''),
(1399, '29, 83, 22, 38, 55', '67, 58, 63, 11, 37', '', 0, '', ''),
(1400, '5, 24, 7, 82, 72', '19, 5, 37, 2, 69', '5', 1, '0', '1'),
(1401, '10, 14, 7, 6, 36', '2, 12, 22, 21, 65', '', 0, '', ''),
(1402, '44, 68, 29, 38, 73', '8, 72, 58, 28, 34', '', 0, '', ''),
(1403, '80, 18, 21, 53, 30', '56, 16, 60, 90, 75', '', 0, '', ''),
(1404, '33, 32, 5, 6, 44', '78, 39, 77, 49, 25', '', 0, '', ''),
(1405, '38, 49, 59, 65, 60', '73, 75, 78, 46, 85', '', 0, '', ''),
(1406, '60, 18, 44, 84, 52', '49, 88, 62, 18, 37', '18', 1, '1', '3'),
(1407, '31, 53, 70, 27, 87', '66, 81, 1, 54, 64', '', 0, '', ''),
(1408, '30, 73, 82, 77, 70', '56, 71, 65, 68, 38', '', 0, '', ''),
(1409, '10, 47, 9, 29, 69', '4, 2, 49, 78, 48', '', 0, '', ''),
(1410, '56, 15, 12, 58, 55', '57, 7, 53, 74, 14', '', 0, '', ''),
(1411, '83, 21, 63, 22, 51', '7, 53, 49, 35, 60', '', 0, '', ''),
(1412, '62, 11, 33, 45, 66', '45, 23, 6, 34, 50', '45', 1, '3', '0'),
(1413, '86, 77, 22, 29, 27', '74, 79, 12, 39, 88', '', 0, '', ''),
(1414, '64, 86, 35, 31, 54', '29, 57, 75, 18, 78', '', 0, '', ''),
(1415, '42, 88, 17, 73, 85', '85, 51, 17, 68, 36', '85, 17', 2, '4,2', '0,2'),
(1416, '34, 81, 76, 60, 49', '85, 83, 5, 3, 59', '', 0, '', ''),
(1417, '36, 18, 19, 63, 10', '1, 64, 38, 16, 33', '', 0, '', ''),
(1418, '45, 25, 33, 3, 76', '5, 51, 88, 67, 86', '', 0, '', ''),
(1419, '57, 66, 38, 62, 53', '38, 53, 65, 47, 21', '38, 53', 2, '2,4', '0,1'),
(1420, '40, 35, 2, 50, 19', '15, 3, 70, 6, 57', '', 0, '', ''),
(1421, '53, 62, 1, 83, 3', '73, 81, 3, 52, 48', '3', 1, '4', '2'),
(1422, '24, 37, 52, 10, 85', '33, 2, 78, 60, 69', '', 0, '', ''),
(1423, '86, 46, 43, 54, 90', '46, 84, 60, 47, 6', '46', 1, '1', '0'),
(1424, '28, 70, 67, 23, 14', '66, 83, 15, 85, 76', '', 0, '', ''),
(1425, '88, 2, 72, 85, 27', '47, 50, 17, 14, 35', '', 0, '', ''),
(1426, '35, 66, 57, 44, 56', '75, 3, 81, 60, 39', '', 0, '', ''),
(1427, '58, 4, 31, 82, 83', '79, 78, 29, 2, 34', '', 0, '', ''),
(1428, '87, 65, 28, 60, 75', '6, 84, 19, 14, 41', '', 0, '', ''),
(1429, '31, 63, 89, 60, 46', '5, 64, 28, 90, 84', '', 0, '', ''),
(1430, '73, 8, 34, 18, 68', '34, 73, 62, 20, 83', '34, 73', 2, '2,0', '0,1'),
(1431, '77, 51, 46, 58, 4', '75, 11, 29, 7, 47', '', 0, '', ''),
(1432, '11, 68, 47, 58, 85', '22, 37, 14, 8, 2', '', 0, '', ''),
(1433, '74, 37, 56, 67, 65', '35, 17, 78, 88, 51', '', 0, '', ''),
(1434, '16, 83, 21, 61, 23', '68, 13, 88, 14, 28', '', 0, '', ''),
(1435, '10, 12, 57, 77, 72', '61, 85, 48, 67, 21', '', 0, '', ''),
(1436, '81, 30, 72, 48, 31', '51, 23, 56, 89, 90', '', 0, '', ''),
(1437, '70, 4, 82, 61, 54', '50, 6, 87, 54, 80', '54', 1, '4', '3'),
(1438, '15, 52, 71, 4, 16', '11, 53, 73, 70, 54', '', 0, '', ''),
(1439, '19, 48, 52, 73, 39', '84, 12, 69, 35, 58', '', 0, '', ''),
(1440, '28, 74, 70, 48, 45', '17, 45, 74, 80, 69', '45, 74', 2, '4,1', '1,2'),
(1441, '40, 30, 74, 29, 4', '2, 33, 29, 37, 51', '29', 1, '3', '2'),
(1442, '17, 32, 75, 70, 72', '14, 12, 88, 85, 82', '', 0, '', ''),
(1443, '72, 28, 69, 9, 51', '34, 26, 59, 54, 27', '', 0, '', ''),
(1444, '63, 41, 88, 9, 45', '85, 33, 7, 1, 53', '', 0, '', ''),
(1445, '31, 90, 41, 15, 36', '17, 90, 61, 66, 52', '90', 1, '1', '1'),
(1446, '86, 35, 58, 63, 23', '34, 48, 20, 33, 79', '', 0, '', ''),
(1447, '57, 21, 89, 52, 32', '53, 83, 44, 49, 2', '', 0, '', ''),
(1448, '6, 20, 40, 67, 33', '74, 83, 9, 90, 2', '', 0, '', ''),
(1449, '41, 43, 66, 15, 51', '2, 17, 21, 38, 24', '', 0, '', ''),
(1450, '16, 28, 34, 20, 19', '81, 85, 61, 70, 66', '', 0, '', '');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `lotto`
--
ALTER TABLE `lotto`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `lotto`
--
ALTER TABLE `lotto`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1451;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
