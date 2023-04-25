-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2023 at 09:48 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `supershop_rdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL COMMENT 'ADMINS ID',
  `admin_name` varchar(64) NOT NULL,
  `admin_email` varchar(64) NOT NULL,
  `admin_image` text NOT NULL,
  `admin_password` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `admin_status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `admin_type` enum('Root Admin','Content Manager','Sales Manager','Technical Operator') NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `admin_name`, `admin_email`, `admin_image`, `admin_password`, `admin_status`, `admin_type`, `created_at`, `updated_at`) VALUES
(1, 'Francis Lopez', 'fslntsho@gmail.com', 'ADMINIMAGE_20230424105602_123079378_1067152053719654_66737.png', 'f865b53623b121fd34ee5426c792e5c33af8c227', 'Active', 'Root Admin', '2023-04-24 10:56:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL COMMENT 'CATEGORIES ID',
  `category_name` varchar(64) NOT NULL,
  `category_status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_status`, `created_at`, `updated_at`) VALUES
(1, 'Basketball', 'Active', NULL, NULL),
(2, 'Football', 'Active', NULL, NULL),
(3, 'Volleyball', 'Active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL COMMENT 'CONTACTS ID',
  `contacts_name` varchar(64) NOT NULL,
  `contacts_email` varchar(64) NOT NULL,
  `contacts_phone` varchar(32) NOT NULL,
  `contacts_overview` varchar(512) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL COMMENT 'CUSTOMERS ID',
  `customer_name` varchar(128) NOT NULL,
  `customer_email` varchar(64) NOT NULL,
  `customer_mobile` varchar(16) NOT NULL,
  `customer_address` varchar(256) NOT NULL,
  `customer_password` varchar(128) NOT NULL,
  `customer_status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_name`, `customer_email`, `customer_mobile`, `customer_address`, `customer_password`, `customer_status`, `created_at`, `updated_at`) VALUES
(1, 'Francis Lopez', 'fslntsho@gmail.com', '09568134274', 'Santol Street', 'dd94709528bb1c83d08f3088d4043f4742891f4f', 'Active', '2023-04-25 11:38:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `id` int(11) NOT NULL COMMENT 'DELIVERIES ID',
  `customer_id` int(11) NOT NULL,
  `shipping_charge` enum('50','150') NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` int(11) NOT NULL COMMENT 'DISCOUNT ID',
  `discount_code` varchar(256) NOT NULL,
  `price_discount_amount` double NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL COMMENT 'INVOICE ID',
  `invoice_id` varchar(128) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `shipping_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `transaction_amount` double NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` int(11) NOT NULL COMMENT 'NEWSLETTER ID',
  `newsletter_email` varchar(128) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL COMMENT 'ORDERS ID',
  `customer_id` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `sub_total` double NOT NULL,
  `tax` double NOT NULL,
  `delivery_charge` int(11) NOT NULL,
  `discount_amount` double NOT NULL,
  `grand_total` double NOT NULL,
  `payment_method` enum('SSL COMMERZ','PayPal','Cash On Delivery') NOT NULL DEFAULT 'Cash On Delivery',
  `transaction_id` varchar(256) NOT NULL,
  `transaction_status` enum('Paid','Unpaid') NOT NULL DEFAULT 'Paid',
  `order_item_status` enum('Pending','Processing','Completed','Cancelled') NOT NULL DEFAULT 'Pending',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL COMMENT 'ORDER ITEMS ID',
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_price` double NOT NULL,
  `prod_quantity` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL COMMENT 'PAGES ID',
  `page_title` text NOT NULL,
  `page_content` text NOT NULL,
  `page_status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL COMMENT 'PRODUCTS ID',
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `product_name` varchar(128) NOT NULL,
  `product_summary` text NOT NULL,
  `product_details` text NOT NULL,
  `product_master_image` text NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_price` double NOT NULL,
  `product_discount_price` double NOT NULL,
  `discount_start` datetime NOT NULL,
  `discount_ends` datetime NOT NULL,
  `product_status` enum('In Stock','Out of Stock') NOT NULL DEFAULT 'In Stock',
  `product_featured` enum('YES','NO') NOT NULL DEFAULT 'NO',
  `product_tags` varchar(512) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `subcategory_id`, `product_name`, `product_summary`, `product_details`, `product_master_image`, `product_quantity`, `product_price`, `product_discount_price`, `discount_start`, `discount_ends`, `product_status`, `product_featured`, `product_tags`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Gold State 30', '																																				Lorem Ipsum																																', '																											XL																								', 'PRODUCT_20230425123850_gt.png', 100, 199, 0, '2023-04-25 07:34:20', '2023-04-25 07:34:20', 'In Stock', 'YES', 'basketball', NULL, NULL),
(2, 1, 1, 'Team 25', '									Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,								', '									XL								', 'PRODUCT_20230425115837_PRODUCT_20230425092324_basketball-jersey-icon-on-transp.png', 100, 199, 15, '2023-04-25 07:55:21', '2023-04-25 07:55:21', 'In Stock', 'YES', '', NULL, NULL),
(3, 1, 1, 'Young Ma 3', '									Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,								', '									XL								', 'PRODUCT_20230425120044_BBP2.jpg', 100, 299, 20, '2023-04-25 07:59:29', '2023-04-25 07:59:29', 'In Stock', 'YES', '', NULL, NULL),
(4, 1, 1, 'Atlanta 17', '									Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s								', '									M								', 'PRODUCT_20230425120858_atlanta.png', 100, 299, 10, '2023-04-25 08:04:10', '2023-04-25 08:04:10', 'In Stock', 'YES', '', NULL, NULL),
(5, 1, 2, 'DRI FIT DNA 20CM Basketball', '									Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s								', '									RED XL								', 'PRODUCT_20230425121545_dri-fit-dna-20cm-basketball-shor.png', 100, 99, 5, '2023-04-25 08:13:30', '2023-04-25 08:13:30', 'In Stock', 'YES', '', NULL, NULL),
(6, 1, 2, 'DRI FIT DNA Basketball 2D', '									Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s								', '									White Size M								', 'PRODUCT_20230425121752_dri-fit-dna-basketball-shorts-2D.png', 100, 299, 8, '2023-04-25 08:16:00', '2023-04-25 08:16:00', 'In Stock', 'YES', '', NULL, NULL),
(7, 1, 2, 'Jorda DRI Fit Sport', '																		Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s																', '																		XL SIZE																', 'PRODUCT_20230425124209_hahaha.png', 599, 999, 15, '2023-04-25 08:39:46', '2023-04-25 08:39:46', 'In Stock', 'YES', '', NULL, NULL),
(8, 1, 2, 'Nike Circa', '									Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s								', '									XL White								', 'PRODUCT_20230425124335_circa-20cm-basketball-shorts-V7c.png', 100, 299, 7, '2023-04-25 08:42:20', '2023-04-25 08:42:20', 'In Stock', 'YES', '', NULL, NULL),
(9, 2, 3, 'Nike Tiempo Legend 9 Academy MG', '									Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s								', '									Multi-Ground Football Boot								', 'PRODUCT_20230425125416_1.png', 100, 2500, 1, '2023-04-25 08:52:48', '2023-04-25 08:52:48', 'In Stock', 'YES', '', NULL, NULL),
(10, 2, 3, 'Nike Zoom Mercurial Vapor 15 Academy IC', '									Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s								', '									Indoor Court Football Shoes								', 'PRODUCT_20230425125655_zoom-mercurial-vapor-15-academy.png', 100, 5999, 15, '2023-04-25 08:55:51', '2023-04-25 08:55:51', 'In Stock', 'YES', '', NULL, NULL),
(11, 2, 3, 'Nike Zoom Mercurial Dream Speed Superfly 9 Elite FG', '									Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s								', '									Firm-Ground Football Boot								', 'PRODUCT_20230425130027_save.png', 99, 5999, 1, '2023-04-25 08:57:28', '2023-04-25 08:57:28', 'In Stock', 'YES', '', NULL, NULL),
(12, 2, 3, 'Nike Phantom GT2 Academy IC', '									Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s								', '									ndoor Court Football Shoes								', 'PRODUCT_20230425130222_sddsd.png', 99, 4999, 12, '2023-04-25 09:00:56', '2023-04-25 09:00:56', 'In Stock', 'YES', '', NULL, NULL),
(13, 2, 4, 'Nike Dri-FIT Academy', '									Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s								', '									Men\'s Short-Sleeve Graphic Football Top								', 'PRODUCT_20230425130636_dri-fit-academy-short-sleeve-gra.png', 100, 999, 1, '2023-04-25 09:05:27', '2023-04-25 09:05:27', 'In Stock', 'NO', '', NULL, NULL),
(14, 2, 4, 'Paris Saint-Germain 2022/23 Match Fourth', '									Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s								', '									Men\'s Jordan Dri-FIT ADV Football Shirt								', 'PRODUCT_20230425131016_qotarm airways.png', 100, 599, 5, '2023-04-25 09:08:54', '2023-04-25 09:08:54', 'In Stock', 'YES', '', NULL, NULL),
(15, 2, 4, 'Nike Dri-FIT Academy', '									Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s								', '									Men\'s Short-Sleeve Football Top								', 'PRODUCT_20230425131231_dri-fit-academy-short-sleeve-foo.png', 99, 299, 1, '2023-04-25 09:11:44', '2023-04-25 09:11:44', 'In Stock', 'YES', '', NULL, NULL),
(16, 2, 4, 'F.C. Barcelona 2022/23 Stadium Third', '									Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s								', '									Men\'s Nike Dri-FIT Football Shirt								', 'PRODUCT_20230425131517_fc-barcelona-2022-23-stadium-thi.png', 100, 599, 1, '2023-04-25 09:14:23', '2023-04-25 09:14:23', 'In Stock', 'YES', '', NULL, NULL),
(17, 3, 5, 'Fuze Women\'s Sublimated Pursuit Long Sleeve Jersey - Speed', '																		Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s																', '																		Long Sleeve Jersey - Speed																', 'PRODUCT_20230425134120_01_speed_red-card-mainfront_01 (1).png', 100, 599, 15, '2023-04-25 09:38:57', '2023-04-25 09:38:57', 'In Stock', 'YES', '', NULL, NULL),
(18, 3, 5, 'Pursuit Long Sleeve Jersey - Patriot', '									Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s								', '									CustomFuze Women\'s Sublimated Pursuit								', 'PRODUCT_20230425134440_06_red_patriot_02.png', 100, 299, 10, '2023-04-25 09:43:37', '2023-04-25 09:43:37', 'In Stock', 'YES', '', NULL, NULL),
(19, 3, 5, 'Long Sleeve Jersey - Rise', '									Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s								', '									CustomFuze Women\'s Sublimated Pursuit								', 'PRODUCT_20230425134559_03_rise_ls_orange_01.png', 99, 199, 15, '2023-04-25 09:45:11', '2023-04-25 09:45:11', 'In Stock', 'YES', '', NULL, NULL),
(20, 3, 5, 'Long Sleeve Jersey - Varsity', '									Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s								', '									CustomFuze Women\'s Sublimated Pursuit 								', 'PRODUCT_20230425134709_09_varsity_navy_01.png', 100, 299, 20, '2023-04-25 09:46:15', '2023-04-25 09:46:15', 'In Stock', 'YES', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` int(11) NOT NULL COMMENT 'SHIPPING ID',
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `shipcstmr_name` varchar(128) NOT NULL,
  `shipcstmr_mobile` varchar(32) NOT NULL,
  `shipcstmr_profession` varchar(256) DEFAULT NULL,
  `shipcstmr_streetadd` varchar(256) NOT NULL,
  `shipcstmr_city` varchar(64) NOT NULL,
  `shipcstmr_zip` varchar(6) NOT NULL,
  `shipcstmr_country` varchar(64) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shopcarts`
--

CREATE TABLE `shopcarts` (
  `id` int(11) NOT NULL COMMENT 'SHOPCARTS ID',
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE `slides` (
  `id` int(11) NOT NULL COMMENT 'SLIDER ID',
  `slider_title` varchar(128) NOT NULL,
  `slider_file` text NOT NULL,
  `slider_status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `slider_sequence` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`id`, `slider_title`, `slider_file`, `slider_status`, `slider_sequence`, `created_at`, `updated_at`) VALUES
(1, 'ㅤ', 'SLIDER_20230425114750_1..png', 'Active', 1, NULL, NULL),
(2, 'ㅤ', 'SLIDER_20230425114758_new.png', 'Active', 1, NULL, NULL),
(3, 'ㅤ', 'SLIDER_20230425114805_5.png', 'Active', 1, NULL, NULL),
(4, 'ㅤ', 'SLIDER_20230425115157_5.png', 'Active', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(11) NOT NULL COMMENT 'SUBCATEGORIES ID',
  `category_id` int(11) NOT NULL,
  `subcategory_name` varchar(128) NOT NULL,
  `subcategory_status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `subcategory_banner` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `category_id`, `subcategory_name`, `subcategory_status`, `subcategory_banner`, `created_at`, `updated_at`) VALUES
(1, 1, 'Jersey', 'Active', 'SUBCATBANNER_20230425112957_jersey banner.png', '2023-04-25 11:29:57', NULL),
(2, 1, 'Shorts', 'Active', 'SUBCATBANNER_20230425121315_shorts.png', '2023-04-25 12:13:15', NULL),
(3, 2, 'Shoes', 'Active', 'SUBCATBANNER_20230425125238_shoes.png', '2023-04-25 12:52:38', NULL),
(4, 2, 'FootBall Shirts', 'Active', 'SUBCATBANNER_20230425130518_football shirts.png', '2023-04-25 13:05:18', NULL),
(5, 3, 'Sleeve Jersey', 'Active', 'SUBCATBANNER__20230425133738_sleeve jersey.png', '2023-04-25 13:35:58', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `shipping_id` (`shipping_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `subcategory_id` (`subcategory_id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `shopcarts`
--
ALTER TABLE `shopcarts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ADMINS ID', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'CATEGORIES ID', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'CONTACTS ID';

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'CUSTOMERS ID', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'DELIVERIES ID', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'DISCOUNT ID';

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'INVOICE ID', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'NEWSLETTER ID';

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ORDERS ID', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ORDER ITEMS ID', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PAGES ID';

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PRODUCTS ID', AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'SHIPPING ID', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shopcarts`
--
ALTER TABLE `shopcarts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'SHOPCARTS ID', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'SLIDER ID', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'SUBCATEGORIES ID', AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD CONSTRAINT `deliveries_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `deliveries_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `shippings`
--
ALTER TABLE `shippings`
  ADD CONSTRAINT `shippings_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `shippings_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `shopcarts`
--
ALTER TABLE `shopcarts`
  ADD CONSTRAINT `shopcarts_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `shopcarts_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
