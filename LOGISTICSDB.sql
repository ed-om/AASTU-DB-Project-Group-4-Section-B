
CREATE TABLE customers(
Customer_ID INT PRIMARY KEY,
First_Name VARCHAR(50),
Last_Name VARCHAR(50),
Email VARCHAR(100),
Phone VARCHAR(20),
Customer_Address VARCHAR(255)
);

CREATE TABLE products(
Product_ID INT PRIMARY KEY,
Product_Name VARCHAR(100),
SKU VARCHAR(50),
Weight DECIMAL(10,2),
Category VARCHAR(50)
);
CREATE TABLE couriers(
Courier_ID INT PRIMARY KEY,
Name VARCHAR(100),
Phone VARCHAR(50),
Vehicle_Type VARCHAR(50),
License_Number VARCHAR(50)
);
CREATE TABLE warehouses(
Warehouse_ID INT PRIMARY KEY,
Warehouse_Name VARCHAR(100),
Location VARCHAR(255),
Capacity INT
);
CREATE TABLE orders(
Order_ID INT PRIMARY KEY,
Customer_ID INT,
Order_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
Total_Amount DECIMAL(10,2),
Status VARCHAR(20),
FOREIGN KEY (Customer_ID) REFERENCES customers(Customer_ID)
);
CREATE TABLE order_items(
Order_ID INT,
Product_ID INT,
Quantity INT,
PRIMARY KEY(Order_ID, Product_ID),
FOREIGN KEY(Order_ID) REFERENCES orders(Order_ID),
FOREIGN KEY(Product_ID) REFERENCES products(Product_ID)
);
CREATE TABLE shipments(
Shipment_ID INT PRIMARY KEY,
Order_ID INT,
Courier_ID INT,
Warehouse_ID INT,
Tracking_Number VARCHAR(100),
Ship_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
Delivery_Status VARCHAR(30),
FOREIGN KEY (Order_ID) REFERENCES orders(Order_ID),
FOREIGN KEY(Courier_ID) REFERENCES couriers(Courier_ID),
FOREIGN KEY(Warehouse_ID) REFERENCES warehouses(Warehouse_ID)
);
CREATE TABLE warehouse_inventory(
Warehouse_ID INT,
Product_ID INT,
Quantity_On_Hand INT,
Last_Updated DATE,
PRIMARY KEY(Warehouse_ID, Product_ID),
FOREIGN KEY (Warehouse_ID) REFERENCES warehouses(Warehouse_ID),
FOREIGN KEY (Product_ID) REFERENCES products(Product_ID)
);

