-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2018 at 09:20 PM
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
  `billID` int(11) NOT NULL,
  `proID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='chi tiết đơn hàng';

-- --------------------------------------------------------

--
-- Table structure for table `billlist`
--

CREATE TABLE `billlist` (
  `billID` int(11) NOT NULL,
  `username` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `createTime` datetime NOT NULL,
  `billStatus` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='danh sách đơn hàng';

-- --------------------------------------------------------

--
-- Table structure for table `bookdetail`
--

CREATE TABLE `bookdetail` (
  `bookID` int(11) NOT NULL,
  `serviceID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='chi tiết đặt chỗ';

-- --------------------------------------------------------

--
-- Table structure for table `booklist`
--

CREATE TABLE `booklist` (
  `bookID` int(11) NOT NULL,
  `username` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `bookTime` datetime NOT NULL,
  `createTime` datetime NOT NULL,
  `bookStatus` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='danh sách đặt chỗ';

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `catID` int(11) NOT NULL,
  `catName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `isService` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`catID`, `catName`, `isService`) VALUES
(1, 'Tạo kiểu tóc', 1),
(2, 'Tạo kiểu râu', 1),
(3, 'Dịch vụ khác', 1),
(4, 'Gel tạo kiểu tóc', 0),
(5, 'Thuốc nhuộm', 0),
(6, 'Dầu gội', 0);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `proID` int(11) NOT NULL,
  `proName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `catID` int(11) NOT NULL,
  `proBrand` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `proInfo` text COLLATE utf8_unicode_ci,
  `proDetail` text COLLATE utf8_unicode_ci,
  `proPrice` int(11) NOT NULL,
  `proQuantity` int(11) NOT NULL COMMENT 'số lượng sản phẩm còn lại trong kho'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='danh mục sản phẩm';

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`proID`, `proName`, `catID`, `proBrand`, `proInfo`, `proDetail`, `proPrice`, `proQuantity`) VALUES
(0, 'Gel vuốt tóc 1', 4, 'Nivea', 'Nhãn hiệu keo vuốt tóc được tin dùng số 1 tại Mỹ', '<ul>\r\n    <li>\r\n        GEL là 1 loại sản phẩm có khả năng giữ nếp chắc nhất,cứng nhất và giữ được độ bóng lâu nhất.\r\n    </li>\r\n\r\n    <li>\r\n        Thích hợp cho những tóc dày có độ dài từ ngắn đến trung bình.\r\n    </li>\r\n\r\n    <li>\r\n        Mùi hương từ hoa lài sẽ làm bạn cảm giác dể chịu.\r\n    </li>\r\n\r\n    <li>\r\n        Bạn hạn chế việc chạm vào tóc sau khi vuốt để tránh tóc bị mất nếp.Rửa tay ngay sau khi sử dụng sản phẩm vì có độ dính rất\r\n        cao.\r\n    </li>\r\n</ul>', 250000, 43),
(1, 'Gel vuốt tóc 1', 4, 'Pantene', 'Nhãn hiệu keo vuốt tóc được tin dùng số 1 tại Mỹ', '<ul>\r\n    <li>\r\n        GEL là 1 loại sản phẩm có khả năng giữ nếp chắc nhất,cứng nhất và giữ được độ bóng lâu nhất.\r\n    </li>\r\n\r\n    <li>\r\n        Thích hợp cho những tóc dày có độ dài từ ngắn đến trung bình.\r\n    </li>\r\n\r\n    <li>\r\n        Mùi hương từ hoa lài sẽ làm bạn cảm giác dể chịu.\r\n    </li>\r\n\r\n    <li>\r\n        Bạn hạn chế việc chạm vào tóc sau khi vuốt để tránh tóc bị mất nếp.Rửa tay ngay sau khi sử dụng sản phẩm vì có độ dính rất\r\n        cao.\r\n    </li>\r\n</ul>', 250000, 56),
(2, 'Gel vuốt tóc 2', 4, 'Romano', 'Nhãn hiệu keo vuốt tóc được tin dùng số 1 tại Mỹ', '<ul>\r\n    <li>\r\n        GEL là 1 loại sản phẩm có khả năng giữ nếp chắc nhất,cứng nhất và giữ được độ bóng lâu nhất.\r\n    </li>\r\n\r\n    <li>\r\n        Thích hợp cho những tóc dày có độ dài từ ngắn đến trung bình.\r\n    </li>\r\n\r\n    <li>\r\n        Mùi hương từ hoa lài sẽ làm bạn cảm giác dể chịu.\r\n    </li>\r\n\r\n    <li>\r\n        Bạn hạn chế việc chạm vào tóc sau khi vuốt để tránh tóc bị mất nếp.Rửa tay ngay sau khi sử dụng sản phẩm vì có độ dính rất\r\n        cao.\r\n    </li>\r\n</ul>', 250000, 62),
(3, 'Gel vuốt tóc 3', 4, 'Pantene', 'Nhãn hiệu keo vuốt tóc được tin dùng số 1 tại Mỹ', '<ul>\r\n    <li>\r\n        GEL là 1 loại sản phẩm có khả năng giữ nếp chắc nhất,cứng nhất và giữ được độ bóng lâu nhất.\r\n    </li>\r\n\r\n    <li>\r\n        Thích hợp cho những tóc dày có độ dài từ ngắn đến trung bình.\r\n    </li>\r\n\r\n    <li>\r\n        Mùi hương từ hoa lài sẽ làm bạn cảm giác dể chịu.\r\n    </li>\r\n\r\n    <li>\r\n        Bạn hạn chế việc chạm vào tóc sau khi vuốt để tránh tóc bị mất nếp.Rửa tay ngay sau khi sử dụng sản phẩm vì có độ dính rất\r\n        cao.\r\n    </li>\r\n</ul>', 250000, 23),
(4, ' Gel vuốt tóc 4', 4, 'X-Men', 'Nhãn hiệu keo vuốt tóc được tin dùng số 1 tại Mỹ', '<ul>\r\n    <li>\r\n        GEL là 1 loại sản phẩm có khả năng giữ nếp chắc nhất,cứng nhất và giữ được độ bóng lâu nhất.\r\n    </li>\r\n\r\n    <li>\r\n        Thích hợp cho những tóc dày có độ dài từ ngắn đến trung bình.\r\n    </li>\r\n\r\n    <li>\r\n        Mùi hương từ hoa lài sẽ làm bạn cảm giác dể chịu.\r\n    </li>\r\n\r\n    <li>\r\n        Bạn hạn chế việc chạm vào tóc sau khi vuốt để tránh tóc bị mất nếp.Rửa tay ngay sau khi sử dụng sản phẩm vì có độ dính rất\r\n        cao.\r\n    </li>\r\n</ul>', 250000, 41),
(5, 'Gel vuốt tóc 5', 4, 'X-Men', 'Nhãn hiệu keo vuốt tóc được tin dùng số 1 tại Mỹ', '<ul>\r\n    <li>\r\n        GEL là 1 loại sản phẩm có khả năng giữ nếp chắc nhất,cứng nhất và giữ được độ bóng lâu nhất.\r\n    </li>\r\n\r\n    <li>\r\n        Thích hợp cho những tóc dày có độ dài từ ngắn đến trung bình.\r\n    </li>\r\n\r\n    <li>\r\n        Mùi hương từ hoa lài sẽ làm bạn cảm giác dể chịu.\r\n    </li>\r\n\r\n    <li>\r\n        Bạn hạn chế việc chạm vào tóc sau khi vuốt để tránh tóc bị mất nếp.Rửa tay ngay sau khi sử dụng sản phẩm vì có độ dính rất\r\n        cao.\r\n    </li>\r\n</ul>', 250000, 11),
(100, 'Thuốc nhuộm loại 1', 5, 'X-Men', 'Thuốc nhuộm xịn', '<ul>\r\n    <li>\r\n        Màu sắc tươi tắn.\r\n    </li>\r\n\r\n    <li>\r\n        Không làm tổn thương tóc\r\n    </li>\r\n\r\n    <li>\r\n        Mùi hương từ hoa hồng sẽ làm bạn cảm giác dễ chịu, quyến rũ.\r\n    </li>\r\n</ul>', 420000, 15),
(101, 'Thuốc nhuộm loại 2', 5, 'Clear', 'Thuốc nhuộm cực kì xịn', '<ul>\r\n    <li>\r\n        Màu sắc tươi tắn.\r\n    </li>\r\n\r\n    <li>\r\n        Không làm tổn thương tóc\r\n    </li>\r\n\r\n    <li>\r\n        Mùi hương từ hoa hồng sẽ làm bạn cảm giác dễ chịu, quyến rũ.\r\n    </li>\r\n</ul>', 550000, 24),
(200, 'Dầu gội làm mượt tóc X-Men', 6, 'X-Men', 'Dầu gội làm mượt tóc được tin dùng số 1 khắp châu Phi', '<ul>\r\n    <li>\r\n        Tạo độ mượt cho tóc.\r\n    </li>\r\n\r\n    <li>\r\n        Giữ nếp tóc lâu hơn.\r\n    </li>\r\n\r\n    <li>\r\n        Mùi hương từ hoa dâm bụt sẽ làm bạn cảm giác dể chịu.\r\n    </li>\r\n</ul>', 240000, 13),
(201, 'Dầu gội trị gàu Pantene', 6, 'Pantene', 'Dầu gội trị gàu được tin dùng số 1 châu Á', '<ul>\r\n    <li>\r\n        Trị gàu trên da đầu.\r\n    </li>\r\n\r\n    <li>\r\n        Ngoài ra còn đặc trị chí, rận (nếu có).\r\n    </li>\r\n\r\n    <li>\r\n        Mùi hương từ hoa hướng dương sẽ làm bạn cảm giác dễ chịu, quyến rũ.\r\n    </li>\r\n</ul>', 340000, 23);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `serID` int(11) NOT NULL,
  `serName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `catID` int(11) NOT NULL,
  `serInfo` text COLLATE utf8_unicode_ci,
  `serPrice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='danh mục dịch vụ';

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`serID`, `serName`, `catID`, `serInfo`, `serPrice`) VALUES
(0, 'Undercut 7/3', 1, '<UL>\r\n <LI>Đây là kiểu tóc được cắt sát xung \r\n quanh và phần mái để dài từ 5-7cm, phần \r\n tóc mái được chải dựng cứng.</LI>\r\n <LI>Đôi khi, chúng còn được nhấn nhá \r\n thêm với những đường cạo ấn tượng.</LI>\r\n</UL>', 200000),
(1, 'Undercut cổ điển', 1, '<UL>\r\n <LI>Đây là kiểu tóc được cắt sát xung \r\n quanh và phần mái để dài từ 5-7cm, phần \r\n tóc mái được chải dựng cứng.</LI>\r\n <LI>Đôi khi, chúng còn được nhấn nhá \r\n thêm với những đường cạo ấn tượng.</LI>\r\n</UL>', 300000),
(2, 'Undercut 2', 1, '<UL>\r\n <LI>Đây là kiểu tóc được cắt sát xung \r\n quanh và phần mái để dài từ 5-7cm, phần \r\n tóc mái được chải dựng cứng.</LI>\r\n <LI>Đôi khi, chúng còn được nhấn nhá \r\n thêm với những đường cạo ấn tượng.</LI>\r\n</UL>', 300000),
(3, 'Undercut 3', 1, '<UL>\r\n <LI>Đây là kiểu tóc được cắt sát xung \r\n quanh và phần mái để dài từ 5-7cm, phần \r\n tóc mái được chải dựng cứng.</LI>\r\n <LI>Đôi khi, chúng còn được nhấn nhá \r\n thêm với những đường cạo ấn tượng.</LI>\r\n</UL>', 300000),
(4, 'Undercut 4', 1, '<UL>\r\n <LI>Đây là kiểu tóc được cắt sát xung \r\n quanh và phần mái để dài từ 5-7cm, phần \r\n tóc mái được chải dựng cứng.</LI>\r\n <LI>Đôi khi, chúng còn được nhấn nhá \r\n thêm với những đường cạo ấn tượng.</LI>\r\n</UL>', 300000),
(5, 'Undercut 5', 1, '<UL>\r\n <LI>Đây là kiểu tóc được cắt sát xung \r\n quanh và phần mái để dài từ 5-7cm, phần \r\n tóc mái được chải dựng cứng.</LI>\r\n <LI>Đôi khi, chúng còn được nhấn nhá \r\n thêm với những đường cạo ấn tượng.</LI>\r\n</UL>', 300000),
(6, 'Undercut 6', 1, '<UL>\r\n <LI>Đây là kiểu tóc được cắt sát xung \r\n quanh và phần mái để dài từ 5-7cm, phần \r\n tóc mái được chải dựng cứng.</LI>\r\n <LI>Đôi khi, chúng còn được nhấn nhá \r\n thêm với những đường cạo ấn tượng.</LI>\r\n</UL>', 300000),
(7, 'Undercut 7', 1, '<UL>\r\n <LI>Đây là kiểu tóc được cắt sát xung \r\n quanh và phần mái để dài từ 5-7cm, phần \r\n tóc mái được chải dựng cứng.</LI>\r\n <LI>Đôi khi, chúng còn được nhấn nhá \r\n thêm với những đường cạo ấn tượng.</LI>\r\n</UL>', 300000),
(8, 'Undercut 8', 1, '<UL>\r\n <LI>Đây là kiểu tóc được cắt sát xung \r\n quanh và phần mái để dài từ 5-7cm, phần \r\n tóc mái được chải dựng cứng.</LI>\r\n <LI>Đôi khi, chúng còn được nhấn nhá \r\n thêm với những đường cạo ấn tượng.</LI>\r\n</UL>', 300000),
(9, 'Undercut 9', 1, '<UL>\r\n <LI>Đây là kiểu tóc được cắt sát xung \r\n quanh và phần mái để dài từ 5-7cm, phần \r\n tóc mái được chải dựng cứng.</LI>\r\n <LI>Đôi khi, chúng còn được nhấn nhá \r\n thêm với những đường cạo ấn tượng.</LI>\r\n</UL>', 300000),
(10, 'Undercut 10', 1, '<UL>\r\n <LI>Đây là kiểu tóc được cắt sát xung \r\n quanh và phần mái để dài từ 5-7cm, phần \r\n tóc mái được chải dựng cứng.</LI>\r\n <LI>Đôi khi, chúng còn được nhấn nhá \r\n thêm với những đường cạo ấn tượng.</LI>\r\n</UL>', 300000),
(11, 'Undercut 11', 1, '<UL>\r\n <LI>Đây là kiểu tóc được cắt sát xung \r\n quanh và phần mái để dài từ 5-7cm, phần \r\n tóc mái được chải dựng cứng.</LI>\r\n <LI>Đôi khi, chúng còn được nhấn nhá \r\n thêm với những đường cạo ấn tượng.</LI>\r\n</UL>', 300000),
(12, 'Undercut 12', 1, '<UL>\r\n <LI>Đây là kiểu tóc được cắt sát xung \r\n quanh và phần mái để dài từ 5-7cm, phần \r\n tóc mái được chải dựng cứng.</LI>\r\n <LI>Đôi khi, chúng còn được nhấn nhá \r\n thêm với những đường cạo ấn tượng.</LI>\r\n</UL>', 300000),
(13, 'Undercut 13', 1, '<UL>\r\n <LI>Đây là kiểu tóc được cắt sát xung \r\n quanh và phần mái để dài từ 5-7cm, phần \r\n tóc mái được chải dựng cứng.</LI>\r\n <LI>Đôi khi, chúng còn được nhấn nhá \r\n thêm với những đường cạo ấn tượng.</LI>\r\n</UL>', 300000),
(14, 'Undercut 14', 1, '<UL>\r\n <LI>Đây là kiểu tóc được cắt sát xung \r\n quanh và phần mái để dài từ 5-7cm, phần \r\n tóc mái được chải dựng cứng.</LI>\r\n <LI>Đôi khi, chúng còn được nhấn nhá \r\n thêm với những đường cạo ấn tượng.</LI>\r\n</UL>', 300000),
(15, 'Undercut 15', 1, '<UL>\r\n <LI>Đây là kiểu tóc được cắt sát xung \r\n quanh và phần mái để dài từ 5-7cm, phần \r\n tóc mái được chải dựng cứng.</LI>\r\n <LI>Đôi khi, chúng còn được nhấn nhá \r\n thêm với những đường cạo ấn tượng.</LI>\r\n</UL>', 300000),
(16, 'Undercut 16', 1, '<UL>\r\n <LI>Đây là kiểu tóc được cắt sát xung \r\n quanh và phần mái để dài từ 5-7cm, phần \r\n tóc mái được chải dựng cứng.</LI>\r\n <LI>Đôi khi, chúng còn được nhấn nhá \r\n thêm với những đường cạo ấn tượng.</LI>\r\n</UL>', 300000),
(17, 'Undercut 17', 1, '<UL>\r\n <LI>Đây là kiểu tóc được cắt sát xung \r\n quanh và phần mái để dài từ 5-7cm, phần \r\n tóc mái được chải dựng cứng.</LI>\r\n <LI>Đôi khi, chúng còn được nhấn nhá \r\n thêm với những đường cạo ấn tượng.</LI>\r\n</UL>', 300000),
(18, 'Undercut 18', 1, '<UL>\r\n <LI>Đây là kiểu tóc được cắt sát xung \r\n quanh và phần mái để dài từ 5-7cm, phần \r\n tóc mái được chải dựng cứng.</LI>\r\n <LI>Đôi khi, chúng còn được nhấn nhá \r\n thêm với những đường cạo ấn tượng.</LI>\r\n</UL>', 300000),
(19, 'Undercut 19', 1, '<UL>\r\n <LI>Đây là kiểu tóc được cắt sát xung \r\n quanh và phần mái để dài từ 5-7cm, phần \r\n tóc mái được chải dựng cứng.</LI>\r\n <LI>Đôi khi, chúng còn được nhấn nhá \r\n thêm với những đường cạo ấn tượng.</LI>\r\n</UL>', 300000),
(20, 'Undercut 20', 1, '<UL>\r\n <LI>Đây là kiểu tóc được cắt sát xung \r\n quanh và phần mái để dài từ 5-7cm, phần \r\n tóc mái được chải dựng cứng.</LI>\r\n <LI>Đôi khi, chúng còn được nhấn nhá \r\n thêm với những đường cạo ấn tượng.</LI>\r\n</UL>', 300000),
(21, 'Undercut 21', 1, '<UL>\r\n <LI>Đây là kiểu tóc được cắt sát xung \r\n quanh và phần mái để dài từ 5-7cm, phần \r\n tóc mái được chải dựng cứng.</LI>\r\n <LI>Đôi khi, chúng còn được nhấn nhá \r\n thêm với những đường cạo ấn tượng.</LI>\r\n</UL>', 300000),
(22, 'Undercut 22', 1, '<UL>\r\n <LI>Đây là kiểu tóc được cắt sát xung \r\n quanh và phần mái để dài từ 5-7cm, phần \r\n tóc mái được chải dựng cứng.</LI>\r\n <LI>Đôi khi, chúng còn được nhấn nhá \r\n thêm với những đường cạo ấn tượng.</LI>\r\n</UL>', 300000),
(23, 'Undercut 23', 1, '<UL>\r\n <LI>Đây là kiểu tóc được cắt sát xung \r\n quanh và phần mái để dài từ 5-7cm, phần \r\n tóc mái được chải dựng cứng.</LI>\r\n <LI>Đôi khi, chúng còn được nhấn nhá \r\n thêm với những đường cạo ấn tượng.</LI>\r\n</UL>', 300000),
(24, 'Undercut 24', 1, '<UL>\r\n <LI>Đây là kiểu tóc được cắt sát xung \r\n quanh và phần mái để dài từ 5-7cm, phần \r\n tóc mái được chải dựng cứng.</LI>\r\n <LI>Đôi khi, chúng còn được nhấn nhá \r\n thêm với những đường cạo ấn tượng.</LI>\r\n</UL>', 300000),
(100, 'Kiểu râu 0', 2, '<p>Đây là kiểu râu hoàn hảo dành cho những quý ông không có nhiều thời gian để chăm sóc cho bộ râu của mình. Điểm ấn tượng nhất của bộ râu này chính là phần râu cổ và phần ria mép độc lập, tách rời khỏi phần râu má.</p>', 150000),
(101, 'Kiểu râu 1', 2, '<p>Đây là kiểu râu hoàn hảo dành cho những quý ông không có nhiều thời gian để chăm sóc cho bộ râu của mình. Điểm ấn tượng nhất của bộ râu này chính là phần râu cổ và phần ria mép độc lập, tách rời khỏi phần râu má.</p>', 150000),
(102, 'Kiểu râu 2', 2, '<p>Đây là kiểu râu hoàn hảo dành cho những quý ông không có nhiều thời gian để chăm sóc cho bộ râu của mình. Điểm ấn tượng nhất của bộ râu này chính là phần râu cổ và phần ria mép độc lập, tách rời khỏi phần râu má.</p>', 150000),
(103, 'Kiểu râu 3', 2, '<p>Đây là kiểu râu hoàn hảo dành cho những quý ông không có nhiều thời gian để chăm sóc cho bộ râu của mình. Điểm ấn tượng nhất của bộ râu này chính là phần râu cổ và phần ria mép độc lập, tách rời khỏi phần râu má.</p>', 150000),
(104, 'Kiểu râu 4', 2, '<p>Đây là kiểu râu hoàn hảo dành cho những quý ông không có nhiều thời gian để chăm sóc cho bộ râu của mình. Điểm ấn tượng nhất của bộ râu này chính là phần râu cổ và phần ria mép độc lập, tách rời khỏi phần râu má.</p>', 150000),
(105, 'Kiểu râu 5', 2, '<p>Đây là kiểu râu hoàn hảo dành cho những quý ông không có nhiều thời gian để chăm sóc cho bộ râu của mình. Điểm ấn tượng nhất của bộ râu này chính là phần râu cổ và phần ria mép độc lập, tách rời khỏi phần râu má.</p>', 150000),
(106, 'Kiểu râu 6', 2, '<p>Đây là kiểu râu hoàn hảo dành cho những quý ông không có nhiều thời gian để chăm sóc cho bộ râu của mình. Điểm ấn tượng nhất của bộ râu này chính là phần râu cổ và phần ria mép độc lập, tách rời khỏi phần râu má.</p>', 150000),
(107, 'Kiểu râu 7', 2, '<p>Đây là kiểu râu hoàn hảo dành cho những quý ông không có nhiều thời gian để chăm sóc cho bộ râu của mình. Điểm ấn tượng nhất của bộ râu này chính là phần râu cổ và phần ria mép độc lập, tách rời khỏi phần râu má.</p>', 150000),
(108, 'Kiểu râu 8', 2, '<p>Đây là kiểu râu hoàn hảo dành cho những quý ông không có nhiều thời gian để chăm sóc cho bộ râu của mình. Điểm ấn tượng nhất của bộ râu này chính là phần râu cổ và phần ria mép độc lập, tách rời khỏi phần râu má.</p>', 150000),
(200, 'Gội đầu', 3, NULL, 130000),
(201, 'Duỗi tóc', 3, NULL, 240000),
(202, 'Hấp dầu', 3, NULL, 350000),
(203, 'Lấy ráy tai', 3, NULL, 180000),
(204, 'Nhuộm tóc', 3, NULL, 450000);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(10) UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `isAdmin` tinyint(1) NOT NULL,
  `isBlock` tinyint(1) NOT NULL,
  `opendate` date NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `phone` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='thông tin tài khoản';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `isAdmin`, `isBlock`, `opendate`, `fullname`, `gender`, `phone`, `email`, `address`) VALUES
('1512501', 'user@123', 0, 0, '2018-06-08', 'Đặng Quốc Thái', 1, '0969942316', '1512501@student.hcmus.edu.vn', 'unknown'),
('1512528', 'user@123', 0, 0, '2018-06-08', 'Nguyễn Trí Thâm', 1, '0962525633', '1512528@student.hcmus.edu.vn', 'unknown'),
('1512582', 'user@123', 0, 0, '2018-06-08', 'Đoàn Minh Toàn', 1, '01993893370', '1512582@student.hcmus.edu.vn', 'unknown'),
('admin', 'admin', 1, 0, '2018-06-01', 'admin', 0, '0987654321', 'admin@email.com', '227 Nguyen Van Cu, Q5');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `billdetail`
--
ALTER TABLE `billdetail`
  ADD PRIMARY KEY (`billID`,`proID`),
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
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`catID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`proID`),
  ADD KEY `products_ibfk_1` (`catID`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`serID`),
  ADD KEY `catID` (`catID`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

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
  ADD CONSTRAINT `billdetail_ibfk_1` FOREIGN KEY (`billID`) REFERENCES `billlist` (`billID`);

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
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`catID`) REFERENCES `categories` (`catID`);

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_ibfk_1` FOREIGN KEY (`catID`) REFERENCES `categories` (`catID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
