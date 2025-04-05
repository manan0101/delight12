-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2025 at 07:15 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurant`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(3) NOT NULL,
  `itemName` varchar(35) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `image` varchar(35) NOT NULL,
  `quantity` int(3) NOT NULL,
  `catName` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `total_price` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `itemName`, `price`, `image`, `quantity`, `catName`, `email`, `total_price`) VALUES
(1, 'French Fries', 760.00, 'fries.jpg', 1, 'Appetizer', 'asna@gmail.com', '760'),
(3, 'Strawberry Mocktail', 550.00, 'strawberry-drink.png', 2, 'Beverage', 'zidnan@gmail.com', '1100');

-- --------------------------------------------------------

--
-- Table structure for table `menucategory`
--

CREATE TABLE `menucategory` (
  `catId` int(3) NOT NULL,
  `catName` varchar(35) NOT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menucategory`
--

INSERT INTO `menucategory` (`catId`, `catName`, `dateCreated`) VALUES
(1, 'Appetizer & Snacks', '2025-02-26 12:31:55'),
(2, 'Burger', '2025-02-26 12:31:55'),
(3, 'Pizza', '2025-02-26 12:33:18'),
(4, 'Beverage', '2025-02-26 12:33:18'),
(15, 'Sandwich', '2025-03-07 07:28:24'),
(16, 'Dessert', '2025-03-07 09:17:07'),
(17, 'Soup', '2025-03-30 14:28:43');

-- --------------------------------------------------------

--
-- Table structure for table `menuitem`
--

CREATE TABLE `menuitem` (
  `itemId` int(3) NOT NULL,
  `itemName` varchar(35) NOT NULL,
  `catName` varchar(35) NOT NULL,
  `price` varchar(6) NOT NULL,
  `status` enum('Available','Unavailable','','') NOT NULL DEFAULT 'Available',
  `description` varchar(255) NOT NULL,
  `image` varchar(80) NOT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedDate` datetime NOT NULL,
  `is_popular` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menuitem`
--

INSERT INTO `menuitem` (`itemId`, `itemName`, `catName`, `price`, `status`, `description`, `image`, `dateCreated`, `updatedDate`, `is_popular`) VALUES
(3, 'French Fries', 'Appetizer & Snacks', '120', 'Available', ' Crispy, golden-brown fries seasoned to perfection, served with your choice of dipping sauces.', 'fries.jpg', '2025-02-26 09:09:35', '2025-02-26 14:39:35', 0),
(5, 'Veggie Supreme Pizza', 'Pizza', '350', 'Available', 'Our Veggie Supreme Pizza, is loaded with a colorful array of seasonal vegetables, rich tomato sauce, and a generous layer of gooey cheese.', 'veggie-pizza.jpg', '2025-02-26 09:10:36', '2025-02-26 14:40:36', 1),
(6, 'Mexican Pizza', 'Pizza', '400', 'Available', 'A fusion pizza topped with ingredients like jalapeños, tomatoes, onions, avocado, and cheddar cheese, often garnished with cilantro.', 'prawn-piza.jpg', '2025-02-26 09:12:03', '2025-02-26 14:42:03', 1),
(7, 'Cheese Pizza', 'Pizza', '300', 'Available', 'Indulge in the classic simplicity of our Cheese Pizza, topped with a generous layer of gooey mozzarella and a perfectly seasoned tomato sauce.', 'cheese-pizza.jpg', '2025-02-26 09:13:09', '2025-02-26 14:43:09', 0),
(8, 'BBQ Pizza', 'Pizza', '450', 'Unavailable', 'Savor the smoky goodness of our BBQ Pizza, featuring tender smothered in barbecue sauce.', 'bbq-pizza.jpg', '2025-02-26 09:13:45', '2025-02-26 14:43:45', 0),
(13, 'Strawberry Mocktail', 'Beverage', '200', 'Available', 'Refreshingly sweet and tangy, this Strawberry Mocktail blends ripe strawberries with a splash of citrus, creating a vibrant.', 'strawberry-drink.png', '2025-02-03 14:18:11', '2025-02-03 16:09:51', 0),
(14, 'Orange Sizzler', 'Beverage', '180', 'Available', 'Enjoy the zing of our Orange Sizzler, a mix of fresh orange juice with a fizzy twist, perfect for adding a burst of to your day.', 'orange-drink.png', '2025-02-03 14:24:49', '2025-02-03 16:24:05', 1),
(15, 'Dragon Fruit Mojito', 'Beverage', '270', 'Available', 'Experience a tropical twist with our Dragon Fruit Mojito, featuring exotic dragon fruit, mint, and lime, all muddled together.', 'Dragon-fruit-drink.png', '2025-02-03 14:25:57', '2025-02-03 16:24:54', 1),
(16, 'Watermelon Smoothie', 'Beverage', '180', 'Available', 'A blend of juicy watermelon and a hint of lime, delivering a hydrating and deliciously fruity escape from the heat.', 'watermelon-drink.png', '2025-02-03 14:26:56', '2025-02-03 16:26:00', 1),
(33, 'Garlic Bread', 'Appetizer & Snacks', '150', 'Available', 'Golden, toasted bread topped with buttery garlic and herbs. Crispy and savory, perfect for starting your meal.', 'garlic-bread.avif', '2025-02-08 16:37:43', '2025-02-08 22:07:43', 1),
(35, 'Samosa', 'Appetizer & Snacks', '70', 'Available', 'Crispy, golden-brown samosas filled with a savory blend of spiced potatoes and peas.', 'samosa.avif', '2025-02-08 16:45:44', '2025-02-08 22:15:44', 1),
(40, 'Panipuri', 'Appetizer & Snacks', '50', 'Available', 'Crispy hollow puris filled with spicy, tangy water, mashed potatoes, and chickpeas, offering a burst of flavors in every bite.', 'panipuri2.jpg', '2025-02-28 16:32:03', '2025-02-28 22:02:03', 0),
(41, 'Sevpuri', 'Appetizer & Snacks', '70', 'Available', 'A crunchy and tangy delight made with crispy puris topped with potatoes, chutneys, sev, and fresh coriander.', 'sev puri2.jpg', '2025-02-28 16:32:44', '2025-02-28 22:02:44', 0),
(42, 'Dahi-Puri', 'Appetizer & Snacks', '120', 'Available', 'Crispy puris filled with curd, tangy chutneys, potatoes, and sev, delivering a perfect balance of sweet and spicy flavors.', 'dahi puri2.jpg', '2025-02-28 16:33:33', '2025-02-28 22:03:33', 1),
(43, 'Ragda pattice', 'Appetizer & Snacks', '90', 'Available', 'A mouthwatering combination of soft potato patties topped with spicy white peas curry, chutneys, onions, and sev.', 'Ragda Pattice2.jpg', '2025-02-28 16:34:31', '2025-02-28 22:04:31', 0),
(44, 'Bhelpuri', 'Appetizer & Snacks', '70', 'Available', 'A light and flavorful mix of puffed rice, tangy chutneys, sev, and crunchy veggies, making for a perfect street-style snack.', 'bhel puri2.jpg', '2025-02-28 16:35:43', '2025-02-28 22:05:43', 0),
(45, 'Classic Veggie Burger', 'Burger', '210', 'Available', 'A hearty patty made from a mix of vegetables, grains, and legumes, offering a wholesome bite.', 'Classic veggie burger.jpg', '2025-03-06 03:52:22', '2025-03-06 09:22:22', 0),
(46, 'Cheesy Burger', 'Burger', '250', 'Available', ' classic burger featuring a juicy patty topped with a slice of melted cheese, usually cheddar, along with lettuce, tomato, pickles, and condiments like ketchup and mayonnaise, all served in a soft bun.', 'cheese burger.jpg', '2025-03-06 04:04:11', '2025-03-06 09:34:11', 1),
(47, 'Portobello Mushroom Burge', 'Burger', '300', 'Available', 'A large, marinated Portobello mushroom cap serves as the patty, delivering a juicy and umami-rich experience.', 'Pb Mushroom Burger.jpg', '2025-03-06 04:08:16', '2025-03-06 09:38:16', 1),
(48, 'Grain-Based Burger', 'Burger', '280', 'Available', 'Utilizing grains like quinoa or bulgur, these patties offer a unique texture and are often combined with vegetables and legumes.', 'grain based burger.jpg', '2025-03-06 04:09:45', '2025-03-06 09:39:45', 0),
(50, 'Veggie & Cream Cheese San', 'Sandwich', '200', 'Available', 'A delightful sandwich filled with fresh crunchy vegetables and smooth, seasoned cream cheese, served between soft or toasted bread for a perfect balance of flavor and texture.', 'veg cream chesse sandwich.jpg', '2025-03-07 07:34:47', '2025-03-07 13:04:47', 1),
(51, 'Hummus & Veggie Sandwich', 'Sandwich', '240', 'Available', 'A tortilla spread with hummus and filled with assorted fresh vegetables like carrots, bell peppers, spinach, and red onions.', 'Hummus and veggie Sandwich.jpg', '2025-03-07 07:36:17', '2025-03-07 13:06:17', 0),
(52, 'Falafel Pita Sandwich', 'Sandwich', '250', 'Available', 'Crispy falafel balls stuffed into pita bread with lettuce, tomatoes, cucumbers, and a generous serving of tahini or yogurt sauce.', 'FALAFEL PITA sandwich.jpg', '2025-03-07 07:37:07', '2025-03-07 13:07:07', 0),
(53, 'Cheesy Supreme Sandwich', 'Sandwich', '220', 'Available', 'A rich and indulgent sandwich loaded with a blend of melted cheeses and flavorful seasoning, grilled to perfection for a crispy, gooey delight.', 'Cheesy Sandwich.jpg', '2025-03-07 07:39:28', '2025-03-07 13:09:28', 1),
(54, 'Sizzling Choco Brownie wi', 'Dessert', '300', 'Available', 'A warm, fudgy brownie topped with creamy vanilla ice cream and drizzled with rich hot chocolate sauce, served sizzling for a perfect blend of hot and cold delight.', 'Sizzling Brownie with Ice Cream.jpg', '2025-03-07 09:19:08', '2025-03-07 14:49:08', 1),
(55, 'Red Velvet Cupcake', 'Dessert', '150', 'Available', 'A soft and moist red velvet cupcake topped with smooth cream cheese frosting and cherry, offering a perfect balance of sweetness and richness.', 'red  velvet cup cake.jpg', '2025-03-07 09:22:13', '2025-03-07 14:52:13', 1),
(56, 'Strawberry Donut ', 'Dessert', '140', 'Available', 'A fluffy, glazed donut infused with strawberry flavor, topped with a luscious strawberry glaze and sprinkles for a delightful treat.', 'strawberry donald.jpg', '2025-03-07 09:22:58', '2025-03-07 14:52:58', 0),
(57, 'Chocolate Cheesecake', 'Dessert', '200', 'Available', 'A rich and creamy chocolate-infused cheesecake with a buttery biscuit base, offering a decadent and indulgent chocolate experience.', 'choco cheese cake.jpg', '2025-03-07 09:24:04', '2025-03-07 14:54:04', 0);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(3) NOT NULL,
  `email` varchar(255) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `address` varchar(200) NOT NULL,
  `pmode` enum('Cash','Card','Takeaway','') NOT NULL DEFAULT 'Cash',
  `payment_status` enum('Pending','Successful','Rejected','') NOT NULL DEFAULT 'Pending',
  `sub_total` decimal(8,2) NOT NULL,
  `grand_total` decimal(8,2) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `order_status` enum('Pending','Completed','Cancelled','Processing','On the way') NOT NULL DEFAULT 'Pending',
  `cancel_reason` varchar(150) DEFAULT NULL,
  `note` varchar(150) NOT NULL,
  `status` enum('Approved','Pending','On Process','Completed','Cancelled') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `email`, `firstName`, `lastName`, `phone`, `address`, `pmode`, `payment_status`, `sub_total`, `grand_total`, `order_date`, `order_status`, `cancel_reason`, `note`, `status`) VALUES
(60, 'mananmaluka01@gmail.com', 'Mb', 'df', '90909090', 'home', 'Cash', 'Successful', 800.00, 930.00, '2025-02-22 14:35:51', 'Completed', '', 'no', 'Approved'),
(61, 'mananmaluka01@gmail.com', 'Mb', 'df', '90909090', 'home', 'Takeaway', 'Successful', 350.00, 350.00, '2025-02-25 15:45:08', 'Completed', '', 'no', 'Approved'),
(62, 'gohilnildeepsinh1262@gmail.com', 'gohil', 'nildeepsin', '7575001262', 'mara ghare', 'Takeaway', 'Successful', 1200.00, 1200.00, '2025-03-09 16:48:57', 'Pending', '', 'no pizza base\r\n\r\n\r\n', 'Approved'),
(63, 'mananmaluka01@gmail.com', 'Manan ', 'Maluka', '9090909090', 'Sardar Nagar, Bhavnagar.', 'Cash', 'Successful', 690.00, 820.00, '2025-03-25 07:12:10', 'On the way', '', 'Please Deliver my order as soon as possible.', 'Approved'),
(65, 'pratik@gmail.com', 'Pratik', 'Gohel', '9876543322', 'swastik arcade, bhavnagar', 'Cash', 'Successful', 750.00, 880.00, '2025-03-27 15:49:39', 'Completed', '', 'Add extra cheese in burger', 'Approved'),
(68, 'harsh@gmail.com', 'Harsh', 'Patel', '7575001262', 'waghawadi road', 'Cash', 'Successful', 2310.00, 2440.00, '2025-04-01 08:40:18', 'Completed', '', 'add extra chatni', 'Approved'),
(69, 'harsh@gmail.com', 'Harsh', 'Patel', '8877669955', 'waghawadi', 'Takeaway', 'Successful', 150.00, 150.00, '2025-04-01 08:40:53', 'On the way', '', '', 'Approved'),
(70, 'mananmaluka01@gmail.com', 'Manan ', 'card', '9090909090', 'home', 'Card', 'Pending', 120.00, 250.00, '2025-04-02 15:47:02', 'Pending', NULL, 'test', 'Approved'),
(71, 'mananmaluka01@gmail.com', 'Mb', 'Admin', '9090909090', 'home', 'Cash', 'Pending', 70.00, 200.00, '2025-04-02 15:50:54', 'Pending', NULL, '', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `itemName` varchar(35) NOT NULL,
  `image` varchar(80) NOT NULL,
  `quantity` int(8) NOT NULL,
  `price` decimal(8,0) NOT NULL,
  `total_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `itemName`, `image`, `quantity`, `price`, `total_price`) VALUES
(122, 54, 'Garlic Bread', 'garlic-bread.avif', 1, 350, 350.00),
(123, 54, 'French Fries', 'fries.jpg', 1, 760, 760.00),
(124, 54, 'Cheese Pizza', 'cheese-pizza.jpg', 1, 800, 800.00),
(130, 57, 'French Fries', 'fries.jpg', 2, 760, 1520.00),
(131, 57, 'Firebird Burger', 'firebird-burger.jpeg', 2, 2100, 4200.00),
(134, 59, 'Veggie Supreme Pizza', 'veggie-pizza.jpg', 1, 800, 800.00),
(135, 59, 'Samosa', 'samosa.avif', 1, 120, 120.00),
(136, 59, 'Dragon Fruit Mojito', 'Dragon-fruit-drink.png', 1, 760, 760.00),
(137, 60, 'Veggie Supreme Pizza', 'veggie-pizza.jpg', 1, 800, 800.00),
(138, 61, 'Garlic Bread', 'garlic-bread.avif', 1, 350, 350.00),
(139, 62, 'Mexican Pizza', 'prawn-piza.jpg', 1, 1200, 1200.00),
(140, 63, 'Dahi-Puri', 'dahi puri2.jpg', 1, 120, 120.00),
(141, 63, 'Dragon Fruit Mojito', 'Dragon-fruit-drink.png', 1, 270, 270.00),
(142, 63, 'Sizzling Choco Brownie with Ice Cre', 'Sizzling Brownie with Ice Cream.jpg', 1, 300, 300.00),
(143, 64, 'Cheese Pizza', 'cheese-pizza.jpg', 4, 300, 1200.00),
(144, 64, 'Garlic Bread', 'garlic-bread.avif', 9, 150, 1350.00),
(145, 64, 'Cheesy Burger', 'cheese burger.jpg', 1, 250, 250.00),
(146, 65, 'Veggie & Cream Cheese Sandwich', 'veg cream chesse sandwich.jpg', 1, 200, 200.00),
(147, 65, 'Samosa', 'samosa.avif', 1, 70, 70.00),
(148, 65, 'Ragda pattice', 'Ragda Pattice2.jpg', 1, 90, 90.00),
(149, 65, 'Cheesy Burger', 'cheese burger.jpg', 1, 250, 250.00),
(150, 65, 'Strawberry Donut ', 'strawberry donald.jpg', 1, 140, 140.00),
(151, 66, 'Soup', 'Veg Manchow Soup - Chef Kunal Kapur - Google Chrom', 26, 100, 2600.00),
(152, 67, 'Mexican Pizza', 'prawn-piza.jpg', 1, 400, 400.00),
(153, 68, 'Samosa', 'samosa.avif', 2, 70, 140.00),
(154, 68, 'Mexican Pizza', 'prawn-piza.jpg', 3, 400, 1200.00),
(155, 68, 'Watermelon Smoothie', 'watermelon-drink.png', 4, 180, 720.00),
(156, 68, 'Falafel Pita Sandwich', 'FALAFEL PITA sandwich.jpg', 1, 250, 250.00),
(157, 69, 'Garlic Bread', 'garlic-bread.avif', 1, 150, 150.00),
(158, 70, 'French Fries', 'fries.jpg', 1, 120, 120.00),
(159, 71, 'Samosa', 'samosa.avif', 1, 70, 70.00);

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `email` varchar(40) NOT NULL,
  `name` varchar(20) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `noOfGuests` int(4) NOT NULL,
  `reservedTime` time NOT NULL,
  `reservedDate` date NOT NULL,
  `reservedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('Pending','Approved','On Process','Completed','Cancelled') NOT NULL DEFAULT 'Pending',
  `reservation_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`email`, `name`, `contact`, `noOfGuests`, `reservedTime`, `reservedDate`, `reservedAt`, `status`, `reservation_id`) VALUES
('mananmaluka01@gmail.com', 'Manan', '90909090', 1, '00:00:12', '2025-03-26', '2025-03-26 18:12:35', 'Completed', 21),
('admin@gmail.com', 'a', '1234567890', 21, '00:00:14', '2025-03-12', '2025-03-30 17:50:58', 'Cancelled', 22),
('harsh@gmail.com', 'Harsh', '8877669955', 3, '00:00:15', '2025-04-01', '2025-04-01 08:42:20', 'On Process', 27);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(3) NOT NULL,
  `email` varchar(255) NOT NULL,
  `order_id` int(3) DEFAULT NULL,
  `rating` int(1) NOT NULL,
  `review_text` text DEFAULT 'None',
  `review_date` date DEFAULT current_timestamp(),
  `status` enum('approved','pending','rejected') DEFAULT 'pending',
  `response` text DEFAULT 'None'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review_id`, `email`, `order_id`, `rating`, `review_text`, `review_date`, `status`, `response`) VALUES
(32, 'mananmaluka01@gmail.com', 60, 4, 'superfast delivery & food was very  tasty', '2025-02-25', 'approved', 'Thank you for your feedback.'),
(33, 'mananmaluka01@gmail.com', 61, 3, 'amazing', '2025-03-24', 'approved', NULL),
(34, 'abc@def.com', 66, 1, 'nice', '2025-03-30', 'approved', 'legit review'),
(35, 'abc@def.com', 67, 1, 'a', '2025-03-30', 'pending', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(3) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact` varchar(10) DEFAULT NULL,
  `role` enum('superadmin','admin','delivery boy','waiter') NOT NULL,
  `password` varchar(15) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `profile_image` varchar(50) NOT NULL DEFAULT 'default.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `firstName`, `lastName`, `email`, `contact`, `role`, `password`, `createdAt`, `updatedAt`, `profile_image`) VALUES
(5, 'Demo', '', 'admin@gmail.com', '0000000000', 'admin', 'admin2025', '2025-02-04 06:51:20', '2025-04-01 08:05:00', '1920x1080.jpg'),
(7, 'Manan ', '', 'mananmaluka01@gmail.com', '90909090', 'superadmin', '1234567', '2025-02-25 15:58:46', '2025-03-06 10:19:53', 'default.jpg'),
(8, 'd', '', 'dboy@gmail.com', '90909090', 'admin', '123456', '2025-03-07 09:06:05', '2025-03-07 09:06:43', 'default.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `email` varchar(255) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `profile_image` varchar(40) NOT NULL DEFAULT 'default.jpg'
) ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`email`, `firstName`, `lastName`, `contact`, `password`, `dateCreated`, `profile_image`) VALUES
('gohilnildeepsinh1262@gmail.com', 'gohil ', 'nildeepsinh', '7575001262', 'gohil1262', '2025-03-09 16:44:23', 'default.jpg'),
('harsh@gmail.com', 'Harsh', 'Patel', '5444222121', '231', '2025-03-26 17:37:46', 'default.jpg'),
('mananmaluka01@gmail.com', 'Manan', 'Maluka', '9090909090', '123456', '2025-02-22 14:34:14', 'default.jpg'),
('omsathiya@gmail.com', 'Om', 'Sathiya', '9812125212', '123456', '2025-03-26 17:23:59', 'default.jpg'),
('pratik@gmail.com', 'Pratik', 'Gohel', '9825143652', '12', '2025-03-27 15:47:00', 'default.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `menucategory`
--
ALTER TABLE `menucategory`
  ADD PRIMARY KEY (`catId`),
  ADD UNIQUE KEY `catId` (`catId`);

--
-- Indexes for table `menuitem`
--
ALTER TABLE `menuitem`
  ADD PRIMARY KEY (`itemId`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `email` (`email`),
  ADD KEY `email_2` (`email`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `itemId` (`itemName`) USING BTREE;

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`reservation_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `email` (`email`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `menucategory`
--
ALTER TABLE `menucategory`
  MODIFY `catId` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `menuitem`
--
ALTER TABLE `menuitem`
  MODIFY `itemId` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `reservation_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`email`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`email`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
