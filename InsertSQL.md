**tblAdmin** <br>
	`SET  IDENTITY_INSERT [dbo].[tblAdmin] ON
INSERT  INTO [dbo].[tblAdmin]  ([Id], [adminUser], [adminPass], [adminName], [isAdmin])  VALUES (1,  N'admin',  N'10000:K68W33T2y87umNciu8kArwv8JnywwiND:dVCQ15Uh2YnRaQ67g4gfJembHoo=',  N'Admin',  NULL)
SET  IDENTITY_INSERT [dbo].[tblAdmin] OFF`
<br>

**tblCategory** <br>
	`SET  IDENTITY_INSERT [dbo].[tblCategory] ON
INSERT  INTO [dbo].[tblCategory]  ([catID], [catName], [catDesc])  VALUES (1,  N'Burgers',  N'')
INSERT  INTO [dbo].[tblCategory]  ([catID], [catName], [catDesc])  VALUES (2,  N'Ayam Goreng & Nuggets',  NULL)
INSERT  INTO [dbo].[tblCategory]  ([catID], [catName], [catDesc])  VALUES (3,  N'Bubur & Nasi Lemak',  NULL)
INSERT  INTO [dbo].[tblCategory]  ([catID], [catName], [catDesc])  VALUES (5,  N'Drinks',  NULL)
SET  IDENTITY_INSERT [dbo].[tblCategory] OFF`
<br>

**tblProduct** <br>
	`SET IDENTITY_INSERT [dbo].[tblProduct] ON
INSERT INTO [dbo].[tblProduct] ([prodID], [catID], [prodName], [prodDesc], [prodPrice], [prodImg]) VALUES (1, 1, N'Samurai Beef Burger', NULL, 13.21, N'Samurai_Beef_Burger')
INSERT INTO [dbo].[tblProduct] ([prodID], [catID], [prodName], [prodDesc], [prodPrice], [prodImg]) VALUES (2, 1, N'Double Samurai Beef Burger', NULL, 17.21, N'Double_Samurai_Beef_Burger')
INSERT INTO [dbo].[tblProduct] ([prodID], [catID], [prodName], [prodDesc], [prodPrice], [prodImg]) VALUES (3, 1, N'Samurai Chicken Burger', NULL, 12.74, N'Samurai_Chicken_Burger')
INSERT INTO [dbo].[tblProduct] ([prodID], [catID], [prodName], [prodDesc], [prodPrice], [prodImg]) VALUES (4, 1, N'Double Samurai Chicken Burger', NULL, 16.51, N'Double_Samurai_Chicken_Burger')
INSERT INTO [dbo].[tblProduct] ([prodID], [catID], [prodName], [prodDesc], [prodPrice], [prodImg]) VALUES (8, 1, N'McChicken®', NULL, 8.71, N'McChicken')
INSERT INTO [dbo].[tblProduct] ([prodID], [catID], [prodName], [prodDesc], [prodPrice], [prodImg]) VALUES (9, 1, N'Double McChicken®', NULL, 12.5, N'Double_McChicken')
INSERT INTO [dbo].[tblProduct] ([prodID], [catID], [prodName], [prodDesc], [prodPrice], [prodImg]) VALUES (10, 1, N'McChicken® with Egg', NULL, 10.2, N'McChicken_with_Egg')
INSERT INTO [dbo].[tblProduct] ([prodID], [catID], [prodName], [prodDesc], [prodPrice], [prodImg]) VALUES (12, 1, N'Double McChicken® with Egg', NULL, 13.82, N'Double_McChicken_with_Egg')
INSERT INTO [dbo].[tblProduct] ([prodID], [catID], [prodName], [prodDesc], [prodPrice], [prodImg]) VALUES (13, 2, N'Ayam Goreng McD™ (5pcs)', NULL, 31.5, N'Ayam_Goreng_McD_5pcs')
INSERT INTO [dbo].[tblProduct] ([prodID], [catID], [prodName], [prodDesc], [prodPrice], [prodImg]) VALUES (14, 2, N'Ayam Goreng McD™ (9pcs)', NULL, 51.24, N'Ayam_Goreng_McD_9pcs')
INSERT INTO [dbo].[tblProduct] ([prodID], [catID], [prodName], [prodDesc], [prodPrice], [prodImg]) VALUES (15, 2, N'Ayam Goreng McD™ Regular (2pcs)', NULL, 12.5, N'Ayam_Goreng_McD_Regular_2pcs')
INSERT INTO [dbo].[tblProduct] ([prodID], [catID], [prodName], [prodDesc], [prodPrice], [prodImg]) VALUES (16, 2, N'Ayam Goreng McD™ Spicy (2pcs)', NULL, 12.5, N'Ayam_Goreng_McD_Spicy_2pcs')
INSERT INTO [dbo].[tblProduct] ([prodID], [catID], [prodName], [prodDesc], [prodPrice], [prodImg]) VALUES (17, 2, N'Ayam Goreng McD™ Spicy (3pcs)', NULL, 16.5, N'Ayam_Goreng_McD_Spicy_3pcs')
INSERT INTO [dbo].[tblProduct] ([prodID], [catID], [prodName], [prodDesc], [prodPrice], [prodImg]) VALUES (19, 2, N'Ayam Goreng McD™ Regular (3pcs)', NULL, 16.5, N'Ayam_Goreng_McD_Regular_3pcs')
INSERT INTO [dbo].[tblProduct] ([prodID], [catID], [prodName], [prodDesc], [prodPrice], [prodImg]) VALUES (20, 2, N'6pcs Chicken McNuggets®', NULL, 9.8, N'6pcs_Chicken_McNuggets')
INSERT INTO [dbo].[tblProduct] ([prodID], [catID], [prodName], [prodDesc], [prodPrice], [prodImg]) VALUES (22, 2, N'9pcs Chicken McNuggets®', NULL, 13.5, N'9pcs_Chicken_McNuggets')
INSERT INTO [dbo].[tblProduct] ([prodID], [catID], [prodName], [prodDesc], [prodPrice], [prodImg]) VALUES (24, 2, N'20pcs Chicken McNuggets®', NULL, 25.85, N'20pcs_Chicken_McNuggets')
INSERT INTO [dbo].[tblProduct] ([prodID], [catID], [prodName], [prodDesc], [prodPrice], [prodImg]) VALUES (25, 3, N'Nasi Lemak McD™', NULL, 5.8, N'Nasi_Lemak_McD')
INSERT INTO [dbo].[tblProduct] ([prodID], [catID], [prodName], [prodDesc], [prodPrice], [prodImg]) VALUES (26, 3, N'Nasi Lemak McD Set A', NULL, 15.23, N'Nasi_Lemak_McD_Set_A')
INSERT INTO [dbo].[tblProduct] ([prodID], [catID], [prodName], [prodDesc], [prodPrice], [prodImg]) VALUES (27, 3, N'Nasi Lemak McD Set B', NULL, 17.81, N'Nasi_Lemak_McD_Set_B')
INSERT INTO [dbo].[tblProduct] ([prodID], [catID], [prodName], [prodDesc], [prodPrice], [prodImg]) VALUES (28, 3, N'Nasi Lemak McD™ + Spicy Chicken McDeluxe Cutlet', NULL, 16.52, N'Nasi_Lemak_McD_Spicy_Chicken_McDeluxe_Cutlet')
INSERT INTO [dbo].[tblProduct] ([prodID], [catID], [prodName], [prodDesc], [prodPrice], [prodImg]) VALUES (29, 3, N'Nasi Lemak McD™ + GCB Cutlet', NULL, 16.47, N'Nasi_Lemak_McD_GCB_Cutlet')
INSERT INTO [dbo].[tblProduct] ([prodID], [catID], [prodName], [prodDesc], [prodPrice], [prodImg]) VALUES (31, 3, N'Bubur Ayam McD™', NULL, 6.83, N'Bubur_Ayam_McD')
INSERT INTO [dbo].[tblProduct] ([prodID], [catID], [prodName], [prodDesc], [prodPrice], [prodImg]) VALUES (32, 5, N'100 Plus', NULL, 4.56, N'100_Plus')
INSERT INTO [dbo].[tblProduct] ([prodID], [catID], [prodName], [prodDesc], [prodPrice], [prodImg]) VALUES (33, 5, N'Coca-Cola®', NULL, 4.56, N'Coca_Cola')
INSERT INTO [dbo].[tblProduct] ([prodID], [catID], [prodName], [prodDesc], [prodPrice], [prodImg]) VALUES (34, 5, N'Sprite®', NULL, 4.56, N'Sprite')
INSERT INTO [dbo].[tblProduct] ([prodID], [catID], [prodName], [prodDesc], [prodPrice], [prodImg]) VALUES (35, 5, N'Iced Lemon Tea', NULL, 6.55, N'Iced_Lemon_Tea')
INSERT INTO [dbo].[tblProduct] ([prodID], [catID], [prodName], [prodDesc], [prodPrice], [prodImg]) VALUES (36, 5, N'Minute Maid® Orange Juice', NULL, 6.82, N'Minute_Maid_Orange_Juice')
INSERT INTO [dbo].[tblProduct] ([prodID], [catID], [prodName], [prodDesc], [prodPrice], [prodImg]) VALUES (37, 5, N'Drinking water', NULL, 4.39, N'Drinking_water')
INSERT INTO [dbo].[tblProduct] ([prodID], [catID], [prodName], [prodDesc], [prodPrice], [prodImg]) VALUES (38, 5, N'MILO®', NULL, 7.53, N'MILO')
INSERT INTO [dbo].[tblProduct] ([prodID], [catID], [prodName], [prodDesc], [prodPrice], [prodImg]) VALUES (39, 5, N'Hot MILO®', NULL, 4.85, N'Hot_MILO')
INSERT INTO [dbo].[tblProduct] ([prodID], [catID], [prodName], [prodDesc], [prodPrice], [prodImg]) VALUES (40, 5, N'Hot Teh Tarik', NULL, 4.98, N'Hot_Teh_Tarik')
INSERT INTO [dbo].[tblProduct] ([prodID], [catID], [prodName], [prodDesc], [prodPrice], [prodImg]) VALUES (41, 5, N'Hot Tea', NULL, 4.98, N'Hot_Tea')
SET IDENTITY_INSERT [dbo].[tblProduct] OFF`
<br>
