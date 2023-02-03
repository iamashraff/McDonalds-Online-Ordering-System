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
