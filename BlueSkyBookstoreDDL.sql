/*
-----------------------------------------------------------------------------
Programmer's Name: Benjamin Wongmanee, Isaac Ross, Kacie Reburn, Brandon Twitty, Dylan Grampp
Course: CSCI 3020 Section Number: 803
E-mail Address: wongmanee@etsu.edu, rossim@etsu.edu, reburnk@etsu.edu, twittymb@etsu.edu, gramppd@etsu.edu
----------------------------------------------------------------------------
CSCI 3020 Project - BlueSky Bookstore
-----------------------------------------------------------------------------
Identifier dictionary -
Not Applicable
-----------------------------------------------------------------------------
Notes and Assumptions
-----------------------------------------------------------------------------
*/


/* ======================== TABLES ======================== */

/* ========== INVENTORY ========== */
DROP TABLE book CASCADE CONSTRAINTS;
CREATE TABLE book (
    Barcode NUMBER(10) NOT NULL,
    BookID_ISBN NUMBER(13) NOT NULL,
    Title VARCHAR2(50) NOT NULL,
    AuthorID NUMBER(5) NOT NULL,
    BackType VARCHAR2(10) NOT NULL,
    Quality VARCHAR2(10) NOT NULL,
    OnHand BOOLEAN NOT NULL,
    Price NUMBER(6,2) NOT NULL,
    Genre VARCHAR2(20),
    Description VARCHAR2(50) NOT NULL,
    Edition VARCHAR2(40),
    Volume VARCHAR2(5),
    ReviewID NUMBER(10),
    Warehouse# NUMBER(5) NOT NULL,
    Shelf# NUMBER(5) NOT NULL,
    Publisher NUMBER(10) NOT NULL,
    DealID NUMBER(10) NOT NULL,
    CONSTRAINT PK_Book PRIMARY KEY (Barcode, BookID_ISBN)
);

DROP TABLE author CASCADE CONSTRAINTS;
CREATE TABLE author (
    authorID NUMBER(10) NOT NULL,
    firstName VARCHAR2(30) NOT NULL,
    lastName VARCHAR2(30) NOT NULL,
    middleInitial VARCHAR2(1),
    publishedWorks NUMBER(4),
    CONSTRAINT PK_Author PRIMARY KEY (authorID)
);

DROP TABLE publisher CASCADE CONSTRAINTS;
CREATE TABLE publisher (
    publisherID	NUMBER(10)	NOT NULL,
    name VARCHAR2(75) NOT NULL,
    releaseDate	DATETIME,
    CONSTRAINT PK_publisher PRIMARY KEY (publisherID)	
);

DROP TABLE location CASCADE CONSTRAINTS;
CREATE TABLE location (
    warehouse# NUMBER(5) NOT NULL,
    shelf# NUMBER(5) NOT NULL,
    addressID NUMBER(10),
    CONSTRAINT PK_location PRIMARY KEY (warehouse#, shelf#)	
);

DROP TABLE deal CASCADE CONSTRAINTS;
CREATE TABLE deal (
    DealID NUMBER(10) NOT NULL, 
    DealTitle VARCHAR2(50),
    DealStartDate DATETIME NOT NULL,
    DealEndDate	DATETIME NOT NULL,
    DealDesc VARCHAR2(255),
    DealPercentOff NUMBER(3) NOT NULL,
    CONSTRAINT PK_Deal PRIMARY KEY (DealID)
);

DROP TABLE review CASCADE CONSTRAINTS;
CREATE TABLE review (
    ReviewID NUMBER(10) NOT NULL,
    BestSeller BOOLEAN,
    Rating NUMBER(2,1),
    Date DATETIME,
    CONSTRAINT PK_Review PRIMARY KEY (ReviewID)
);

DROP TABLE authorbook CASCADE CONSTRAINTS;
CREATE TABLE authorbook (
    AuthorBookID	NUMBER(10)	NOT NULL,
    AuthorID	NUMBER(10)	NOT NULL,
    BookID 	NUMBER(13)	NOT NULL,
    Barcode	NUMBER(10)	NOT NULL,
    NumAuthors	NUMBER(2)	NOT NULL,
    CONSTRAINT PK_AuthorBook PRIMARY KEY (AuthorBookID)
);

DROP TABLE userreview CASCADE CONSTRAINTS;
CREATE TABLE userreview (
    UserReviewID NUMBER(10) NOT NULL,
    Email VARCHAR2(50) NOT NULL,
    ReviewID NUMBER(10)	NOT NULL,
    UserComments BLOB,
    CONSTRAINT PK_UserReview PRIMARY KEY (UserReviewID)
);


/* ========== USER ========== */
DROP TABLE user CASCADE CONSTRAINTS;
CREATE TABLE user (
    Email VARCHAR2(50) NOT NULL,
    FirstName VARCHAR2(50),
    LastName VARCHAR2(50),
    PaymentMethodID NUMBER(10),
    TaxExemptID NUMBER(10),
    RegistrationDate DATE,
    LoginAuthID VARBINARY(80),
    IsAdmin BOOLEAN,
    PhoneNumber NUMBER(10),
    AddressID NUMBER(10),
    CONSTRAINT PK_User PRIMARY KEY (Email) 
);

DROP TABLE login CASCADE CONSTRAINTS;
CREATE TABLE login (
    Email VARCHAR2(50) NOT NULL,
    Password VARCHAR2(50),
    CONSTRAINT PK_Login PRIMARY KEY (Email, Username)
);

DROP TABLE demographic CASCADE CONSTRAINTS;
CREATE TABLE demographic (
    Email VARCHAR2(50) NOT NULL,
    GenderID NUMBER(10),
    BirthDate DATE,
    EthnicityID NUMBER(10),
    CONSTRAINT PK_Demographics PRIMARY KEY (Email)
);

DROP TABLE gendertypes CASCADE CONSTRAINTS;
CREATE TABLE gendertypes (
    GenderID NUMBER(10) NOT NULL,
    Male VARCHAR2(250) NOT NULL,
    Female VARCHAR2(250) NOT NULL,
    Other VARCHAR2(250) NOT NULL,
    CONSTRAINT PK_GenderTypes PRIMARY KEY (GenderID)
)

DROP TABLE ethnicitytypes CASCADE CONSTRAINTS;
CREATE TABLE ethnicitytypes (
    EtnicityID NUMBER(10) NOT NULL,
    Caucasian VARCHAR2(250) NOT NULL,
    AfricanAmerican VARCHAR2(250) NOT NULL,
    Asian VARCHAR2(250) NOT NULL,
    Hispanic VARCHAR2(250) NOT NULL,
    Indian VARCHAR2(250) NOT NULL,
    PacificIslander VARCHAR2(250) NOT NULL,
    Mixed VARCHAR2(250) NOT NULL,
    Other VARCHAR2(250) NOT NULL,
    CONSTRAINT PK_EthnicityTypes PRIMARY KEY (EthnicityID)
)

DROP TABLE useraddress CASCADE CONSTRAINTS;
CREATE TABLE useraddress (
    Email VARCHAR2(50) NOT NULL,
    AddressID NUMBER(10) NOT NULL,
    CONSTRAINT PK_UserAddress PRIMARY KEY (Email, AddressID)
);

DROP TABLE address CASCADE CONSTRAINTS;
CREATE TABLE address (
    AddressID NUMBER(10) NOT NULL,
    AddressTypeID NUMBER(10) NOT NULL,
    StreetLine1 VARCHAR2(50) NOT NULL,
    StreetLine2 VARCHAR2(50),
    StreetNumber NUMBER(10),
    ApartmentNum VARCHAR2(9),
    ZIP NUMBER(5) NOT NULL,
    City VARCHAR2(50) NOT NULL,
    State VARCHAR2(2),
    Country VARCHAR2(50) NOT NULL,
    CONSTRAINT PK_Address PRIMARY KEY (AddressID)
);

DROP TABLE addresstype CASCADE CONSTRAINTS;
CREATE TABLE addresstype (
    AddressTypeID VARCHAR2(250) NOT NULL,
    Billing	VARCHAR2(250) NOT NULL,
    Shipping VARCHAR2(250) NOT NULL,
    CONSTRAINT PK_AddressType PRIMARY KEY (AddressTypeID)
);

DROP TABLE paymentmethod CASCADE CONSTRAINTS;
CREATE TABLE paymentmethod (
    PaymentMethodID	NUMBER(10) NOT NULL,
    Email VARCHAR2(50) NOT NULL,
    PaymentType	VARCHAR2(20) NOT NULL,
    CardNumber NUMBER(16) NOT NULL,
    CVV	NUMBER(3) NOT NULL,
    Cardholder VARCHAR2(24) NOT NULL,
    ExpirationDate DATE NOT NULL,
    BillingAddressID NUMBER(10) NOT NULL,
    CONSTRAINT PK_PaymentMethod PRIMARY KEY (PaymentMethodID, Email)
);

DROP TABLE taxexempt CASCADE CONSTRAINTS;
CREATE TABLE taxexempt (
    TaxExemptID	NUMBER(10) NOT NULL,
    StateIssued	VARCHAR2(2) NOT NULL,
    OrganizationName VARCHAR2(20) NOT NULL,
    CONSTRAINT PK_TaxExempt PRIMARY KEY (TaxExemptID)
);


/* ========== TRANSACTION ========== */
DROP TABLE bookorder CASCADE CONSTRAINTS;
CREATE TABLE bookorder (
    OrderID NUMBER(10) NOT NULL,
    BookID_ISBN NUMBER(13) NOT NULL,
    Quantity NUMBER(3) NOT NULL,
    CONSTRAINT PK_BookOrder PRIMARY KEY (OrderID),
);

DROP TABLE coupon CASCADE CONSTRAINTS;
CREATE TABLE coupon (
    CouponID VARCHAR2(10) NOT NULL,
    DiscountPercent	DECIMAL(5,2),	
    ExpirationDate DATE,
    CONSTRAINT PK_Coupon PRIMARY KEY (CouponID)
);

DROP TABLE order CASCADE CONSTRAINTS;
CREATE TABLE order (
    OrderID NUMBER(10) NOT NULL,
    Email VARCHAR2(50) NOT NULL,
    Total NUMBER(10) NOT NULL,
    AddressID NUMBER(10) NOT NULL,
    TaxExemptID NUMBER(10),
    CouponID VARCHAR2(10),
    TrackingNumber NUMBER(12) NOT NULL,
    OrderDate DATE,
    CONSTRAINT PK_Order PRIMARY KEY (OrderID),
);

DROP TABLE shipping CASCADE CONSTRAINTS;
CREATE TABLE shipping (
    TrackingNumber NUMBER(22) NOT NULL,
    AddressID NUMBER(10) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    International BOOLEAN NOT NULL,
    ShippingDate DATE,
    CONSTRAINT PK_Shipping PRIMARY KEY (TrackingNumber),
);




/* ======================== FOREIGN KEY CONSTRAINTS ======================== */
ALTER TABLE address ADD (
    CONSTRAINT FK_Address_AddressTypeID FOREIGN KEY (AddressTypeID)
    REFERENCES AddressType(AddressTypeID)
);

ALTER TABLE location
    ADD (CONSTRAINT FK_Location_AddressID FOREIGN KEY (AddressID) 
    REFERENCES address(AddressID)
);

ALTER TABLE book ADD (
    CONSTRAINT FK_Book_AuthorID FOREIGN KEY (AuthorID)
    REFERENCES author(AuthorID), 
    CONSTRAINT FK_Book_ReviewID FOREIGN KEY (ReviewID)
    REFERENCES review(ReviewID), 
    CONSTRAINT FK_Book_Location FOREIGN KEY (Warehouse#, Shelf#)
    REFERENCES location(Warehouse#, Shelf#), 
    CONSTRAINT FK_Book_PublisherID FOREIGN KEY (PublisherID)
    REFERENCES publisher(PublisherID), 
    CONSTRAINT FK_Book_DealID FOREIGN KEY (DelaID)
    REFERENCES deal(DealID)
);

ALTER TABLE authorbook
    ADD (CONSTRAINT FK_AuthorBook_AuthorID FOREIGN KEY (AuthorID) 
    REFERENCES author(AuthorID),
    CONSTRAINT FK_AuthorBook_BookID FOREIGN KEY (BookID, Barcode) 
    REFERENCES book(BookID_ISBN, Barcode)
);

ALTER TABLE user ADD (
    CONSTRAINT FK_User_TaxExemptID FOREIGN KEY (TaxExemptID)
    REFERENCES TaxExempt(TaxExemptID),
    CONSTRAINT FK_User_AddressID FOREIGN KEY (AddressID)
    REFERENCES address(AddressID)
);

ALTER TABLE userreview 
    ADD (CONSTRAINT FK_UserReview_Email FOREIGN KEY (Email) 
    REFERENCES user(Email), 
    CONSTRAINT FK_UserReview_ReviewID FOREIGN KEY (ReviewID) 
    REFERENCES review(ReviewID)
);

ALTER TABLE login ADD (
    CONSTRAINT FK_Login_Email FOREIGN KEY (Email)
    REFERENCES User(Email)
);

ALTER TABLE demographic ADD (
    CONSTRAINT FK_Demographic_Email FOREIGN KEY (Email)
    REFERENCES User(Email)
    CONSTRAINT FK_Demographic_GenderID FOREIGN KEY (GenderID)
    REFERENCES GenderTypes(GenderID),
    CONSTRAINT FK_Demographic_EthnicityID FOREIGN KEY (EthnicityID)
    REFERENCES EthnicityTypes(EthnicityID)
);

ALTER TABLE useraddress ADD (
    CONSTRAINT FK_UserAddress_Email FOREIGN KEY (Email)
    REFERENCES User(Email),
    CONSTRAINT FK_UserAddress_AddressID FOREIGN KEY (AddressID)
    REFERENCES Address(AddressID)
);

ALTER TABLE paymentmethod ADD (
    CONSTRAINT FK_PaymentMethod_Email FOREIGN KEY (Email)
    REFERENCES User(Email),
    CONSTRAINT FK_PaymentMethod_BillingAddressID FOREIGN KEY (BillingAddressID)
    REFERENCES Address(AddressID)
);

ALTER TABLE user ADD (
    CONSTRAINT FK_User_PaymentMethodID FOREIGN KEY (PaymentMethodID)
    REFERENCES PaymentMethod(PaymentmethodID),
);

ALTER bookorder ADD (
    CONSTRAINT FK_BookOrder_BookID_ISBN FOREIGN KEY (BookID_ISBN)
    REFERENCES Book(BookID_ISBN)
)

ALTER TABLE order ADD (
    CONSTRAINT FK_Order_Email FOREIGN KEY (Email)
    REFERENCES User(Email),
    CONSTRAINT FK_Order_AddressID FOREIGN KEY (AddressID)
    REFERENCES Address(AddressID),
    CONSTRAINT FK_Order_TaxExemptID FOREIGN KEY (TaxExemptID)
    REFERENCES TaxExempt(TaxExemptID),
    CONSTRAINT FK_Order_CouponID FOREIGN KEY (CouponID)
    REFERENCES Coupon(CouponID),
    CONSTRAINT FK_Order_TrackingNumber FOREIGN KEY (TrackingNumber)
    REFERENCES Shipping(TrackingNumber)
);

ALTER TABLE shipping ADD (
    CONSTRAINT FK_shipping_AddressID FOREIGN KEY (AddressID)
    REFERENCES Address(AddressID),
    CONSTRAINT FK_shipping_Email FOREIGN KEY (Email)
    REFERENCES User(Email)
);