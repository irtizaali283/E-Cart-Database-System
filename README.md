# E-Cart-Database-System
The E-Cart Database System is a comprehensive SQL Server database designed to power a full-featured e-commerce platform. This database manages all aspects of an online shopping experience including user accounts, product catalog, shopping carts, orders, payments, inventory, and shipping.


Database Schema:
The database consists of 16 interrelated tables that form a complete e-commerce ecosystem:


Core Tables:
Adminn: Stores administrator accounts with roles and permissions

Customer: Contains customer registration and profile information

Categories: Organizes products into categories

Products: Stores product details including pricing and stock levels


Transaction Tables:
Cart: Shopping cart instances for each customer

CartItems: Products added to shopping carts

Orders: Customer order records

OrderDetails: Line items for each order

Payments: Payment transaction records


Operational Tables:
ShippingAddress: Customer address information for orders

Vendors: Supplier and vendor information

Inventory: Stock management and tracking

Sales: Sales transaction records

Ledger: Financial tracking of inventory movements

Tracking: Order delivery status and tracking


Key Features:
User Management: Complete customer and admin authentication system

Product Catalog: Categorized product inventory with stock tracking

Shopping Cart: Persistent cart functionality across sessions

Order Processing: Complete order workflow from creation to delivery

Payment Integration: Support for multiple payment methods and status tracking

Inventory Management: Real-time stock updates and financial tracking

Shipping & Tracking: Complete delivery management with status updates

Sales Analytics: Comprehensive reporting on sales performance


Database Relationships:
The database implements a relational model with:

Primary and foreign key constraints for data integrity

Cascading updates and deletes where appropriate

Indexed fields for optimal query performance

Normalized structure to minimize data redundancy


Advanced Functionality:
Stored Procedures:
Sales reporting (daily, monthly, yearly totals and averages)

Product management and inventory queries

Customer order history retrieval

Delivery status tracking


Triggers:
Automated stock management after sales

Overselling prevention mechanisms

Order total recalculation

Inventory timestamp updates

Cart management automation


Views and Joins:
Comprehensive product-category relationships

Customer order history views

Shopping cart details

Payment and shipping information consolidation

Sales and inventory reporting


Technical Specifications:
Database System: Microsoft SQL Server

Programming Language: Transact-SQL (T-SQL)

Key Technologies: Stored procedures, triggers, joins, aggregate functions

Data Integrity: Primary keys, foreign keys, constraints


Analytics and Reporting:
The database supports extensive business intelligence through:

Sales aggregation by time periods (day, month, year)

Product performance tracking

Customer spending analysis

Inventory turnover metrics

Payment method analytics

Vendor performance reporting


Usage Examples:
Customers can register, browse products, add items to cart, and place orders

Administrators can manage products, track inventory, and view sales reports

Vendors can be managed with their product associations

System can process payments, update inventory, and track deliveries automatically


