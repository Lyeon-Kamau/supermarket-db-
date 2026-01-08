-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2026 at 06:36 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `supermarket-db-`
--
CREATE DATABASE IF NOT EXISTS `supermarket-db-` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `supermarket-db-`;

--
-- Dumping data for table `attendancelog`
--

INSERT INTO `attendancelog` (`AttendanceID`, `EmployeeID`, `CheckInTime`, `CheckOutTime`, `WorkDate`, `Status`) VALUES
(1, 2, '2025-01-05 08:00:00', '2025-01-05 17:00:00', '2025-01-05', 'Present'),
(2, 3, '2025-01-05 08:15:00', '2025-01-05 17:05:00', '2025-01-05', 'Present'),
(3, 4, '2025-01-05 08:00:00', '2025-01-05 17:00:00', '2025-01-05', 'Present'),
(4, 5, '2025-01-05 08:10:00', '2025-01-05 17:00:00', '2025-01-05', 'Present'),
(5, 6, '2025-01-05 08:00:00', '2025-01-05 17:00:00', '2025-01-05', 'Present'),
(6, 7, '2025-01-05 08:00:00', '2025-01-05 17:00:00', '2025-01-05', 'Present'),
(7, 2, '2025-01-06 08:00:00', '2025-01-06 17:00:00', '2025-01-06', 'Present'),
(8, 3, '2025-01-06 08:30:00', '2025-01-06 17:00:00', '2025-01-06', 'Late'),
(9, 4, '2025-01-06 08:00:00', '2025-01-06 17:00:00', '2025-01-06', 'Present'),
(10, 6, '2025-01-06 08:00:00', '2025-01-06 17:00:00', '2025-01-06', 'Present'),
(11, 2, '2025-01-07 08:00:00', '2025-01-07 17:00:00', '2025-01-07', 'Present'),
(12, 3, '2025-01-07 08:00:00', '2025-01-07 17:00:00', '2025-01-07', 'Present'),
(13, 4, '2025-01-07 08:20:00', '2025-01-07 17:00:00', '2025-01-07', 'Late'),
(14, 5, '2025-01-07 08:00:00', '2025-01-07 17:00:00', '2025-01-07', 'Present'),
(15, 6, '2025-01-07 08:00:00', '2025-01-07 17:00:00', '2025-01-07', 'Present'),
(16, 2, '2025-01-08 08:00:00', '2025-01-08 17:00:00', '2025-01-08', 'Present'),
(17, 3, '2025-01-08 08:10:00', '2025-01-08 17:00:00', '2025-01-08', 'Present'),
(18, 4, '2025-01-08 08:00:00', '2025-01-08 17:00:00', '2025-01-08', 'Present'),
(19, 5, '2025-01-08 08:00:00', '2025-01-08 13:00:00', '2025-01-08', 'Half Day'),
(20, 6, '2025-01-08 08:00:00', '2025-01-08 17:00:00', '2025-01-08', 'Present'),
(21, 7, '2025-01-08 08:00:00', '2025-01-08 17:00:00', '2025-01-08', 'Present'),
(22, 8, '2025-01-08 08:00:00', '2025-01-08 17:00:00', '2025-01-08', 'Present'),
(23, 1, '2025-01-05 08:00:00', '2025-01-05 18:00:00', '2025-01-05', 'Present'),
(24, 1, '2025-01-06 08:00:00', '2025-01-06 18:00:00', '2025-01-06', 'Present'),
(25, 1, '2025-01-07 08:00:00', '2025-01-07 18:00:00', '2025-01-07', 'Present');

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`CategoryID`, `CategoryName`, `Description`, `ParentCategoryID`, `FloorSection`) VALUES
(1, 'Electronics', 'All electronic devices and gadgets', NULL, 'Ground Floor'),
(2, 'Computers', 'Desktop and laptop computers', 1, 'First Floor - Section A'),
(3, 'Mobile Phones', 'Smartphones and feature phones', 1, 'Ground Floor - Section B'),
(4, 'Audio Equipment', 'Headphones, speakers, sound systems', 1, 'First Floor - Section C'),
(5, 'Television & Video', 'TVs, projectors, media players', 1, 'Second Floor'),
(6, 'Cameras', 'Digital cameras and accessories', 1, 'First Floor - Section D'),
(7, 'Gaming', 'Gaming consoles and accessories', 1, 'Second Floor - Section A'),
(8, 'Computer Accessories', 'Keyboards, mice, monitors', 2, 'First Floor - Section A'),
(9, 'Phone Accessories', 'Cases, chargers, screen protectors', 3, 'Ground Floor - Section B'),
(10, 'Home Appliances', 'Small home electronics', 1, 'Ground Floor - Section C'),
(11, 'Laptops', 'Portable computers', 2, 'First Floor - Section A'),
(12, 'Desktops', 'Desktop computers', 2, 'First Floor - Section A'),
(13, 'Smartphones', 'Advanced mobile phones', 3, 'Ground Floor - Section B'),
(14, 'Feature Phones', 'Basic mobile phones', 3, 'Ground Floor - Section B');

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `FirstName`, `LastName`, `Phone`, `Email`, `Address`, `City`, `DateRegistered`, `LoyaltyPoints`, `MembershipTier`, `Status`) VALUES
(1, 'Robert', 'Kariuki', '+254721111111', 'robert.k@email.com', 'Karen Estate, House No. 45', 'Nairobi', '2023-06-15', 1500, 'Gold', 'Active'),
(2, 'Jane', 'Atieno', '+254722222222', 'jane.a@email.com', 'Nyali Beach Road, Apt 12B', 'Mombasa', '2023-07-20', 800, 'Silver', 'Active'),
(3, 'Peter', 'Maina', '+254723333333', 'peter.m@email.com', 'Lavington, Spring Valley Road', 'Nairobi', '2023-05-10', 2500, 'Platinum', 'Active'),
(4, 'Alice', 'Chebet', '+254724444444', 'alice.c@email.com', 'Milimani Estate, Plot 67', 'Kisumu', '2023-08-05', 300, 'Bronze', 'Active'),
(5, 'George', 'Ouma', '+254725555555', 'george.o@email.com', 'Parklands, 4th Avenue', 'Nairobi', '2023-09-12', 600, 'Silver', 'Active'),
(6, 'Susan', 'Wangari', '+254726666666', 'susan.w@email.com', 'Westlands, Westwood Close', 'Nairobi', '2023-10-18', 150, 'Bronze', 'Active'),
(7, 'Mohamed', 'Hassan', '+254727777777', 'mohamed.h@email.com', 'Old Town, Mombasa', 'Mombasa', '2023-11-25', 1200, 'Gold', 'Active'),
(8, 'Catherine', 'Nyambura', '+254728888888', 'catherine.n@email.com', 'Kilimani, Argwings Road', 'Nairobi', '2024-01-08', 450, 'Bronze', 'Active'),
(9, 'Dennis', 'Otieno', '+254729999999', 'dennis.o@email.com', 'Kisumu CBD, Oginga Odinga Street', 'Kisumu', '2024-02-14', 920, 'Silver', 'Active'),
(10, 'Esther', 'Wanjiru', '+254720111111', 'esther.w@email.com', 'Eastleigh, Section 3', 'Nairobi', '2024-03-22', 3500, 'Platinum', 'Active'),
(11, 'Francis', 'Karanja', '+254730222222', 'francis.k@email.com', 'Upperhill, Hospital Road', 'Nairobi', '2024-04-10', 680, 'Silver', 'Active'),
(12, 'Ruth', 'Auma', '+254730333333', 'ruth.a@email.com', 'South B, Mombasa Road', 'Nairobi', '2024-05-15', 220, 'Bronze', 'Active'),
(13, 'Joseph', 'Kimani', '+254730444444', 'joseph.k@email.com', 'Bamburi, Links Road', 'Mombasa', '2024-06-20', 1800, 'Gold', 'Active'),
(14, 'Lucy', 'Adhiambo', '+254730555555', 'lucy.ad@email.com', 'Milimani, Kenyatta Avenue', 'Kisumu', '2024-07-05', 540, 'Silver', 'Active'),
(15, 'Brian', 'Ngugi', '+254730666666', 'brian.n@email.com', 'Runda, Mimosa Drive', 'Nairobi', '2024-08-12', 2100, 'Platinum', 'Active');

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`EmployeeID`, `FirstName`, `LastName`, `Email`, `Phone`, `Position`, `Salary`, `HireDate`, `Status`) VALUES
(1, 'David', 'Kamau', 'david.kamau@techhub.co.ke', '+254711111111', 'Manager', 80000.00, '2022-01-15', 'Active'),
(2, 'Mary', 'Njeri', 'mary.njeri@techhub.co.ke', '+254712222222', 'Cashier', 35000.00, '2023-03-20', 'Active'),
(3, 'James', 'Omondi', 'james.omondi@techhub.co.ke', '+254713333333', 'Sales Associate', 40000.00, '2023-06-10', 'Active'),
(4, 'Grace', 'Akinyi', 'grace.akinyi@techhub.co.ke', '+254714444444', 'Cashier', 35000.00, '2023-02-01', 'Active'),
(5, 'Michael', 'Kipchoge', 'michael.kipchoge@techhub.co.ke', '+254715555555', 'Sales Associate', 40000.00, '2023-04-15', 'Active'),
(6, 'Fatuma', 'Ali', 'fatuma.ali@techhub.co.ke', '+254716666666', 'Cashier', 35000.00, '2023-05-20', 'Active'),
(7, 'Daniel', 'Mutua', 'daniel.mutua@techhub.co.ke', '+254717777777', 'Stock Clerk', 32000.00, '2023-07-01', 'Active'),
(8, 'Lucy', 'Wambui', 'lucy.wambui@techhub.co.ke', '+254718888888', 'Sales Associate', 40000.00, '2023-08-10', 'Active'),
(9, 'Peter', 'Ochieng', 'peter.ochieng@techhub.co.ke', '+254719999999', 'Technician', 45000.00, '2023-09-15', 'Active'),
(10, 'Sarah', 'Wanjiku', 'sarah.wanjiku@techhub.co.ke', '+254710101010', 'Manager', 85000.00, '2022-03-01', 'Active'),
(11, 'John', 'Mwangi', 'john.mwangi@techhub.co.ke', '+254720202020', 'Security', 30000.00, '2023-10-01', 'Active'),
(12, 'Alice', 'Chebet', 'alice.chebet@techhub.co.ke', '+254720303030', 'Stock Clerk', 32000.00, '2023-11-05', 'Active'),
(13, 'Hassan', 'Omar', 'hassan.omar@techhub.co.ke', '+254720404040', 'Manager', 82000.00, '2022-06-10', 'Active'),
(14, 'Margaret', 'Wangari', 'margaret.wangari@techhub.co.ke', '+254720505050', 'Sales Associate', 38000.00, '2024-01-15', 'Active'),
(15, 'Paul', 'Kibet', 'paul.kibet@techhub.co.ke', '+254720606060', 'Cashier', 34000.00, '2024-02-20', 'Active');

--
-- Dumping data for table `pricehistory`
--

INSERT INTO `pricehistory` (`PriceHistoryID`, `ProductID`, `OldPrice`, `NewPrice`, `ChangeDate`, `ChangedBy`) VALUES
(1, 1, 82000.00, 85000.00, '2024-12-15 10:00:00', 1),
(2, 3, 68000.00, 65000.00, '2024-12-20 11:30:00', 1),
(3, 7, 65000.00, 60000.00, '2024-12-25 09:15:00', 10),
(4, 9, 55000.00, 52000.00, '2025-01-02 14:20:00', 1),
(5, 5, 13000.00, 12000.00, '2025-01-05 10:45:00', 10),
(6, 14, 38000.00, 35000.00, '2025-01-06 15:30:00', 1);

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductID`, `CategoryID`, `SupplierID`, `ProductName`, `Description`, `CostPrice`, `SellingPrice`, `MinimumStockLevel`, `Warranty`, `DateAdded`, `Status`) VALUES
(1, 11, 1, 'UltraBook Pro 15', 'High-performance laptop with 16GB RAM, 512GB SSD, Intel i7 processor', 70000.00, 85000.00, 5, '2 years', '2024-11-01', 'Active'),
(2, 11, 2, 'WorkStation Elite', 'Professional laptop for business - 32GB RAM, 1TB SSD, Intel i9', 95000.00, 120000.00, 3, '3 years', '2024-11-05', 'Active'),
(3, 13, 1, 'SmartPhone X12 Pro', 'Latest flagship smartphone with 5G, 12GB RAM, 256GB storage, 108MP camera', 52000.00, 65000.00, 15, '1 year', '2024-11-10', 'Active'),
(4, 13, 3, 'Budget Phone A1', 'Affordable smartphone for everyday use - 4GB RAM, 64GB storage', 12000.00, 15000.00, 25, '1 year', '2024-11-15', 'Active'),
(5, 4, 2, 'Wireless Headphones Pro', 'Premium noise-cancelling over-ear headphones, 30-hour battery', 9500.00, 12000.00, 10, '1 year', '2024-11-20', 'Active'),
(6, 4, 4, 'Bluetooth Speaker Mini', 'Portable waterproof Bluetooth speaker, 12-hour battery', 2800.00, 3500.00, 20, '6 months', '2024-11-22', 'Active'),
(7, 5, 3, '55\" Smart TV 4K', '4K Ultra HD Smart TV with built-in streaming apps', 48000.00, 60000.00, 8, '2 years', '2024-11-25', 'Active'),
(8, 6, 2, 'DSLR Camera Pro D7500', 'Professional DSLR camera 24MP with 18-55mm lens, 4K video', 75000.00, 95000.00, 4, '2 years', '2024-11-28', 'Active'),
(9, 7, 1, 'Gaming Console X', 'Next-generation gaming console with 4K gaming support', 40000.00, 52000.00, 10, '1 year', '2024-12-01', 'Active'),
(10, 9, 5, 'Phone Case Premium', 'Protective silicone case with drop resistance', 600.00, 800.00, 50, '3 months', '2024-12-05', 'Active'),
(11, 9, 5, 'Fast Charger 65W', 'Universal USB-C fast charger with multiple ports', 1800.00, 2500.00, 40, '1 year', '2024-12-08', 'Active'),
(12, 8, 2, 'Wireless Mouse Ergonomic', 'Ergonomic wireless mouse with 6 months battery life', 1200.00, 1800.00, 30, '6 months', '2024-12-10', 'Active'),
(13, 8, 2, 'Mechanical Keyboard RGB', 'RGB backlit mechanical gaming keyboard', 4500.00, 6000.00, 15, '1 year', '2024-12-12', 'Active'),
(14, 5, 3, '43\" LED TV Full HD', 'Full HD LED TV with HDMI and USB ports', 28000.00, 35000.00, 12, '1 year', '2024-12-15', 'Active'),
(15, 14, 7, 'Basic Phone K100', 'Long-lasting battery feature phone with dual SIM', 2500.00, 3200.00, 40, '6 months', '2024-12-18', 'Active'),
(16, 12, 2, 'Desktop PC Gaming', 'High-end gaming desktop - AMD Ryzen 9, 64GB RAM, RTX 4080', 150000.00, 180000.00, 5, '3 years', '2024-12-20', 'Active'),
(17, 9, 5, 'Screen Protector Tempered', 'Tempered glass screen protector for smartphones', 400.00, 600.00, 100, '1 month', '2024-12-22', 'Active'),
(18, 4, 4, 'Earbuds Wireless Pro', 'True wireless earbuds with active noise cancellation', 5500.00, 7000.00, 25, '1 year', '2024-12-25', 'Active'),
(19, 10, 6, 'Electric Kettle Smart', 'Smart electric kettle 1.7L with temperature control', 3200.00, 4500.00, 20, '1 year', '2024-12-28', 'Active'),
(20, 10, 6, 'Blender Portable', 'Portable rechargeable blender for smoothies', 2800.00, 3800.00, 18, '6 months', '2025-01-02', 'Active');

--
-- Dumping data for table `promotions`
--

INSERT INTO `promotions` (`PromotionID`, `PromotionName`, `Description`, `ProductID`, `CategoryID`, `DiscountPercentage`, `StartDate`, `EndDate`, `Status`) VALUES
(1, 'New Year Sale', 'Special discount on all smartphones', NULL, 13, 10.00, '2025-01-01', '2025-01-15', 'Active'),
(2, 'Laptop Week', 'Amazing deals on business laptops', 2, NULL, 5.00, '2025-01-05', '2025-01-12', 'Active'),
(3, 'Audio Bonanza', 'Great discounts on premium headphones', 5, NULL, 15.00, '2025-01-01', '2025-01-20', 'Active'),
(4, 'TV Clearance', 'Year-end TV clearance sale', NULL, 5, 12.00, '2024-12-20', '2025-01-10', 'Active'),
(5, 'Gaming Fest', 'Discounts on gaming consoles and accessories', NULL, 7, 8.00, '2025-01-10', '2025-01-25', 'Active'),
(6, 'Back to School', 'Student special on computers', NULL, 2, 7.00, '2024-12-01', '2024-12-31', 'Expired'),
(7, 'Home Appliance Deal', 'Special pricing on small appliances', NULL, 10, 10.00, '2025-01-05', '2025-01-30', 'Active');

--
-- Dumping data for table `purchaseorderitems`
--

INSERT INTO `purchaseorderitems` (`POItemID`, `PurchaseOrderID`, `ProductID`, `Quantity`, `UnitCost`, `Subtotal`) VALUES
(1, 1, 1, 5, 70000.00, 350000.00),
(2, 2, 3, 10, 52000.00, 520000.00),
(3, 3, 7, 10, 48000.00, 480000.00),
(4, 4, 3, 15, 52000.00, 780000.00),
(5, 5, 10, 200, 600.00, 120000.00),
(6, 5, 11, 20, 1800.00, 36000.00),
(7, 6, 12, 30, 1200.00, 36000.00),
(8, 6, 13, 20, 4500.00, 90000.00),
(9, 6, 2, 2, 95000.00, 190000.00),
(10, 7, 5, 15, 9500.00, 142500.00),
(11, 7, 18, 5, 5500.00, 27500.00),
(12, 8, 19, 30, 3200.00, 96000.00),
(13, 8, 20, 40, 2800.00, 112000.00);

--
-- Dumping data for table `purchaseorders`
--

INSERT INTO `purchaseorders` (`PurchaseOrderID`, `SupplierID`, `OrderDate`, `ExpectedDeliveryDate`, `TotalAmount`, `Status`, `ReceivedDate`, `Notes`) VALUES
(1, 1, '2024-12-01', '2024-12-10', 350000.00, 'Received', '2024-12-09', 'Laptops for holiday season'),
(2, 2, '2024-12-05', '2024-12-15', 520000.00, 'Received', '2024-12-14', 'Mixed electronics order'),
(3, 3, '2024-12-10', '2024-12-20', 480000.00, 'Received', '2024-12-18', 'TVs and audio equipment'),
(4, 1, '2024-12-15', '2024-12-25', 780000.00, 'Received', '2024-12-23', 'Smartphones bulk order'),
(5, 5, '2024-12-20', '2024-12-28', 156000.00, 'Received', '2024-12-27', 'Phone accessories restock'),
(6, 2, '2025-01-02', '2025-01-12', 380000.00, 'Approved', NULL, 'Computer accessories'),
(7, 4, '2025-01-05', '2025-01-15', 175000.00, 'Pending', NULL, 'Audio equipment'),
(8, 6, '2025-01-06', '2025-01-20', 220000.00, 'Pending', NULL, 'Home appliances');

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`SaleID`, `CustomerID`, `EmployeeID`, `SaleDate`, `SubTotal`, `TaxAmount`, `DiscountAmount`, `TotalAmount`, `PaymentMethod`, `ReceiptNumber`) VALUES
(1, 1, 2, '2025-01-05 10:30:00', 85000.00, 13600.00, 0.00, 98600.00, 'Card', 'REC-20250105-001'),
(2, 2, 2, '2025-01-05 11:45:00', 15000.00, 2400.00, 750.00, 16650.00, 'Cash', 'REC-20250105-002'),
(3, 3, 3, '2025-01-05 14:20:00', 65000.00, 10400.00, 3250.00, 72150.00, 'Mobile Money', 'REC-20250105-003'),
(4, 4, 4, '2025-01-05 09:15:00', 12000.00, 1920.00, 0.00, 13920.00, 'Card', 'REC-20250105-004'),
(5, NULL, 2, '2025-01-05 16:30:00', 3500.00, 560.00, 0.00, 4060.00, 'Cash', 'REC-20250105-005'),
(6, 5, 3, '2025-01-06 10:00:00', 120000.00, 19200.00, 6000.00, 133200.00, 'Card', 'REC-20250106-001'),
(7, 6, 4, '2025-01-06 11:20:00', 10300.00, 1648.00, 0.00, 11948.00, 'Mobile Money', 'REC-20250106-002'),
(8, 7, 2, '2025-01-06 13:45:00', 60000.00, 9600.00, 3000.00, 66600.00, 'Card', 'REC-20250106-003'),
(9, NULL, 6, '2025-01-06 15:10:00', 1800.00, 288.00, 0.00, 2088.00, 'Cash', 'REC-20250106-004'),
(10, 8, 3, '2025-01-07 09:30:00', 7000.00, 1120.00, 350.00, 7770.00, 'Card', 'REC-20250107-001'),
(11, 9, 5, '2025-01-07 11:00:00', 95000.00, 15200.00, 4750.00, 105450.00, 'Mobile Money', 'REC-20250107-002'),
(12, 10, 2, '2025-01-07 14:15:00', 180000.00, 28800.00, 9000.00, 199800.00, 'Card', 'REC-20250107-003'),
(13, NULL, 4, '2025-01-07 16:20:00', 6000.00, 960.00, 0.00, 6960.00, 'Cash', 'REC-20250107-004'),
(14, 11, 6, '2025-01-08 10:15:00', 35000.00, 5600.00, 1750.00, 38850.00, 'Card', 'REC-20250108-001'),
(15, 12, 3, '2025-01-08 12:30:00', 4100.00, 656.00, 0.00, 4756.00, 'Mobile Money', 'REC-20250108-002');

--
-- Dumping data for table `salesitems`
--

INSERT INTO `salesitems` (`SaleItemID`, `SaleID`, `ProductID`, `Quantity`, `UnitPrice`, `Discount`, `Subtotal`) VALUES
(1, 1, 1, 1, 85000.00, 0.00, 85000.00),
(2, 2, 4, 1, 15000.00, 750.00, 14250.00),
(3, 3, 3, 1, 65000.00, 3250.00, 61750.00),
(4, 4, 5, 1, 12000.00, 0.00, 12000.00),
(5, 5, 6, 1, 3500.00, 0.00, 3500.00),
(6, 6, 2, 1, 120000.00, 6000.00, 114000.00),
(7, 7, 10, 5, 800.00, 0.00, 4000.00),
(8, 7, 11, 3, 2500.00, 0.00, 7500.00),
(9, 7, 17, 5, 600.00, 0.00, 3000.00),
(10, 8, 7, 1, 60000.00, 3000.00, 57000.00),
(11, 9, 12, 1, 1800.00, 0.00, 1800.00),
(12, 10, 18, 1, 7000.00, 350.00, 6650.00),
(13, 11, 8, 1, 95000.00, 4750.00, 90250.00),
(14, 12, 16, 1, 180000.00, 9000.00, 171000.00),
(15, 13, 13, 1, 6000.00, 0.00, 6000.00),
(16, 14, 14, 1, 35000.00, 1750.00, 33250.00),
(17, 15, 19, 1, 4500.00, 0.00, 4500.00);

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`SupplierID`, `SupplierName`, `Phone`, `email`, `address`, `City`, `Country`, `PaymentTerms`, `Rating`, `Status`) VALUES
(1, 'Tech Global Imports', '+86-123-456789', 'info@techglobal.com', 'Shenzhen Technology Park, Building 5', 'Shenzhen', 'China', 'Net 30 days', 4.50, 'Active'),
(2, 'Electronics Distributors Ltd', '+254-20-1234567', 'sales@elecdist.co.ke', 'Industrial Area, Mombasa Road', 'Nairobi', 'Kenya', 'Net 15 days', 4.80, 'Active'),
(3, 'Digital Supplies Co', '+971-4-1234567', 'contact@digitalsupply.ae', 'Dubai Technology Hub, Floor 12', 'Dubai', 'UAE', 'Net 45 days', 4.20, 'Active'),
(4, 'Smart Tech Solutions', '+65-6123-4567', 'orders@smarttech.sg', '123 Tech Avenue, Singapore', 'Singapore', 'Singapore', 'Net 30 days', 4.60, 'Active'),
(5, 'Kenya Electronics Hub', '+254-41-7654321', 'info@kehub.co.ke', 'Nyali Beach Road, Shop 45', 'Mombasa', 'Kenya', 'Cash on Delivery', 4.40, 'Active'),
(6, 'Global Gadgets Inc', '+1-555-987-6543', 'sales@globalgadgets.com', '456 Innovation Drive', 'California', 'USA', 'Net 60 days', 4.70, 'Active'),
(7, 'African Tech Partners', '+254-20-9876543', 'partners@africatech.co.ke', 'Westlands, Parklands Road', 'Nairobi', 'Kenya', 'Net 21 days', 4.30, 'Active');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;