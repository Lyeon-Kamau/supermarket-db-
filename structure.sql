SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


-- Database: `supermarket-db-`
CREATE DATABASE IF NOT EXISTS `supermarket-db-` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `supermarket-db-`;

-- Table structure for table `attendancelog`

CREATE TABLE `attendancelog` (
  `AttendanceID` int(11) NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  `CheckInTime` datetime DEFAULT NULL,
  `CheckOutTime` datetime DEFAULT NULL,
  `WorkDate` date NOT NULL,
  `Status` enum('Present','Absent','Late','Half Day') DEFAULT 'Present'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table structure for table `categories`

CREATE TABLE `categories` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(50) NOT NULL,
  `Description` text DEFAULT NULL,
  `ParentCategoryID` int(11) DEFAULT NULL,
  `FloorSection` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table structure for table `customer`

CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `DateRegistered` date DEFAULT curdate(),
  `LoyaltyPoints` int(11) DEFAULT 0 CHECK (`LoyaltyPoints` >= 0),
  `MembershipTier` enum('Bronze','Silver','Gold','Platinum') DEFAULT 'Bronze',
  `Status` enum('Active','Inactive') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table structure for table `employee`

CREATE TABLE `employee` (
  `EmployeeID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(20) NOT NULL,
  `Position` enum('Manager','Cashier','Sales Associate','Stock Clerk','Security','Technician') NOT NULL,
  `Salary` decimal(10,2) NOT NULL,
  `HireDate` date NOT NULL,
  `Status` enum('Active','On Leave','Terminated') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Table structure for table `pricehistory`


CREATE TABLE `pricehistory` (
  `PriceHistoryID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `OldPrice` decimal(10,2) DEFAULT NULL,
  `NewPrice` decimal(10,2) DEFAULT NULL,
  `ChangeDate` datetime DEFAULT current_timestamp(),
  `ChangedBy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table structure for table `products`

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `SupplierID` int(11) DEFAULT NULL,
  `ProductName` varchar(100) NOT NULL,
  `Description` text DEFAULT NULL,
  `CostPrice` decimal(10,2) NOT NULL,
  `SellingPrice` decimal(10,2) NOT NULL,
  `MinimumStockLevel` int(11) DEFAULT 5,
  `Warranty` varchar(50) DEFAULT NULL,
  `DateAdded` date DEFAULT curdate(),
  `Status` enum('Active','Discontinued','Out of Stock') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table structure for table `promotions`

CREATE TABLE `promotions` (
  `PromotionID` int(11) NOT NULL,
  `PromotionName` varchar(100) NOT NULL,
  `Description` text DEFAULT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `DiscountPercentage` decimal(5,2) DEFAULT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `Status` enum('Active','Expired','Cancelled') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table structure for table `purchaseorderitems`

CREATE TABLE `purchaseorderitems` (
  `POItemID` int(11) NOT NULL,
  `PurchaseOrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `UnitCost` decimal(10,2) NOT NULL,
  `Subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table structure for table `purchaseorders`

CREATE TABLE `purchaseorders` (
  `PurchaseOrderID` int(11) NOT NULL,
  `SupplierID` int(11) NOT NULL,
  `OrderDate` date DEFAULT curdate(),
  `ExpectedDeliveryDate` date DEFAULT NULL,
  `TotalAmount` decimal(10,2) NOT NULL CHECK (`TotalAmount` >= 0),
  `Status` enum('Pending','Approved','Received','Cancelled') DEFAULT 'Pending',
  `ReceivedDate` date DEFAULT NULL,
  `Notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table structure for table `sales`

CREATE TABLE `sales` (
  `SaleID` int(11) NOT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `EmployeeID` int(11) NOT NULL,
  `SaleDate` datetime DEFAULT current_timestamp(),
  `SubTotal` decimal(10,2) NOT NULL,
  `TaxAmount` decimal(10,2) DEFAULT 0.00,
  `DiscountAmount` decimal(10,2) DEFAULT 0.00,
  `TotalAmount` decimal(10,2) NOT NULL,
  `PaymentMethod` enum('Cash','Card','Mobile Money','Loyalty Points') NOT NULL,
  `ReceiptNumber` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table structure for table `salesitems`

CREATE TABLE `salesitems` (
  `SaleItemID` int(11) NOT NULL,
  `SaleID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `UnitPrice` decimal(10,2) NOT NULL,
  `Discount` decimal(10,2) DEFAULT 0.00,
  `Subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table structure for table `supplier`

CREATE TABLE `supplier` (
  `SupplierID` int(11) NOT NULL,
  `SupplierName` varchar(100) NOT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `PaymentTerms` varchar(100) DEFAULT NULL,
  `Rating` decimal(3,2) DEFAULT NULL CHECK (`Rating` between 0 and 5),
  `Status` enum('Active','Inactive') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--INDEXES--

-- Indexes for table `attendancelog`
ALTER TABLE `attendancelog`
  ADD PRIMARY KEY (`AttendanceID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

-- Indexes for table `categories`
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CategoryID`),
  ADD UNIQUE KEY `CategoryName` (`CategoryName`),
  ADD KEY `ParentCategoryID` (`ParentCategoryID`);

-- Indexes for table `customer`
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`),
  ADD UNIQUE KEY `Phone` (`Phone`);

-- Indexes for table `employee`
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EmployeeID`),
  ADD UNIQUE KEY `Email` (`Email`);

-- Indexes for table `pricehistory`
ALTER TABLE `pricehistory`
  ADD PRIMARY KEY (`PriceHistoryID`),
  ADD KEY `ProductID` (`ProductID`),
  ADD KEY `ChangedBy` (`ChangedBy`);

-- Indexes for table `products`
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `CategoryID` (`CategoryID`),
  ADD KEY `SupplierID` (`SupplierID`);

-- Indexes for table `promotions`
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`PromotionID`),
  ADD KEY `ProductID` (`ProductID`),
  ADD KEY `CategoryID` (`CategoryID`);

-- Indexes for table `purchaseorderitems`
ALTER TABLE `purchaseorderitems`
  ADD PRIMARY KEY (`POItemID`),
  ADD KEY `PurchaseOrderID` (`PurchaseOrderID`),
  ADD KEY `ProductID` (`ProductID`);

-- Indexes for table `purchaseorders`
ALTER TABLE `purchaseorders`
  ADD PRIMARY KEY (`PurchaseOrderID`),
  ADD KEY `SupplierID` (`SupplierID`);

-- Indexes for table `sales`
ALTER TABLE `sales`
  ADD PRIMARY KEY (`SaleID`),
  ADD UNIQUE KEY `ReceiptNumber` (`ReceiptNumber`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

-- Indexes for table `salesitems`
ALTER TABLE `salesitems`
  ADD PRIMARY KEY (`SaleItemID`),
  ADD KEY `SaleID` (`SaleID`),
  ADD KEY `ProductID` (`ProductID`);

-- Indexes for table `supplier`
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`SupplierID`);

  --AUTO INCREMENT--

-- AUTO_INCREMENT for table `attendancelog`
ALTER TABLE `attendancelog`
  MODIFY `AttendanceID` int(11) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT for table `categories`
ALTER TABLE `categories`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT for table `customer`
ALTER TABLE `customer`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT for table `employee`
ALTER TABLE `employee`
  MODIFY `EmployeeID` int(11) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT for table `pricehistory`
ALTER TABLE `pricehistory`
  MODIFY `PriceHistoryID` int(11) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT for table `products`
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT for table `promotions`
ALTER TABLE `promotions`
  MODIFY `PromotionID` int(11) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT for table `purchaseorderitems`
ALTER TABLE `purchaseorderitems`
  MODIFY `POItemID` int(11) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT for table `purchaseorders`
ALTER TABLE `purchaseorders`
  MODIFY `PurchaseOrderID` int(11) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT for table `sales`
ALTER TABLE `sales`
  MODIFY `SaleID` int(11) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT for table `salesitems`
ALTER TABLE `salesitems`
  MODIFY `SaleItemID` int(11) NOT NULL AUTO_INCREMENT;

--CONSTRAINTS--

-- Constraints for table `attendancelog`
ALTER TABLE `attendancelog`
  ADD CONSTRAINT `attendancelog_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE CASCADE;

-- Constraints for table `categories`
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`ParentCategoryID`) REFERENCES `categories` (`CategoryID`) ON DELETE SET NULL;

-- Constraints for table `pricehistory`
ALTER TABLE `pricehistory`
  ADD CONSTRAINT `pricehistory_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`) ON DELETE CASCADE,
  ADD CONSTRAINT `pricehistory_ibfk_2` FOREIGN KEY (`ChangedBy`) REFERENCES `employee` (`EmployeeID`) ON DELETE SET NULL;

-- Constraints for table `products`
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`SupplierID`) REFERENCES `supplier` (`SupplierID`) ON DELETE SET NULL;

-- Constraints for table `promotions`
ALTER TABLE `promotions`
  ADD CONSTRAINT `promotions_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`) ON DELETE CASCADE,
  ADD CONSTRAINT `promotions_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`) ON DELETE CASCADE;

-- Constraints for table `purchaseorderitems`
ALTER TABLE `purchaseorderitems`
  ADD CONSTRAINT `purchaseorderitems_ibfk_1` FOREIGN KEY (`PurchaseOrderID`) REFERENCES `purchaseorders` (`PurchaseOrderID`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchaseorderitems_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`);

-- Constraints for table `purchaseorders`
ALTER TABLE `purchaseorders`
  ADD CONSTRAINT `purchaseorders_ibfk_1` FOREIGN KEY (`SupplierID`) REFERENCES `supplier` (`SupplierID`);

-- Constraints for table `sales`
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE SET NULL,
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`);

-- Constraints for table `salesitems`
ALTER TABLE `salesitems`
  ADD CONSTRAINT `salesitems_ibfk_1` FOREIGN KEY (`SaleID`) REFERENCES `sales` (`SaleID`) ON DELETE CASCADE,
  ADD CONSTRAINT `salesitems_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`);
COMMIT;

--Events'
SET GLOBAL event_scheduler = ON;

SHOW VARIABLES LIKE 'event_scheduler';

--Automatically END expired promotions'
CREATE EVENT end_expired_promotions
ON SCHEDULE EVERY 1 DAY
DO
UPDATE promotions
SET status = 'Expired'
WHERE end_date < CURDATE()
AND status = 'Active';

--Archive old prices into pricehistory'
CREATE EVENT archive_price_changes
ON SCHEDULE EVERY 1 DAY
DO
INSERT INTO pricehistory (ProductID, OldPrice, ChangeDate)
SELECT ProductID, Price, NOW()
FROM products
WHERE Price <> (
    SELECT NewPrice
    FROM pricehistory
    WHERE pricehistory.ProductID = products.ProductID
    ORDER BY ChangeDate DESC
    LIMIT 1
);

--Mark employees absent if they didn’t check in'
CREATE EVENT mark_daily_absence
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_DATE + INTERVAL 23 HOUR + INTERVAL 59 MINUTE
DO
INSERT INTO attendancelog (EmployeeID, Date, Status)
SELECT e.EmployeeID, CURDATE(), 'Absent'
FROM employee e
WHERE e.EmployeeID NOT IN (
    SELECT EmployeeID
    FROM attendancelog
    WHERE Date = CURDATE()
);

--Auto-close completed purchase orders'
CREATE EVENT close_completed_purchase_orders
ON SCHEDULE EVERY 1 DAY
DO
UPDATE purchaseorders
SET Status = 'Completed'
WHERE OrderID NOT IN (
    SELECT OrderID
    FROM purchaseorderitems
    WHERE QuantityReceived < QuantityOrdered
);


--user-defined functions'


--Calculate total value of a sale'
DELIMITER $$

CREATE FUNCTION getSaleTotal(sale_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT SUM(Quantity * UnitPrice)
    INTO total
    FROM salesitems
    WHERE SaleID = sale_id;

    RETURN IFNULL(total, 0);
END$$

DELIMITER ;


--Check product stock status'
DELIMITER $$

CREATE FUNCTION stockStatus(product_id INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE qty INT;

    SELECT QuantityInStock
    INTO qty
    FROM products
    WHERE ProductID = product_id;

    IF qty = 0 THEN
        RETURN 'Out of Stock';
    ELSEIF qty < 10 THEN
        RETURN 'Low Stock';
    ELSE
        RETURN 'In Stock';
    END IF;
END$$

DELIMITER ;

--Get current price of a product'
DELIMITER $$

CREATE FUNCTION getProductPrice(product_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE price DECIMAL(10,2);

    SELECT Price
    INTO price
    FROM products
    WHERE ProductID = product_id;

    RETURN price;
END$$

DELIMITER ;

--Calculate employee attendance percentage'
DELIMITER $$

CREATE FUNCTION attendancePercentage(emp_id INT)
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE total_days INT;
    DECLARE present_days INT;

    SELECT COUNT(*) INTO total_days
    FROM attendancelog
    WHERE EmployeeID = emp_id;

    SELECT COUNT(*) INTO present_days
    FROM attendancelog
    WHERE EmployeeID = emp_id
    AND Status = 'Present';

    IF total_days = 0 THEN
        RETURN 0;
    END IF;

    RETURN (present_days / total_days) * 100;
END$$

DELIMITER ;

--Check if a promotion is active'
DELIMITER $$

CREATE FUNCTION isPromotionActive(promo_id INT)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    DECLARE enddate DATE;

    SELECT End_Date INTO enddate
    FROM promotions
    WHERE PromotionID = promo_id;

    IF enddate >= CURDATE() THEN
        RETURN 'Active';
    ELSE
        RETURN 'Expired';
    END IF;
END$$

DELIMITER ;

--VIEWS--

--Customer Purchase Summary--
CREATE VIEW view_customer_sales_summary AS
SELECT 
    c.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    COUNT(s.SaleID) AS TotalSales,
    SUM(s.TotalAmount) AS TotalSpent
FROM customer c
LEFT JOIN sales s ON c.CustomerID = s.CustomerID
GROUP BY c.CustomerID;

--Daily Sales Report--
CREATE VIEW view_daily_sales AS
SELECT 
    DATE(SaleDate) AS SaleDay,
    COUNT(SaleID) AS NumberOfSales,
    SUM(SubTotal) AS SubTotal,
    SUM(TaxAmount) AS TotalTax,
    SUM(DiscountAmount) AS TotalDiscount,
    SUM(TotalAmount) AS TotalRevenue
FROM sales
GROUP BY DATE(SaleDate);

--Product Sales Performance--
CREATE VIEW view_product_sales AS
SELECT 
    p.ProductID,
    p.ProductName,
    SUM(si.Quantity) AS TotalQuantitySold,
    SUM(si.Subtotal) AS TotalSalesValue
FROM products p
JOIN salesitems si ON p.ProductID = si.ProductID
GROUP BY p.ProductID;

--Employee Sales Performance--
CREATE VIEW view_employee_sales AS
SELECT 
    e.EmployeeID,
    CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
    COUNT(s.SaleID) AS SalesHandled,
    SUM(s.TotalAmount) AS TotalSalesValue
FROM employee e
LEFT JOIN sales s ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID;

--Active Promotions--
CREATE VIEW view_active_promotions AS
SELECT 
    PromotionID,
    PromotionName,
    DiscountPercentage,
    StartDate,
    EndDate,
    Status
FROM promotions
WHERE Status = 'Active';

--Product Price List--
CREATE VIEW view_product_price_list AS
SELECT 
    ProductID,
    ProductName,
    SellingPrice,
    Status
FROM products
WHERE Status = 'Active';

--Supplier Product List--
CREATE VIEW view_supplier_products AS
SELECT 
    s.SupplierName,
    p.ProductName,
    p.CostPrice,
    p.SellingPrice
FROM supplier s
JOIN products p ON s.SupplierID = p.SupplierID;

--Employee Attendance Summary--
CREATE VIEW view_employee_attendance AS
SELECT 
    e.EmployeeID,
    CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
    COUNT(a.AttendanceID) AS DaysRecorded,
    SUM(a.Status = 'Present') AS DaysPresent,
    SUM(a.Status = 'Absent') AS DaysAbsent
FROM employee e
LEFT JOIN attendancelog a ON e.EmployeeID = a.EmployeeID
GROUP BY e.EmployeeID;



