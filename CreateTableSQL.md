## CREATE TABLE

  **tblAddress** <br>
`CREATE  TABLE [dbo].[tblAddress]  (
[addressID] INT  IDENTITY (1, 1)  NOT  NULL,
[custID] INT  NULL,
[houseNo] VARCHAR (50)  NOT  NULL,
[streetName] VARCHAR (100)  NOT  NULL,
[city] VARCHAR (50)  NULL,
[postcode] VARCHAR (50)  NULL,
[state] VARCHAR (50)  NULL,
PRIMARY  KEY  CLUSTERED ([addressID] ASC),
CONSTRAINT [FK_Customer_Address] FOREIGN  KEY ([custID])  REFERENCES [dbo].[tblCustomer]  ([custID])
);`
<br>
	
**tblAdmin** <br>
`CREATE  TABLE [dbo].[tblAdmin]  (
[Id] INT  IDENTITY (1, 1)  NOT  NULL,
[adminUser] VARCHAR (50)  NULL,
[adminPass] VARCHAR (200)  NULL,
[adminName] VARCHAR (50)  NULL,
[isAdmin] VARCHAR (50)  NULL,
PRIMARY  KEY  CLUSTERED ([Id] ASC)
);`
<br>

**tblCart** <br>
`CREATE  TABLE [dbo].[tblCart]  (
[cartID] INT  IDENTITY (1, 1)  NOT  NULL,
[prodID] INT  NULL,
[custID] INT  NULL,
[prodQty] INT  NULL,
PRIMARY  KEY  CLUSTERED ([cartID] ASC),
CONSTRAINT [FK_Product_Cart] FOREIGN  KEY ([prodID])  REFERENCES [dbo].[tblProduct]  ([prodID]),
CONSTRAINT [FK_Customer_Cart] FOREIGN  KEY ([custID])  REFERENCES [dbo].[tblCustomer]  ([custID])
);`
<br>

**tblCategory** <br>
`CREATE  TABLE [dbo].[tblCategory]  (
[catID] INT  IDENTITY (1, 1)  NOT  NULL,
[catName] VARCHAR (50)  NULL,
[catDesc] VARCHAR (150)  NULL,
PRIMARY  KEY  CLUSTERED ([catID] ASC)
);`
<br>

**tblCustomer** <br>
	`CREATE  TABLE [dbo].[tblCustomer]  (
[custID] INT  IDENTITY (1, 1)  NOT  NULL,
[custUsername] VARCHAR (50)  NOT  NULL,
[custPass] VARCHAR (150)  NOT  NULL,
[custEmail] VARCHAR (50)  NOT  NULL,
[custFirstName] VARCHAR (50)  NULL,
[custLastName] VARCHAR (50)  NULL,
[custPhone] VARCHAR (15)  NULL,
PRIMARY  KEY  CLUSTERED ([custID] ASC)
);`
<br>

**tblOrder** <br>
`CREATE  TABLE [dbo].[tblOrder]  (
[orderID] INT  IDENTITY (1, 1)  NOT  NULL,
[custID] INT  NOT  NULL,
[orderDate] VARCHAR (50)  NULL,
[orderNote] VARCHAR (100)  NULL,
[deliveryDate] VARCHAR (50)  NULL,
[deliveryTime] VARCHAR (50)  NULL,
[deliveryAddress] VARCHAR (250)  NULL,
[paymentType] VARCHAR (50)  NULL,
[dateCreated] DATE  NULL,
PRIMARY  KEY  CLUSTERED ([orderID] ASC),
CONSTRAINT [FK_Order_Customer] FOREIGN  KEY ([custID])  REFERENCES [dbo].[tblCustomer]  ([custID])
);` 
<br>

**tblOrderDetails** <br>
`CREATE  TABLE [dbo].[tblOrderDetails]  (
[ID] INT  IDENTITY (1, 1)  NOT  NULL,
[orderID] INT  NOT  NULL,
[prodID] INT  NULL,
[prodQty] INT  NULL,
PRIMARY  KEY  CLUSTERED ([ID] ASC),
CONSTRAINT [FK_OrderDetails] FOREIGN  KEY ([orderID])  REFERENCES [dbo].[tblOrder]  ([orderID]),
CONSTRAINT [FK_OrderDetails_Product] FOREIGN  KEY ([prodID])  REFERENCES [dbo].[tblProduct]  ([prodID])
);` 
<br>

**tblProduct** <br>
`CREATE  TABLE [dbo].[tblProduct]  (
[prodID] INT  IDENTITY (1, 1)  NOT  NULL,
[catID] INT  NOT  NULL,
[prodName] VARCHAR (50)  NULL,
[prodDesc] VARCHAR (150)  NULL,
[prodPrice] FLOAT (53)  NULL,
[prodImg] VARCHAR (50)  NULL,
PRIMARY  KEY  CLUSTERED ([prodID] ASC),
CONSTRAINT [FK_Product_Category] FOREIGN  KEY ([catID])  REFERENCES [dbo].[tblCategory]  ([catID])
);`
<br>
