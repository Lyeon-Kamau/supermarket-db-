Supermarket Database Project

Project Overview

This project implements a fully functional supermarket database** using xampp. The database manages the operations of a supermarket, including:

- Products and categories
- Customers and loyalty programs
- Suppliers and purchase orders
- Employees and attendance
- Sales and promotions
- Price history and stock management

Database Features
a) Tables
The database consists of the following main tables:

 Table                  Purpose                                                     

 `employee`            Stores employee details, positions, and status              
 `attendancelog`       Tracks employee check-in/out and attendance                 
 `customer`            Stores customer information, loyalty points, and membership 
 `supplier`            Stores supplier contact details and rating                  
 `categories`          Organizes products into hierarchical categories             
 `products`            Stores product details, prices, stock levels, and status    
 `pricehistory`        Logs changes in product prices                              
 `promotions`          Stores product/category discounts and promotions            
 `sales`               Records sales transactions, payments, and totals            
 `salesitems`          Stores products sold in each sale                           
 `purchaseorders`      Records orders placed with suppliers                        
 `purchaseorderitems`  Details of products in purchase orders                      
3. Database Design

- The database is normalized to reduce redundancy and improve efficiency.
- Relationships are implemented using foreign keys, with ON DELETE CASCADE and SET NULL where appropriate.
- All IDs use AUTO_INCREMENT for unique identification.

4. Key Benefits

- Fully manages supermarket operations
- Maintains data integrity with constraints
- Provides fast queries using indexes
- Automates tasks with triggers and events
- Easy to extend for future features

5. Authors

- Names:lyeon kamau 189254
        Faith Jepkemoi 186764
        Mwenda mwiti 171598
- Project: Supermarket Database System
