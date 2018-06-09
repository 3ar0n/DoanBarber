-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2018 at 11:06 AM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `barbershop`
--

-- --------------------------------------------------------

--
-- Table structure for table `billdetail`
--

CREATE TABLE `billdetail` (
  `cartID` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `proID` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='chi tiết đơn hàng';

--
-- Dumping data for table `billdetail`
--

INSERT INTO `billdetail` (`cartID`, `proID`, `quantity`) VALUES
('bl180001', 'sph001', 1),
('bl180001', 'sph003', 2);

-- --------------------------------------------------------

--
-- Table structure for table `billlist`
--

CREATE TABLE `billlist` (
  `billID` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `createTime` datetime NOT NULL,
  `billStatus` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='danh sách đơn hàng';

--
-- Dumping data for table `billlist`
--

INSERT INTO `billlist` (`billID`, `username`, `createTime`, `billStatus`) VALUES
('bl180001', '1512501', '2018-06-02 18:23:09', 'hoàn tất');

-- --------------------------------------------------------

--
-- Table structure for table `bookdetail`
--

CREATE TABLE `bookdetail` (
  `bookID` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `serviceID` varchar(8) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='chi tiết đặt chỗ';

--
-- Dumping data for table `bookdetail`
--

INSERT INTO `bookdetail` (`bookID`, `serviceID`) VALUES
('bk180001', 'hbd001'),
('bk180001', 'hst002'),
('bk180002', 'hbd001'),
('bk180002', 'hst001'),
('bk180003', 'hbd001'),
('bk180003', 'hbd002'),
('bk180003', 'hst002');

-- --------------------------------------------------------

--
-- Table structure for table `booklist`
--

CREATE TABLE `booklist` (
  `bookID` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `bookTime` datetime NOT NULL,
  `createTime` datetime NOT NULL,
  `bookStatus` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='danh sách đặt chỗ';

--
-- Dumping data for table `booklist`
--

INSERT INTO `booklist` (`bookID`, `username`, `bookTime`, `createTime`, `bookStatus`) VALUES
('bk180001', '1512501', '2018-06-03 09:00:00', '2018-05-31 12:20:44', 'hoàn thành'),
('bk180002', '1512528', '2018-06-11 16:00:00', '2018-06-08 19:30:39', 'đang chờ'),
('bk180003', '1512582', '2018-06-15 15:00:00', '2018-06-09 09:44:11', 'đang chờ');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `username` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='thông tin khách hàng';

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`username`, `fullname`, `phone`, `email`, `address`) VALUES
('1512501', 'Đặng Quốc Thái', '0969942316', NULL, NULL),
('1512528', 'Nguyễn Trí Thâm', '0962525633', NULL, NULL),
('1512582', 'Đoàn Minh Toàn', '01993893379', NULL, NULL),
('admin', 'admin', '0987654321', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `proID` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `proName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `proType` int(11) NOT NULL,
  `proBrand` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `proInfo` text COLLATE utf8_unicode_ci,
  `proPrice` int(11) NOT NULL,
  `proQuantity` int(11) NOT NULL COMMENT 'số lượng sản phẩm còn lại trong kho'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='danh mục sản phẩm';

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`proID`, `proName`, `proType`, `proBrand`, `proInfo`, `proPrice`, `proQuantity`) VALUES
('sph001', 'Sơn móng tay', 1, 'Sony', 'Bền, đẹp, thơm lâu đến 7 ngày', 50000, 0),
('sph002', 'Thuốc nhuộm tóc', 2, 'Apple', 'Thiết kế tinh tế, giữ màu tóc đến lần nhuộm sau', 1000000, 2),
('sph003', 'Sữa rửa mặt', 3, 'Dell', 'Hết nhờn, hết mụn, không gây kích ứng da', 76000, 10),
('sph004', 'Sữa rửa mặt', 3, 'Asus', 'Giúp da sáng mịn và ngăn ngừa mụn quay trở lại', 58000, 6);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `serID` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `serName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `serType` int(11) NOT NULL,
  `serInfo` text COLLATE utf8_unicode_ci,
  `serPrice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='danh mục dịch vụ';

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`serID`, `serName`, `serType`, `serInfo`, `serPrice`) VALUES
('hbd001', 'Cạo lông mặt', 2, NULL, 20000),
('hbd002', 'Vệ sinh tai', 2, NULL, 20000),
('hst001', 'Tóc húi cua', 1, NULL, 30000),
('hst002', 'Tóc xù', 1, NULL, 30000);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `type` tinyint(1) NOT NULL,
  `block` tinyint(1) NOT NULL,
  `opendate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='thông tin tài khoản';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `type`, `block`, `opendate`) VALUES
('1512501', 'user@123', 0, 0, '2018-06-08'),
('1512528', 'user@123', 0, 0, '2018-06-08'),
('1512582', 'user@123', 0, 0, '2018-06-08'),
('admin', 'admin', 1, 0, '2018-06-01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `billdetail`
--
ALTER TABLE `billdetail`
  ADD PRIMARY KEY (`cartID`,`proID`),
  ADD KEY `proID` (`proID`);

--
-- Indexes for table `billlist`
--
ALTER TABLE `billlist`
  ADD PRIMARY KEY (`billID`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `bookdetail`
--
ALTER TABLE `bookdetail`
  ADD PRIMARY KEY (`bookID`,`serviceID`),
  ADD KEY `serviceID` (`serviceID`);

--
-- Indexes for table `booklist`
--
ALTER TABLE `booklist`
  ADD PRIMARY KEY (`bookID`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`proID`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`serID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `billdetail`
--
ALTER TABLE `billdetail`
  ADD CONSTRAINT `billdetail_ibfk_1` FOREIGN KEY (`proID`) REFERENCES `products` (`proID`),
  ADD CONSTRAINT `billdetail_ibfk_2` FOREIGN KEY (`cartID`) REFERENCES `billlist` (`billID`);

--
-- Constraints for table `billlist`
--
ALTER TABLE `billlist`
  ADD CONSTRAINT `billlist_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

--
-- Constraints for table `bookdetail`
--
ALTER TABLE `bookdetail`
  ADD CONSTRAINT `bookdetail_ibfk_1` FOREIGN KEY (`bookID`) REFERENCES `booklist` (`bookID`),
  ADD CONSTRAINT `bookdetail_ibfk_2` FOREIGN KEY (`serviceID`) REFERENCES `services` (`serID`);

--
-- Constraints for table `booklist`
--
ALTER TABLE `booklist`
  ADD CONSTRAINT `booklist_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
