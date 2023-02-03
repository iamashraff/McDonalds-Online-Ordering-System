**spAddItems** <br>
`CREATE PROCEDURE spAddItems2
	@productid int,
	@customerid int,
	@productqty int
AS
INSERT INTO tblCart VALUES (@productid, @customerid, @productqty)
` <br>

**spAddOrderDetails** <br>
`CREATE PROCEDURE [dbo].spAddOrderDetails
	@orderID int,
	@prodID int,
	@prodQty int
AS
	INSERT INTO tblOrderDetails (orderID, prodID, prodQty)
	VALUES (@orderID, @prodID, @prodQty);
` <br>

**spDeleteCartOrderSuccess** <br>
`CREATE PROCEDURE [dbo].spDeleteCartOrderSuccess
	@custID int
AS
DELETE FROM tblCart WHERE custID = @custID
` <br>

**spDeleteFromCart** <br>
`CREATE PROCEDURE spDeleteFromCart
	@productID int
AS
	DELETE FROM tblCart
       WHERE prodID = @productID;
` <br>

**spGetAddress** <br>
`CREATE PROCEDURE [dbo].spGetAddress
	@custID int
AS
SELECT * FROM tblAddress WHERE custID = @custID
` <br>

**spGetItemQty** <br>
`CREATE PROCEDURE [dbo].spGetItemQty
	@custID int
AS
SELECT COUNT(prodID) FROM tblCart
WHERE custID = @custID
` <br>

**spGetItems** <br>
`CREATE PROCEDURE spGetItems
	@custID int
AS
SELECT tblProduct.prodName, tblProduct.prodPrice, tblCart.prodQty, tblProduct.prodImg, tblCart.prodID,
tblProduct.prodPrice * tblCart.prodQty AS SubTotal
FROM tblCart
INNER JOIN tblProduct ON tblProduct.prodID = tblCart.prodID
WHERE tblCart.custID = @custID
` <br>

**spGetListOrderSuccess** <br>
`CREATE PROCEDURE [dbo].spGetListOrderSuccess
	@orderID int
AS
	SELECT tblProduct.prodName, tblProduct.prodPrice, tblProduct.prodImg, tblOrderDetails.prodQty, tblProduct.prodPrice * tblOrderDetails.prodQty AS SubTotal   FROM tblOrder
INNER JOIN tblOrderDetails ON tblOrderDetails.orderID = tblOrder.orderID
INNER JOIN tblProduct ON tblProduct.prodID = tblOrderDetails.prodID
WHERE tblOrder.orderID = @orderID
RETURN 0
` <br>

**spGetSubTotalAmount** <br>
`CREATE PROCEDURE spGetSubTotalAmount
	@customerid int
AS
IF EXISTS (SELECT SUM(tblProduct.prodPrice * tblCart.prodQty) AS SubTotal
FROM tblCart
INNER JOIN tblProduct ON tblProduct.prodID = tblCart.prodID WHERE tblCart.custID = @customerid)
	SELECT SUM(tblProduct.prodPrice * tblCart.prodQty) AS SubTotal
	FROM tblCart
	INNER JOIN tblProduct ON tblProduct.prodID = tblCart.prodID
	WHERE tblCart.custID = @customerid
ELSE
	RETURN 0
` <br>

**spUpdateItemFromCart** <br>
`CREATE PROCEDURE [dbo].spUpdateItemFromCart
	@productqty int,
	@productid int,
	@customerid int
AS
UPDATE tblCart SET prodQty = @productqty
	WHERE prodID = @productid AND custID = @customerid
` <br>

