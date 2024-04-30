-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 30 أبريل 2024 الساعة 17:07
-- إصدار الخادم: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- بنية الجدول `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `address_uersid` int(11) NOT NULL,
  `adress_name` varchar(255) NOT NULL,
  `address_city` varchar(255) NOT NULL,
  `address_street` varchar(255) NOT NULL,
  `address_lat` double NOT NULL,
  `address_long` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `address`
--

INSERT INTO `address` (`address_id`, `address_uersid`, `adress_name`, `address_city`, `address_street`, `address_lat`, `address_long`) VALUES
(5, 17, 'fffv', 'dfff', 'ddffc', 37.416196472542985, -122.07973580807447);

-- --------------------------------------------------------

--
-- بنية الجدول `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `cart_usersid` int(11) NOT NULL,
  `cart_itemsid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `cart`
--

INSERT INTO `cart` (`cart_id`, `cart_usersid`, `cart_itemsid`) VALUES
(30, 19, 8),
(31, 19, 8);

-- --------------------------------------------------------

--
-- Stand-in structure for view `cartview`
-- (See below for the actual view)
--
CREATE TABLE `cartview` (
`itemsprice` double
,`countitems` bigint(21)
,`cart_id` int(11)
,`cart_usersid` int(11)
,`cart_itemsid` int(11)
,`items_id` int(11)
,`items_name` varchar(100)
,`items_name_ar` varchar(100)
,`items_desc` varchar(255)
,`items_desc_ar` varchar(255)
,`items_image` varchar(255)
,`itmes_count` int(11)
,`items_active` tinyint(4)
,`items_price` float
,`items_discount` smallint(6)
,`items_date` timestamp
,`items_cat` int(11)
);

-- --------------------------------------------------------

--
-- بنية الجدول `categories`
--

CREATE TABLE `categories` (
  `categories_id` int(11) NOT NULL,
  `categories_name` varchar(200) NOT NULL,
  `categories_name_ar` varchar(200) NOT NULL,
  `categories_image` varchar(255) NOT NULL,
  `categories_datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `categories`
--

INSERT INTO `categories` (`categories_id`, `categories_name`, `categories_name_ar`, `categories_image`, `categories_datetime`) VALUES
(1, 'laptop', 'لاب توب', 'laptop.svg', '2023-12-05 07:38:56'),
(2, 'mobile', 'هواتف', 'mobile.svg', '2023-12-05 07:39:55'),
(3, 'camera', 'كاميرا', 'camera.svg', '2023-12-05 07:40:25'),
(4, 'shoes', 'احذيه', 'shoes.svg', '2023-12-05 07:41:24'),
(5, 'dress', 'فستان', 'dress.svg', '2023-12-05 07:47:55'),
(6, 'dogs', 'كلاب', 'dog.svg', '2024-04-16 06:57:21');

-- --------------------------------------------------------

--
-- بنية الجدول `coupon`
--

CREATE TABLE `coupon` (
  `coupon_id` int(11) NOT NULL,
  `coupon_name` varchar(255) NOT NULL,
  `coupon_count` int(11) NOT NULL,
  `coupon_discount` smallint(6) NOT NULL DEFAULT 0,
  `coupon_expiredate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `favorite`
--

CREATE TABLE `favorite` (
  `favorite_id` int(11) NOT NULL,
  `favorite_usersid` int(11) NOT NULL,
  `favorite_itemsid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `favorite`
--

INSERT INTO `favorite` (`favorite_id`, `favorite_usersid`, `favorite_itemsid`) VALUES
(27, 17, 5),
(28, 17, 7),
(29, 19, 5),
(30, 19, 8);

-- --------------------------------------------------------

--
-- بنية الجدول `items`
--

CREATE TABLE `items` (
  `items_id` int(11) NOT NULL,
  `items_name` varchar(100) NOT NULL,
  `items_name_ar` varchar(100) NOT NULL,
  `items_desc` varchar(255) NOT NULL,
  `items_desc_ar` varchar(255) NOT NULL,
  `items_image` varchar(255) NOT NULL,
  `itmes_count` int(11) NOT NULL,
  `items_active` tinyint(4) NOT NULL DEFAULT 1,
  `items_price` float NOT NULL,
  `items_discount` smallint(6) NOT NULL,
  `items_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `items_cat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `items`
--

INSERT INTO `items` (`items_id`, `items_name`, `items_name_ar`, `items_desc`, `items_desc_ar`, `items_image`, `itmes_count`, `items_active`, `items_price`, `items_discount`, `items_date`, `items_cat`) VALUES
(5, 'laptop', 'لابتوب', 'laptop 4Gb', 'لابتوب4 رام', 'laptop.png', 2, 1, 15651, 0, '2024-02-07 14:04:18', 1),
(6, 'camera', 'كاميرا', 'camera7 gb', 'كاميرا 8 جيجا', 'camera.png', 2, 1, 5000, 0, '2024-02-07 14:05:15', 3),
(7, 'dog', 'كلب', 'Say hello to one of the longest living dog breeds!ity care and nutrition. .ll into their high teens if given qualitSay hello to one of the longest living dog breeds! These cuties can live well into their high teens if gist living dog breeds! These cutiese', 'كلب الماني رعي للصيد', 'dog.png', 1, 1, 5000, 0, '2024-04-16 06:48:47', 1),
(8, 'cat', 'قطه', 'cat syamy 2 mounth', 'قطه سيامي عمر شهرين', 'cat.png', 2, 1, 500, 20, '2024-04-27 10:38:08', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `items1view`
-- (See below for the actual view)
--
CREATE TABLE `items1view` (
`items_id` int(11)
,`items_name` varchar(100)
,`items_name_ar` varchar(100)
,`items_desc` varchar(255)
,`items_desc_ar` varchar(255)
,`items_image` varchar(255)
,`itmes_count` int(11)
,`items_active` tinyint(4)
,`items_price` float
,`items_discount` smallint(6)
,`items_date` timestamp
,`items_cat` int(11)
,`categories_id` int(11)
,`categories_name` varchar(200)
,`categories_name_ar` varchar(200)
,`categories_image` varchar(255)
,`categories_datetime` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `myfavorite`
-- (See below for the actual view)
--
CREATE TABLE `myfavorite` (
`favorite_id` int(11)
,`favorite_usersid` int(11)
,`favorite_itemsid` int(11)
,`items_id` int(11)
,`items_name` varchar(100)
,`items_name_ar` varchar(100)
,`items_desc` varchar(255)
,`items_desc_ar` varchar(255)
,`items_image` varchar(255)
,`itmes_count` int(11)
,`items_active` tinyint(4)
,`items_price` float
,`items_discount` smallint(6)
,`items_date` timestamp
,`items_cat` int(11)
,`users_id` int(11)
);

-- --------------------------------------------------------

--
-- بنية الجدول `users`
--

CREATE TABLE `users` (
  `users_id` int(11) NOT NULL,
  `users_name` varchar(100) NOT NULL,
  `users_email` varchar(100) NOT NULL,
  `users_password` varchar(255) NOT NULL,
  `users_phone` varchar(100) NOT NULL,
  `users_vrifycode` int(11) NOT NULL,
  `users_approve` tinyint(4) NOT NULL DEFAULT 0,
  `users_create` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `users`
--

INSERT INTO `users` (`users_id`, `users_name`, `users_email`, `users_password`, `users_phone`, `users_vrifycode`, `users_approve`, `users_create`) VALUES
(15, 'Ahmed', 'ahmed@gmail.com', '20eabe5d64b0e216796e834f52d61fd0b70332fc', '01016361536', 30662, 1, '2023-12-04 10:52:28'),
(16, 'Ahmed', 'admin@gmail.com', 'f865b53623b121fd34ee5426c792e5c33af8c227', '01016362536', 63386, 0, '2024-04-16 08:24:50'),
(17, 'ahmed', 'asdfg@gmail.com', '7cff6f8916b9239fd96abbfe30e51d854c5645b0', '145879632', 13694, 1, '2024-04-16 08:27:37'),
(18, 'fghdsd', 'qwert@gmail.com', '20eabe5d64b0e216796e834f52d61fd0b70332fc', '1457823695', 65508, 1, '2024-04-19 08:17:52'),
(19, 'tyuis', 'zxcvb@gmail.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', '1954891231', 52861, 1, '2024-04-24 10:28:03'),
(20, 'ahmedmagdy', 'asilme023@gmail.com', '3e70189e93855dd6e812103fce80b6ea7e8279eb', '01012514963', 69529, 0, '2024-04-24 10:32:13'),
(21, 'cartData', 'cartData@gmail.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', '1452789635', 77854, 0, '2024-04-24 10:35:26');

-- --------------------------------------------------------

--
-- Structure for view `cartview`
--
DROP TABLE IF EXISTS `cartview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cartview`  AS SELECT sum(`items`.`items_price` - `items`.`items_price` * `items`.`items_discount` / 100) AS `itemsprice`, count(`cart`.`cart_itemsid`) AS `countitems`, `cart`.`cart_id` AS `cart_id`, `cart`.`cart_usersid` AS `cart_usersid`, `cart`.`cart_itemsid` AS `cart_itemsid`, `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`itmes_count` AS `itmes_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_discount` AS `items_discount`, `items`.`items_date` AS `items_date`, `items`.`items_cat` AS `items_cat` FROM (`cart` join `items` on(`items`.`items_id` = `cart`.`cart_itemsid`)) GROUP BY `cart`.`cart_itemsid`, `cart`.`cart_usersid` ;

-- --------------------------------------------------------

--
-- Structure for view `items1view`
--
DROP TABLE IF EXISTS `items1view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `items1view`  AS SELECT `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`itmes_count` AS `itmes_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_discount` AS `items_discount`, `items`.`items_date` AS `items_date`, `items`.`items_cat` AS `items_cat`, `categories`.`categories_id` AS `categories_id`, `categories`.`categories_name` AS `categories_name`, `categories`.`categories_name_ar` AS `categories_name_ar`, `categories`.`categories_image` AS `categories_image`, `categories`.`categories_datetime` AS `categories_datetime` FROM (`items` join `categories` on(`items`.`items_cat` = `categories`.`categories_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `myfavorite`
--
DROP TABLE IF EXISTS `myfavorite`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `myfavorite`  AS SELECT `favorite`.`favorite_id` AS `favorite_id`, `favorite`.`favorite_usersid` AS `favorite_usersid`, `favorite`.`favorite_itemsid` AS `favorite_itemsid`, `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`itmes_count` AS `itmes_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_discount` AS `items_discount`, `items`.`items_date` AS `items_date`, `items`.`items_cat` AS `items_cat`, `users`.`users_id` AS `users_id` FROM ((`favorite` join `users` on(`users`.`users_id` = `favorite`.`favorite_usersid`)) join `items` on(`items`.`items_id` = `favorite`.`favorite_itemsid`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `address_uersid` (`address_uersid`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_usersid` (`cart_usersid`),
  ADD KEY `cart_itemsid` (`cart_itemsid`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categories_id`);

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`favorite_id`),
  ADD KEY `favorite_itemsid` (`favorite_itemsid`),
  ADD KEY `favorite_usersid` (`favorite_usersid`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`items_id`),
  ADD KEY `items_cat` (`items_cat`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`users_id`),
  ADD UNIQUE KEY `users_email` (`users_email`),
  ADD UNIQUE KEY `users_phone` (`users_phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categories_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `coupon`
--
ALTER TABLE `coupon`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorite`
--
ALTER TABLE `favorite`
  MODIFY `favorite_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `items_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `users_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- قيود الجداول المُلقاة.
--

--
-- قيود الجداول `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`address_uersid`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- قيود الجداول `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`cart_usersid`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`cart_itemsid`) REFERENCES `items` (`items_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- قيود الجداول `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`favorite_itemsid`) REFERENCES `items` (`items_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`favorite_usersid`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- قيود الجداول `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`items_cat`) REFERENCES `categories` (`categories_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
