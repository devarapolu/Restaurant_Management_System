
CREATE TABLE Customer ( 
    Customer_ID INT(7) PRIMARY KEY, 
    First_Name VARCHAR(20) NOT NULL, 
    Last_Name VARCHAR(20) NOT NULL, 
    Phone_Number CHAR(15) NOT NULL, 
    Email_ID VARCHAR(40) NOT NULL 
); 

CREATE TABLE Reservation ( 
    Reservation_ID INT(7) PRIMARY KEY, 
    Customer_ID INT(7) NOT NULL, 
    Reserve_Date DATETIME NOT NULL, 
    Table_No INT(2) NOT NULL, 
    Booking_Status VARCHAR(20), 
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID) 
);

CREATE TABLE Feedback ( 
    Feedback_ID INT(7) PRIMARY KEY, 
    Bill_ID INT(7) NOT NULL, 
    Customer_ID INT(7) NOT NULL, 
    Rating INT(2) NOT NULL, 
    Review VARCHAR(255), 
    FOREIGN KEY (Bill_ID) REFERENCES Bill(Bill_ID), 
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID) 
);

CREATE TABLE Bill ( 
    Bill_ID INT(7) PRIMARY KEY, 
    Bill_Date DATETIME NOT NULL, 
    Bill_Amount FLOAT(7,2) NOT NULL, 
    Bill_Status VARCHAR(20)
);  

CREATE TABLE Staff ( 
    Staff_ID INT(7) PRIMARY KEY, 
    First_Name VARCHAR(20) NOT NULL, 
    Last_Name VARCHAR(20) NOT NULL, 
    Designation VARCHAR(30) NOT NULL, 
    Salary FLOAT(7,2) NOT NULL,
	Start_Date DATE NOT NULL,
	End_Date DATE
); 

CREATE TABLE Payment ( 
    Payment_ID INT(7) PRIMARY KEY, 
    Bill_ID INT(7) NOT NULL, 
    Customer_ID INT(7) NOT NULL, 
    Payment_Method VARCHAR(12) NOT NULL, 
    Payment_Date DATETIME NOT NULL, 
    Payment_Status VARCHAR(20), 
    FOREIGN KEY (Bill_ID) REFERENCES Bill(Bill_ID), 
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID) 
); 

CREATE TABLE Order_Item ( 
    Order_ID INT(7) PRIMARY KEY, 
    Bill_ID INT(7) NOT NULL, 
    Customer_ID INT(7) NOT NULL, 
    Item_ID INT(7) NOT NULL, 
    Staff_ID INT(7) NOT NULL, 
    Quantity INT(2) NOT NULL, 
    Amount FLOAT(7,2) NOT NULL, 
    FOREIGN KEY (Bill_ID) REFERENCES Bill(Bill_ID), 
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID), 
    FOREIGN KEY (Item_ID) REFERENCES Menu_Item(Item_ID), 
    FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID) 
);
 
CREATE TABLE Menu_Item ( 
    Item_ID INT(7) PRIMARY KEY, 
    Name VARCHAR(30) NOT NULL, 
    Description VARCHAR(100), 
    Start_Date DATE NOT NULL, 
    End_Date DATE NOT NULL, 
    Price FLOAT(7,2) NOT NULL, 
    Category VARCHAR(20) 
);


INSERT INTO Customer (Customer_ID, First_Name, Last_Name, Phone_Number, Email_ID) 

VALUES 

(1, 'Amit', 'Sharma', '9876543210', 'amit.sharma@example.com'), 

(2, 'Priya', 'Gupta', '9876543211', 'priya.gupta@example.com'), 

(3, 'Rahul', 'Verma', '9876543212', 'rahul.verma@example.com'), 

(4, 'Sneha', 'Patel', '9876543213', 'sneha.patel@example.com'), 

(5, 'Neha', 'Singh', '9876543214', 'neha.singh@example.com'), 

(6, 'Rajesh', 'Kumar', '9876543215', 'rajesh.kumar@example.com'), 

(7, 'Meera', 'Reddy', '9876543216', 'meera.reddy@example.com'), 

(8, 'Deepak', 'Malhotra', '9876543217', 'deepak.malhotra@example.com'), 

(9, 'Anita', 'Joshi', '9876543218', 'anita.joshi@example.com'), 

(10, 'Sanjay', 'Thakur', '9876543219', 'sanjay.thakur@example.com'); 


INSERT INTO Reservation (Reservation_ID, Customer_ID, Reserve_Date, Table_No, Booking_Status) 

VALUES 

(1, 1, '2023-01-05 17:00:00', '1', 'Confirmed'), 

(2, 2, '2023-01-08 14:00:00', '3', 'Confirmed'), 

(3, 3, '2023-01-12 12:00:00', '2', 'In Queue'), 

(4, 4, '2023-01-15 2:00:00', '4', 'Confirmed'), 

(5, 5, '2023-01-18 18:00:00', '6', 'Confirmed'), 

(6, 1, '2023-01-22 15:30:00', '5', 'Confirmed'), 

(7, 2, '2023-01-25 7:30:00', '7', 'Confirmed'), 

(8, 3, '2023-01-28 2:00:00', '9', 'Confirmed'), 

(9, 4, '2023-01-30 8:00:00', '8', 'Confirmed'), 

(10, 5, '2023-02-02 9:00:00', '10', 'Confirmed'); 


INSERT INTO Feedback (Feedback_ID, Bill_ID, Customer_ID, Rating, Review) 

VALUES 

(1, 1, 1, 4, 'Great food and service'), 

(2, 2, 2, 5, 'Excellent experience!'), 

(3, 3, 3, 3, 'Average food, could be better'), 

(4, 4, 4, 4, 'Friendly staff, enjoyed the meal'), 

(5, 5, 5, 2, 'Disappointing, would not come back'), 

(6, 6, 1, 5), 

(7, 7, 2, 4, 'Delicious food, will visit again'), 

(8, 8, 3, 3, 'Slow service, needs improvement'), 

(9, 9, 4, 5, 'Loved the ambiance and food'), 

(10, 10, 5, 4, 'Good value for money'); 


INSERT INTO Bill (Bill_ID, Bill_Date, Bill_Amount, Bill_Status) 

VALUES 

(1, '2023-01-05 17:00:46',500, 'Paid'), 
    
(2, '2023-01-08 14:00:26',1400, 'Paid'), 
    
(3, '2023-01-12 12:00:32',600, 'Paid'), 
    
(4, '2023-01-15 2:00:56', 620, 'Pending'), 
    
(5, '2023-01-18 18:00:00',310, 'Paid'), 
    
(6, '2023-01-22 15:30:00',560, 'Paid'), 
    
(7, '2023-01-25 7:30:00', 400, 'Paid'), 
    
(8, '2023-01-28 2:00:00', 560, 'Paid'), 
    
(9, '2023-01-30 8:00:00', 400, 'Paid'), 
    
(10, '2023-02-02 9:00:00', 160, 'Paid'); 

INSERT INTO Staff (Staff_ID, First_Name, Last_Name, Designation, Salary, Start_Date, End_Date) 

VALUES 

(1, 'Rahul', 'Kumar', 'Manager', 50000, '2021-05-24'), 

(2, 'Priya', 'Sharma', 'Chef', 40000,'2012-08-15'), 

(3, 'Amit', 'Verma', 'Waiter', 25000,'2015-06-17','2021-12-26'), 

(4, 'Sneha', 'Gupta', 'Waitress', 25000,'2018-08-16'), 

(5, 'Rajesh', 'Singh', 'Bartender', 30000,'2023-01-22','2023-04-30'), 

(6, 'Anita', 'Reddy', 'Hostess', 20000,'2021-05-24','2023-01-01'), 

(7, 'Deepak', 'Joshi', 'Chef', 40000,'2022-04-16','2021-03-25'), 

(8, 'Neha', 'Malhotra', 'Waitress', 25000,'2019-06-29'), 

(9, 'Sanjay', 'Patel', 'Waiter', 25000,'2016-02-15','2019-03-06'), 

(10, 'Meera', 'Thakur', 'Chef', 40000,'2012-04-01'); 

INSERT INTO Payment (Payment_ID, Bill_ID, Customer_ID, Payment_Method, Payment_Date, Payment_Status) 

VALUES 

(1, 1, 1, 'Credit Card', '2023-01-05 17:00:46', 'Paid'), 
                         
(2, 2, 2, 'Cash',        '2023-01-08 14:00:26', 'Paid'), 
                         
(3, 3, 3, 'Debit Card',  '2023-01-12 12:00:32', 'Paid'), 
                         
(4, 4, 4, 'Cash',        '2023-01-15 2:00:56',  'Pending'), 
                         
(5, 5, 5, 'Credit Card', '2023-01-18 18:00:00', 'Paid'), 
                         
(6, 6, 1, 'Debit Card',  '2023-01-22 15:30:00', 'Paid'), 
                         
(7, 7, 2, 'Cash',        '2023-01-25 7:30:00',  'Paid'), 
                         
(8, 8, 3, 'Credit Card', '2023-01-28 2:00:00',  'Paid'), 
                         
(9, 9, 4, 'Debit Card',  '2023-01-30 8:00:00',  'Paid'), 
                         
(10, 10, 5, 'Cash',       '2023-02-02 9:00:00', 'Paid'); 

INSERT INTO Order_Item (Order_ID, Bill_ID, Customer_ID, Item_ID, Staff_ID, Quantity, Amount) 

VALUES 

(1, 1, 1, 1, 1, 2, 400), 

(2, 1, 1, 3, 1, 1, 100), 

(3, 2, 2, 2, 2, 3, 900), 

(4, 2, 2, 4, 2, 2, 500), 

(5, 3, 3, 1, 3, 1, 200), 

(6, 3, 3, 5, 3, 2, 300), 

(7, 4, 4, 3, 1, 2, 200), 

(8, 4, 4, 6, 1, 2, 360), 

(9, 5, 5, 4, 2, 1, 250), 

(10, 5, 5, 7, 2, 1, 50); 

INSERT INTO Menu_Item (Item_ID, Name, Description, Start_Date, End_Date, Price, Category) 

VALUES 

(1, 'Paneer Tikka', 'Marinated paneer grilled to perfection', '2023-01-01', '2023-12-31', 200, 'Appetizer'), 

(2, 'Chicken Biryani', 'Aromatic rice dish with succulent chicken', '2023-01-01', '2023-12-31', 300, 'Main Course'), 

(3, 'Gulab Jamun', 'Soft and spongy milk-based sweet', '2023-01-01', '2023-12-31', 100, 'Dessert'), 

(4, 'Palak Paneer', 'Creamy spinach curry with cottage cheese', '2023-01-01', '2023-12-31', 250, 'Main Course'), 

(5, 'Mango Lassi', 'Refreshing yogurt-based drink with fresh mango', '2023-01-01', '2023-12-31', 150, 'Beverage'), 

(6, 'Chole Bhature', 'Spicy chickpea curry with deep-fried bread', '2023-01-01', '2023-12-31', 180, 'Main Course'), 

(7, 'Masala Chai', 'Traditional Indian spiced tea', '2023-01-01', '2023-12-31', 50, 'Beverage'), 

(8, 'Rasgulla', 'Soft and spongy cottage cheese balls in sugar syrup', '2023-01-01', '2023-12-31', 120, 'Dessert'), 

(9, 'Mutton Rogan Josh', 'Flavorful slow-cooked mutton curry', '2023-01-01', '2023-12-31', 400, 'Main Course'), 

(10, 'Pani Puri', 'Crispy hollow puris filled with tangy water', '2023-01-01', '2023-12-31', 100, 'Appetizer'); 