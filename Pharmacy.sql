CREATE TABLE Staff
( 
  StaffID NUMBER NOT NULL, 
  Name VARCHAR2(20) NOT NULL,  
  Job VARCHAR2(30),
  Salary NUMBER(7, 2),
  Commission NUMBER(7, 2),
  HireDate  DATE, 
  Address  VARCHAR2(60), 
  Phone  VARCHAR2(24),

CONSTRAINT PK_Staff PRIMARY KEY (StaffID)

) 
/ 

CREATE TABLE Category
( 
  CategoryID  NUMBER NOT NULL, 
  CategoryName  VARCHAR2(30) NOT NULL, 
  Description  VARCHAR2(300), 

CONSTRAINT PK_Category PRIMARY KEY (CategoryID))

/ 


CREATE TABLE Customer
( 
  CustomerID NUMBER NOT NULL, 
  CustomerName  VARCHAR2(30),  
  Phone  VARCHAR2(24), 
 
CONSTRAINT PK_Customer PRIMARY KEY (CustomerID)
) 
/ 


CREATE TABLE Supplier
( 
  SupplierID  NUMBER NOT NULL, 
  CompanyName  VARCHAR2(40) NOT NULL, 
  SupplierName  VARCHAR2(30), 
  Address  VARCHAR2(60), 
  Phone  VARCHAR2(24), 

CONSTRAINT PK_Supplier
  PRIMARY KEY (SupplierID)
) 
/ 


CREATE TABLE Product
( 
  ProductID  NUMBER NOT NULL, 
  ProductName  VARCHAR2(40) NOT NULL, 
  SupplierID  NUMBER, 
  CategoryID  NUMBER, 
  Quantity  VARCHAR2(20), 
  UnitPrice  NUMBER, 


CONSTRAINT PK_Product
  PRIMARY KEY (ProductID), 
CONSTRAINT CHK_Product_Price   CHECK ((UnitPrice >= 0)), 
CONSTRAINT FK_Product_Category FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID), 
CONSTRAINT FK_Product_Supplier FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
) 
/ 


CREATE TABLE Transaction
( 
  TransactionID  NUMBER NOT NULL, 
  CustomerID  NUMBER, 
  StaffID  NUMBER, 
  TransactionDate  DATE, 
 

CONSTRAINT PK_Transaction
  PRIMARY KEY (TransactionID), 
CONSTRAINT FK_Transaction_Customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID), 
CONSTRAINT FK_Transaction_Staff FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
)
/



CREATE TABLE TransactionDetails 
( 
  TransactionID  NUMBER NOT NULL, 
  ProductID  NUMBER NOT NULL, 
  UnitPrice  NUMBER NOT NULL, 
  Quantity  NUMBER NOT NULL, 
  Discount  NUMBER NOT NULL, 

CONSTRAINT PK_Transaction_Details
  PRIMARY KEY (TransactionID, ProductID), 
CONSTRAINT CHK_Discount   CHECK ((Discount >= 0 and Discount <= 1)), 
CONSTRAINT CHK_Quantity   CHECK ((Quantity > 0)), 
CONSTRAINT CHK_UnitPrice   CHECK ((UnitPrice >= 0)), 
CONSTRAINT FK_TransactionDetails_Transaction FOREIGN KEY (TransactionID) REFERENCES Transaction(TransactionID), 
CONSTRAINT FK_TransactionDetails_Product FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
)
/



begin
INSERT INTO Customer(CustomerID, CustomerName, Phone) VALUES (001, 'Akram','03452004321');
INSERT INTO Customer(CustomerID, CustomerName, Phone) VALUES (002, 'Afzal','03122004321');
INSERT INTO Customer(CustomerID, CustomerName, Phone) VALUES (003, 'Asif','03352004321');
INSERT INTO Customer(CustomerID, CustomerName, Phone) VALUES (004, 'Areeb','03332004321');
INSERT INTO Customer(CustomerID, CustomerName, Phone) VALUES (005, 'Ahsan','03234304321');
INSERT INTO Customer(CustomerID, CustomerName, Phone) VALUES (006, 'Basit','03234204321');
INSERT INTO Customer(CustomerID, CustomerName, Phone) VALUES (007, 'Brian','0338574321');
INSERT INTO Customer(CustomerID, CustomerName, Phone) VALUES (008, 'Catherine','0354554421');
INSERT INTO Customer(CustomerID, CustomerName, Phone) VALUES (009, 'Carla','03335423321');
commit;
end;
/


begin
INSERT INTO Category(CategoryID, CategoryName, Description) VALUES (001, 'Food and beverages', 'Soft drinks, coffees,chips, teas, nimcos');
INSERT INTO Category(CategoryID, CategoryName, Description) VALUES (002, 'Skin care', 'Creams, Tubes,Ointments,Gels,Oil');
INSERT INTO Category(CategoryID, CategoryName, Description) VALUES (003, 'Feminine Products', 'Sanitary Pads, OTC Products,Sanitary Napkins, Hair Removing Creams');
INSERT INTO Category(CategoryID, CategoryName, Description) VALUES (004, 'Medicine', 'Tablets, Syrups,Injections, Drips, Ointments');
INSERT INTO Category(CategoryID, CategoryName, Description) VALUES (005, 'Baby & Mother Care', 'Feeders, Pampers,Nipples, Baby Eatables, Napkins');
commit;
end;
/


begin
INSERT INTO Product(ProductID, ProductName, SupplierID, CategoryID, Quantity, UnitPrice) VALUES (001, 'Johson Baby Lotion', 1, 1, 100, 180);
INSERT INTO Product(ProductID, ProductName, SupplierID, CategoryID, Quantity, UnitPrice) VALUES (002, 'Baby Diaper', 1, 2, 100, 50);
INSERT INTO Product(ProductID, ProductName, SupplierID, CategoryID, Quantity, UnitPrice) VALUES (003, 'Chips', 2, 4, 100, 180);
INSERT INTO Product(ProductID, ProductName, SupplierID, CategoryID, Quantity, UnitPrice) VALUES (004, 'Ascard', 1, 4, 100, 180);
INSERT INTO Product(ProductID, ProductName, SupplierID, CategoryID, Quantity, UnitPrice) VALUES (005, 'Humilin 70/30', 1, 4, 100, 180);
INSERT INTO Product(ProductID, ProductName, SupplierID, CategoryID, Quantity, UnitPrice) VALUES (006, 'Monteka', 1, 4, 100, 180);
commit;
end;
/


begin
INSERT INTO Staff(StaffID, Name, Job, Salary, Commission, Hiredate, Address, Phone) VALUES (001,'Mansoor Khan','Pharmacy technician',50000,1000,'12/10/2000','Street No XYZ, Block 93, Gulshan, Karachi',	0324789788);
INSERT INTO Staff(StaffID, Name, Job, Salary, Commission, Hiredate, Address, Phone) VALUES (002,'Luiz','Pharmacy assistant.',35000,150,'6/6/1999','House No PQR, Block 3, Sacramento, Karachi', 0321445588);
INSERT INTO Staff(StaffID, Name, Job, Salary, Hiredate, Address, Phone) VALUES (003,'Pique','Pharmacy clerk',25000,'2/3/2010','Street No ABC, Block 35, DHA, Karachi',	0300789788);
INSERT INTO Staff(StaffID, Name, Job, Salary, Commission, Hiredate, Address, Phone) VALUES (004,'Xavi','Pharmacy technician',50000,100,'3/4/2009','House No LMN, Block 90, KDA, Karachi',	0334089788);
INSERT INTO Staff(StaffID, Name, Job, Salary, Commission, Hiredate, Address, Phone) VALUES (005,'Iniesta','Pharmacy technician',200,1000,'6/25/2000','Street No WXY, Block 80, PIB, Karachi', 03747897188);
INSERT INTO Staff(StaffID, Name, Job, Salary, Commission, Hiredate, Address, Phone) VALUES (006,'Bale','Pharmacy assistant',40000,300,'12/31/2000','Street No KLM, Block 93, FB Area, Karachi', 0350897288);
INSERT INTO Staff(StaffID, Name, Job, Salary, Commission, Hiredate, Address, Phone) VALUES (007,'Lionel Messi','Pharmacist',12500,500,'2/28/2000','House No CDE, Block 93, Korangi 2, Karachi', 03217849788);
commit;
end;
/

begin
INSERT INTO Supplier(SUPPLIERID, COMPANYNAME, SUPPLIERNAME, ADDRESS, PHONE) VALUES (001,'Unity Foods Ltd','Nasir Khan Jan','Street No XYZ, Block 93, Gulshan, Karachi',03123325344);
INSERT INTO Supplier(SUPPLIERID, COMPANYNAME, SUPPLIERNAME, ADDRESS, PHONE) VALUES (002,'Hilton Pharma','Akram Bloch','34-C, Block, 6, P.E.C.H.S, Karachi',0324789788);
INSERT INTO Supplier(SUPPLIERID, COMPANYNAME, SUPPLIERNAME, ADDRESS, PHONE) VALUES (003,'RG Pharmaceutica','Dawood Ibrahim','F-95, Off, Hub River Road, S.I.T.E, Karachi',032004234534);
INSERT INTO Supplier(SUPPLIERID, COMPANYNAME, SUPPLIERNAME, ADDRESS, PHONE) VALUES (004,'Shield Corps. Ltd','Sultan Akbar','703, Progressive Square, Block 6, Nursery, Karachi',0321413432);
INSERT INTO Supplier(SUPPLIERID, COMPANYNAME, SUPPLIERNAME, ADDRESS, PHONE) VALUES (005,'Johnson & Johnson','Tughlug','A137, Gulshan 13-B Block 13 B Gulshan-e-Iqbal, Karachi',0308093455233);
INSERT INTO Supplier(SUPPLIERID, COMPANYNAME, SUPPLIERNAME, ADDRESS, PHONE) VALUES (006,'Oriflame','Babar','Suite 813, UNI PLAZA 8th Floor, I.I Chundrigar Rd,Karachi',03325213253);
INSERT INTO Supplier(SUPPLIERID, COMPANYNAME, SUPPLIERNAME, ADDRESS, PHONE) VALUES (007,'Edgewell Personal Care','Humayun','Pak Emp Co-Operative Housing Society Block 6 PECHS, Karachi',0307894324743);
INSERT INTO Supplier(SUPPLIERID, COMPANYNAME, SUPPLIERNAME, ADDRESS, PHONE) VALUES (008,'The Searle Company Ltd','Shahjahan','Mehran Town Sector 23 Korangi, Karachi',034235404523);
commit;
end;
/
