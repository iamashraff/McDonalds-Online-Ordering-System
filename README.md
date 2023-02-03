# ![enter image description here](https://raw.githubusercontent.com/iamashraff/McDonalds-Online-Ordering-System/master/OnlineOrderWebApplication/Images/logo.svg?token=GHSAT0AAAAAAB5ZMXGIZC2NVXPHOAG5Y67EY6ZRRDA) McDonalds Online Ordering System
McDonalds Online Ordering System is a web-based food ordering system is based on McDelivery website where it is for customer to make a food delivery order. This project was developed by me for Web Application Development (ISB42403) course by using C# and ASP.NET at the Universiti Kuala Lumpur (UniKL MIIT).
This project consist two sides; ***Customer*** and ***Admin*** side. 
<br><br>
**Customer** <br>
- Add products to cart<br>
- Create order<br>
- Make payment<br>
- Review order and its history<br>
- View or edit their personal details such as name, address and phone number. 
<br><br>

**Admin** <br>
- Admin dashboard includes numbers of statistics such as total order, earnings, customers and products. <br>
- Manage customer's orders and details.<br>
<br>
This project was developed using C#, ASP.NET, some simple Javascript code to calculate total order in the cart and Bootstrap 5 CSS to beautify the user interface.<br>

## License
The source code has been published on GitHub Repository under  _MIT License_.  
Please visit  `LICENSE`  file to read the details about the license.

## Disclaimer
All images and logo used for the development of this project is based on McDonalds & McDelivery Malaysia website. Resources used are copyrighted of  GERBANG ALAF RESTAURANTS SDN BHD. This project are intended for RESEARCH & EDUCATIONAL PURPOSE ONLY and NOT FOR COMMERCIALIZATION USE.

## About the project
Languages :<br>
C#<br>
ASP<br>
Javascript<br>
<br>
Technology :<br>
Bootstrap 5 CSS<br>
Font Awesome 4<br>
Microsoft SQL<br>

## Database
![enter image description here](https://raw.githubusercontent.com/iamashraff/McDonalds-Online-Ordering-System/master/images/database.png?token=GHSAT0AAAAAAB5ZMXGI2TL6NRKH3R4V2KM6Y6ZSXXA)

## How to use ?
1. Download or Clone this repository
2. Open  `OnlineOrderWebApplication.sln` project file via Visual Studio 2019/2022
3. Create new `.mdf` connection string name `connMcd.mdf` in folder `OnlineOrderWebApplication\App_Data`
4.  Set connection string as follows :
`Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename="[YOUR_FOLDER_PATH]\App_Data\connMcd.mdf";Integrated Security=True;MultipleActiveResultSets=True;Connect Timeout=30;Application Name=EntityFramework`

	Replace `[YOUR_FOLDER_PATH]` with your local folder directory. For example, mine is `C:\Users\Ashraff\Projects\OnlineOrderWebApplication\`

5. Create database table as in [`CreateTableSQL.md`](https://github.com/iamashraff/McDonalds-Online-Ordering-System/blob/master/CreateTableSQL.md)

6. Insert into database table as in [`InsertSQL.md`](https://github.com/iamashraff/McDonalds-Online-Ordering-System/blob/master/InsertSQL.md) :

7. Create stored procedures as in [`StoredProceduresSQL.md`](https://github.com/iamashraff/McDonalds-Online-Ordering-System/blob/master/StoredProceduresSQL.md) 

8. Run the project 

	Note: Login as an admin by accessing the URL; `[URL]/Login.aspx` using the following credential
	>  Username: admin <br>
    	Password: 1234 


# USER INTERFACE


 **1. Main Page**
![enter image description here](https://raw.githubusercontent.com/iamashraff/McDonalds-Online-Ordering-System/master/images/index.png?token=GHSAT0AAAAAAB5ZMXGIG54MKGPYXMEZO6TOY6ZS2CQ)

<hr>

**2. Menu Page**
![enter image description here](https://raw.githubusercontent.com/iamashraff/McDonalds-Online-Ordering-System/master/images/Menu.aspx.png?token=GHSAT0AAAAAAB5ZMXGIMQQCCOE5WELWKXHOY6ZTDHA)
<hr>

**3. Login Page**

![Login.aspx](https://raw.githubusercontent.com/iamashraff/McDonalds-Online-Ordering-System/master/images/Login.aspx.png?token=GHSAT0AAAAAAB5ZMXGIZRPETHA6YQLMUCOAY6ZTBOA)

**3.1 Validation & Error Message**

![enter image description here](https://raw.githubusercontent.com/iamashraff/McDonalds-Online-Ordering-System/master/images/Login_RFV.png?token=GHSAT0AAAAAAB5ZMXGI4BFSCCEELEVPXAOEY6ZTJDQ)![enter image description here](https://raw.githubusercontent.com/iamashraff/McDonalds-Online-Ordering-System/master/images/Login_noAccount.png?token=GHSAT0AAAAAAB5ZMXGJTOHGWFVJVNB2US6KY6ZTNVQ)
<hr>

**4. Customer Side**

**4.1 Registration Page**
![enter image description here](https://raw.githubusercontent.com/iamashraff/McDonalds-Online-Ordering-System/master/images/Register.aspx.png)
<hr>

**4.2 Menu Page**

![enter image description here](https://raw.githubusercontent.com/iamashraff/McDonalds-Online-Ordering-System/master/images/Menu_Category.png)

4.2.1 Menu Category:
 - Burgers
 - Ayam Goreng & Nuggets
 - Bubur & Nasi Lemak
 - Drinks

4.2.1.1 Menu: Burgers
![enter image description here](https://raw.githubusercontent.com/iamashraff/McDonalds-Online-Ordering-System/master/images/Menu_1.png)

4.2.1.2 Menu: Ayam Goreng & Nuggets
![enter image description here](https://raw.githubusercontent.com/iamashraff/McDonalds-Online-Ordering-System/master/images/Menu_2.png)

4.2.1.3 Menu: Bubur & Nasi Lemak
![enter image description here](https://raw.githubusercontent.com/iamashraff/McDonalds-Online-Ordering-System/master/images/Menu_3.png)

4.2.1.4 Menu: Drinks
![enter image description here](https://raw.githubusercontent.com/iamashraff/McDonalds-Online-Ordering-System/master/images/Menu_4.png)

4.2.1.5 Different point-of-view (POV) for logged in and not logged in customers
![enter image description here](https://raw.githubusercontent.com/iamashraff/McDonalds-Online-Ordering-System/master/images/Menu_POV2.png)

<hr>
4.2.2 Add to Cart 

![enter image description here](https://raw.githubusercontent.com/iamashraff/McDonalds-Online-Ordering-System/master/images/Menu_AddItem.png)

<hr>

4.2.3 Cart List

![enter image description here](https://raw.githubusercontent.com/iamashraff/McDonalds-Online-Ordering-System/master/images/Menu_ListCart.png)

<hr>
4.2.4 Edit Cart Quantity

![enter image description here](https://raw.githubusercontent.com/iamashraff/McDonalds-Online-Ordering-System/master/images/Menu_EditQty.png)

<hr>

**4.3 Checkout**

![enter image description here](https://raw.githubusercontent.com/iamashraff/McDonalds-Online-Ordering-System/master/images/Checkout.png)

4.3.1 Selecting delivery time during checkout
![enter image description here](https://raw.githubusercontent.com/iamashraff/McDonalds-Online-Ordering-System/master/images/Checkout_Time2.png)

<hr>

**4.4 Order Summary**

![enter image description here](https://raw.githubusercontent.com/iamashraff/McDonalds-Online-Ordering-System/master/images/OrderSummary.png)

4.4.1 Viewing receipt

![enter image description here](https://raw.githubusercontent.com/iamashraff/McDonalds-Online-Ordering-System/master/images/OrderSummary_Receipt.png)

<hr>

**4.5 Account Management**
![enter image description here](https://raw.githubusercontent.com/iamashraff/McDonalds-Online-Ordering-System/master/images/MyAccount.png)

<hr>

**4.6 Order Management**

![enter image description here](https://raw.githubusercontent.com/iamashraff/McDonalds-Online-Ordering-System/master/images/MyOrder2.png)

4.6.1 Viewing order details

![enter image description here](https://raw.githubusercontent.com/iamashraff/McDonalds-Online-Ordering-System/master/images/MyOrder_Details.png)

<hr>

**5. Admin Side**

**5.1 Dashboard**
![enter image description here](https://raw.githubusercontent.com/iamashraff/McDonalds-Online-Ordering-System/master/images/Admin_Dashboard.png)

<hr>

**5.2 View Customer**

![enter image description here](https://raw.githubusercontent.com/iamashraff/McDonalds-Online-Ordering-System/master/images/Admin_ViewCustomer.png)

5.2.1 View Customer Details

![enter image description here](https://raw.githubusercontent.com/iamashraff/McDonalds-Online-Ordering-System/master/images/Admin_ViewCustomer_Details.png)

<hr>

**5.3 View Orders**

![enter image description here](https://raw.githubusercontent.com/iamashraff/McDonalds-Online-Ordering-System/master/images/Admin_ViewOrder.png)

5.3.1 View Order Details

![enter image description here](https://raw.githubusercontent.com/iamashraff/McDonalds-Online-Ordering-System/master/images/Admin_ViewOrder_Details.png)

<hr>

