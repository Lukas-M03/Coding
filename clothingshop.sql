-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2024 at 12:00 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `clothingshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `administration`
--

CREATE TABLE `administration` (
  `AdminID` int(11) NOT NULL,
  `Forename` varchar(20) NOT NULL,
  `Surname` varchar(30) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Telephone` int(11) NOT NULL,
  `Password` varchar(40) DEFAULT NULL,
  `Username` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL,
  `FirstName` varchar(15) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `Email` varchar(35) NOT NULL,
  `Address` varchar(30) NOT NULL,
  `TelephoneNO` varchar(14) NOT NULL,
  `Password` varchar(40) DEFAULT NULL,
  `Username` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `Address`, `TelephoneNO`, `Password`, `Username`) VALUES
(101, 'John', 'Smith', 'john.smith@gmail.com', '123 Main St', '+442012345678', 'password1', 'johnsmith'),
(102, 'Emily', 'Johnson', 'emily.johnson@yahoo.com', '456 Elm St', '+442023456789', 'password2', 'emilyjohnson'),
(103, 'Michael', 'Williams', 'michael.williams@outlook.com', '789 Oak St', '+442034567890', 'password3', 'michaelwilliams'),
(104, 'Sarah', 'Jones', 'sarah.jones@gmail.com', '321 Maple Ave', '+442045678901', 'password4', 'sarahjones'),
(105, 'David', 'Brown', 'david.brown@yahoo.com', '654 Pine Rd', '+442056789012', 'password5', 'davidbrown'),
(106, 'Jennifer', 'Davis', 'jennifer.davis@outlook.com', '987 Cedar Ln', '+442067890123', 'password6', 'jenniferdavis'),
(107, 'James', 'Miller', 'james.miller@gmail.com', '159 Birch St', '+442078901234', 'password7', 'jamesmiller'),
(108, 'Jessica', 'Wilson', 'jessica.wilson@yahoo.com', '753 Oak St', '+442089012345', 'password8', 'jessicawilson'),
(109, 'Christopher', 'Moore', 'christopher.moore@gmail.com', '852 Maple Ave', '+442090123456', 'password9', 'christophermoore'),
(110, 'Amanda', 'Taylor', 'amanda.taylor@outlook.com', '456 Pine Rd', '+442001234567', 'password10', 'amandataylor');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `CustomerID` int(11) NOT NULL,
  `AdminID` int(11) NOT NULL,
  `Username` varchar(40) DEFAULT NULL,
  `Password` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orderproduct`
--

CREATE TABLE `orderproduct` (
  `OrderID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `DateOfPurchase` date NOT NULL,
  `OrderTotal` decimal(10,2) NOT NULL,
  `ShippingInfo` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(25) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `Colour` varchar(10) NOT NULL,
  `ProductStock` int(11) NOT NULL,
  `Material` varchar(15) NOT NULL,
  `Price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProductID`, `ProductName`, `Description`, `Colour`, `ProductStock`, `Material`, `Price`) VALUES
(1, 'T-Shirt', 'Comfortable cotton t-shirt', 'Red', 100, 'Cotton', 19.99),
(2, 'Jeans', 'Classic blue denim jeans', 'Blue', 80, 'Denim', 49.99),
(3, 'Hoodie', 'Warm and soft hoodie', 'Black', 80, 'Fleece', 39.99),
(4, 'Jacket', 'Rugged leather jacket', 'Mocha', 50, 'Leather', 199.99),
(5, 'Socks', 'Warm wool socks', 'Grey', 80, 'Wool', 9.99),
(6, 'Hat', 'Stylish fedora hat with a wide brim', 'Black', 50, 'Felt', 29.99),
(7, 'Scarf', 'Soft and warm knitted scarf', 'Red+White', 50, 'Wool', 14.99),
(8, 'Gloves', 'Leather gloves with touchscreen compatibility', 'Brown', 50, 'Leather', 24.99),
(9, 'Belt', 'Classic leather belt', 'Black', 50, 'Leather', 19.99),
(10, 'Sweater', 'Cozy cable knit sweater', 'Navy Blue', 80, 'Wool', 49.99);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `ReviewID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Rating` int(11) NOT NULL,
  `Comment` text DEFAULT NULL,
  `ReviewDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`ReviewID`, `CustomerID`, `ProductID`, `Rating`, `Comment`, `ReviewDate`) VALUES
(10, 101, 1, 4, 'Comfortable and well-made t-shirt. Good quality cotton.', '2024-05-01 11:18:50'),
(20, 102, 2, 5, 'Perfect fit and high-quality denim. A classic pair of jeans.', '2024-05-01 11:18:50'),
(30, 103, 3, 4, 'Warm and cozy hoodie, but the material feels a bit thin.', '2024-05-01 11:18:50'),
(40, 104, 4, 5, 'Stylish and durable leather jacket. Great for casual or formal wear.', '2024-05-01 11:18:50'),
(50, 105, 5, 3, 'The socks are warm, but the quality does not seem very durable.', '2024-05-01 11:18:50'),
(60, 106, 6, 4, 'Fashionable hat with a nice wide brim. Perfect for sunny days.', '2024-05-01 11:18:50'),
(70, 107, 7, 5, 'Soft and warm scarf. Ideal for cold weather. Love the colors.', '2024-05-01 11:18:50'),
(80, 108, 8, 4, 'Functional leather gloves with good touchscreen compatibility. A bit stiff.', '2024-05-01 11:18:50'),
(90, 109, 9, 3, 'Average quality belt. Not very impressive for the price.', '2024-05-01 11:18:50'),
(100, 110, 10, 5, 'Cozy and well-made sweater. Perfect for winter. Highly recommended.', '2024-05-01 11:18:50');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `SalesID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(15) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shoppingcart`
--

CREATE TABLE `shoppingcart` (
  `CustomerID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administration`
--
ALTER TABLE `administration`
  ADD PRIMARY KEY (`AdminID`),
  ADD UNIQUE KEY `Password_2` (`Password`,`Username`),
  ADD KEY `Password` (`Password`,`Username`),
  ADD KEY `Username` (`Username`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`),
  ADD UNIQUE KEY `Password_2` (`Password`,`Username`),
  ADD KEY `Password` (`Password`,`Username`),
  ADD KEY `Username` (`Username`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`CustomerID`,`AdminID`),
  ADD UNIQUE KEY `AdminID` (`AdminID`),
  ADD UNIQUE KEY `Username_2` (`Username`,`Password`),
  ADD KEY `Username` (`Username`,`Password`);

--
-- Indexes for table `orderproduct`
--
ALTER TABLE `orderproduct`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `fk_orderproduct_customer` (`CustomerID`),
  ADD KEY `fk_orderproduct_product` (`ProductID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductID`),
  ADD UNIQUE KEY `UQ_ProductName` (`ProductName`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`ReviewID`),
  ADD KEY `fk_reviews_customer` (`CustomerID`),
  ADD KEY `fk_reviews_product` (`ProductID`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`SalesID`),
  ADD UNIQUE KEY `UQ_ProductName` (`ProductName`),
  ADD KEY `fk_sales_product` (`ProductID`);

--
-- Indexes for table `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD PRIMARY KEY (`CustomerID`,`ProductID`),
  ADD KEY `fk_shoppingcart_product` (`ProductID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `ReviewID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `administration`
--
ALTER TABLE `administration`
  ADD CONSTRAINT `administration_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `login` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `login_ibfk_3` FOREIGN KEY (`AdminID`) REFERENCES `administration` (`AdminID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orderproduct`
--
ALTER TABLE `orderproduct`
  ADD CONSTRAINT `fk_orderproduct_customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_orderproduct_product` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `fk_reviews_customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_reviews_product` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `fk_sales_product` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`ProductName`) REFERENCES `product` (`ProductName`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD CONSTRAINT `fk_shoppingcart_customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_shoppingcart_product` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;
