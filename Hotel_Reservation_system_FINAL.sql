USE [HotelReservationSystem]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Customer](
	[CustomerName] [nvarchar](40) NOT NULL,
	[CustomerId] [int] IDENTITY(100,1) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[CurrentAddress] [varchar](50) NULL,
	[Contact] [varchar](50) NOT NULL,
	[Indate] [datetime] NOT NULL,
	[outdate] [datetime] NULL,
	[CreatedDate] [date] NOT NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [c_customerId] UNIQUE NONCLUSTERED 
(
	[CustomerId] ASC,
	[CustomerName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Customer] ADD  DEFAULT (getdate()) FOR [Indate]
GO

ALTER TABLE [dbo].[Customer] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO


/****** Object:  Table [dbo].[Room]    Script Date: 4/23/2022 10:37:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Room](
	[RoomId] [int] IDENTITY(100,1) NOT NULL,
	[RoomNo] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[RoomType] [varchar](10) NOT NULL,
	[Descriptions] [varchar](50) NOT NULL,
	[Available] [bit] NOT NULL,
	[CheckIn] [datetime] NULL,
	[CheckOut] [datetime] NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [R_RoomId] UNIQUE NONCLUSTERED 
(
	[RoomId] ASC,
	[RoomNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Room] ADD  DEFAULT ((1)) FOR [Available]
GO


/****** Object:  Table [dbo].[Booking]    Script Date: 4/24/2022 12:23:23 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Booking](
	[BookingId] [int] IDENTITY(100,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[InvoiceId] [int] NULL,
	[BookingDate] [datetime] NOT NULL,
	[BookingContext] [varchar](50) NULL,
 CONSTRAINT [PK_booking] PRIMARY KEY CLUSTERED 
(
	[BookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK1_booking] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO

ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK1_booking]
GO

ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK3_booking] FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[Invoice] ([InvoiceId])
GO

ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK3_booking]
GO


/****** Object:  Table [dbo].[RoomReservation]    Script Date: 4/23/2022 10:43:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RoomReservation](
	[BookingId] [int] NULL,
	[RoomId] [int] NULL,
	[ReservationId] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReservationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[RoomReservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation] FOREIGN KEY([BookingId])
REFERENCES [dbo].[Booking] ([BookingId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[RoomReservation] CHECK CONSTRAINT [FK_Reservation]
GO

ALTER TABLE [dbo].[RoomReservation]  WITH CHECK ADD  CONSTRAINT [FK1_Reservation] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([RoomId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[RoomReservation] CHECK CONSTRAINT [FK1_Reservation]
GO

---CURD------
/*******************************************************************
********************************************************************
********************************************************************/
USE [HotelReservationSystem]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Customer](
	[CustomerName] [nvarchar](40) NOT NULL,
	[CustomerId] [int] IDENTITY(100,1) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[CurrentAddress] [varchar](50) NULL,
	[Contact] [varchar](50) NOT NULL,
	[Indate] [datetime] NOT NULL,
	[outdate] [datetime] NULL,
	[CreatedDate] [date] NOT NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [c_customerId] UNIQUE NONCLUSTERED 
(
	[CustomerId] ASC,
	[CustomerName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Customer] ADD  DEFAULT (getdate()) FOR [Indate]
GO

ALTER TABLE [dbo].[Customer] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO


USE [HotelReservationSystem]
GO

/****** Object:  Table [dbo].[Room]    Script Date: 4/23/2022 10:37:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Room](
	[RoomId] [int] IDENTITY(100,1) NOT NULL,
	[RoomNo] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[RoomType] [varchar](10) NOT NULL,
	[Descriptions] [varchar](50) NOT NULL,
	[Available] [bit] NOT NULL,
	[CheckIn] [datetime] NULL,
	[CheckOut] [datetime] NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [R_RoomId] UNIQUE NONCLUSTERED 
(
	[RoomId] ASC,
	[RoomNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Room] ADD  DEFAULT ((1)) FOR [Available]
GO


USE [HotelReservationSystem]
GO

USE [HotelReservationSystem]
GO

USE [HotelReservationSystem]
GO

/****** Object:  Table [dbo].[Booking]    Script Date: 4/24/2022 12:23:23 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Booking](
	[BookingId] [int] IDENTITY(100,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[InvoiceId] [int] NULL,
	[BookingDate] [datetime] NOT NULL,
	[BookingContext] [varchar](50) NULL,
 CONSTRAINT [PK_booking] PRIMARY KEY CLUSTERED 
(
	[BookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK1_booking] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO

ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK1_booking]
GO

ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK3_booking] FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[Invoice] ([InvoiceId])
GO

ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK3_booking]
GO


USE [HotelReservationSystem]
GO

/****** Object:  Table [dbo].[RoomReservation]    Script Date: 4/23/2022 10:43:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RoomReservation](
	[BookingId] [int] NULL,
	[RoomId] [int] NULL,
	[ReservationId] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReservationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[RoomReservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation] FOREIGN KEY([BookingId])
REFERENCES [dbo].[Booking] ([BookingId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[RoomReservation] CHECK CONSTRAINT [FK_Reservation]
GO

ALTER TABLE [dbo].[RoomReservation]  WITH CHECK ADD  CONSTRAINT [FK1_Reservation] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([RoomId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[RoomReservation] CHECK CONSTRAINT [FK1_Reservation]
Go

/************INVOICE & QUERY*****************************************
********************************************************
*****************************************
*******************************
***********************/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: Akash Adhikari
-- Create date: 2022-04-20
-- Description: Store Procedure to create invoice
-- =============================================
alter PROCEDURE [dbo].[SpInvoiceCreate] @jsonInvoiceCreate nvarchar(max)
AS
BEGIN TRANSACTION

SET NOCOUNT ON;
			BEGIN TRY
			-- Insert statements for procedure here
			INSERT INTO Invoice(
			CustomerId,
			InvoiceTotal
			)
			Select CustomerId, Sum(ro.Price)
			from Booking as b
							inner join RoomReservation as r on r.bookingId=b.bookingId
							inner join Room as ro on ro.RoomId=r.roomId
							where CustomerId= json_value(@jsonInvoiceCreate,'$.CustomerId') and InvoiceId is null
							group by CustomerId

			Declare @InvoiceId int;
							Set @InvoiceId=SCOPE_IDENTITY();
							update b set b.InvoiceId=@InvoiceId from Booking as b
							where CustomerId=JSON_VALUE(@jsonInvoiceCreate,'$.CustomerId') and InvoiceId is NULL


			UPDATE i SET
				i.InvoiceTotal=CASE
					WHEN COUNT(r.roomId)>=3 THEN 0.95*InvoiceTotal ELSE i.InvoiceTotal end
			FROM invoice AS i 
						INNER JOIN booking AS b ON b.invoiceId=i.invoiceId
						INNER JOIN RoomReservation AS rr ON rr.bookingId=b.bookingId
						INNER JOIN room AS r ON r.roomId=rr.roomId
						WHERE i.invoiceId=@InvoiceId

			UPDATE r SET
					r.checkOut=GETDATE(),r.Available=1
				FROM room AS r 
					INNER JOIN RoomReservation AS rr ON rr.roomId=b.roomId
					INNER JOIN Booking AS b ON b.bookingId =rr.bookingId
					INNER JOIN Invoice AS i ON i.invoiceId=b.invoiceId
					WHERE i.invoiceId=@InvoiceId



			COMMIT TRANSACTION
			END TRY
BEGIN CATCH 
	ROLLBACK TRANSACTION

END CATCH
GO

--	Select customer whose name start with the letter "A" or ends with the letter "S" but should have the letter "K".

	SELECT * FROM dbo.Customer Where (CustomerName LIKE 'A%' OR CustomerName LIKE '%s') AND CustomerName LIKE '%k%'

 --	Customers who do not have any invoice yet but used the room.



	select * from Customer as c
	INNER JOIN booking as b on b.CustomerId=c.CustomerId
	INNER JOIN RoomReservation AS rr ON rr.bookingId=b.bookingId
	INNER JOIN Room AS r ON r.roomId =rr.roomId
	WHERE b.invoiceId IS NULL AND r.checkIn IS NOT NULL

	--Number of rooms reserved on current date
	
	SELECT COUNT(rr.roomId) FROM RoomReservaion AS rr 
	INNER JOIN room AS r ON r.roomId=rr.roomId
	WHERE  r.checkIn IS NULL



 --	List of rooms which were reserved yesterday

	select r.* from RoomReservation AS rr
	INNER JOIN Room AS r ON r.RoomId = rr.RoomID
	INNER JOIN Booking AS b ON rr.BookingId = b.BookingId
	where convert(date, b.BookingDate) = DATEADD(day, -1, convert(date, GETDATE()))

---	Number of rooms and type of rooms available today

    select  RoomType  ,COUNT(RoomNo) as RoomAvailable from Room
	where Available =1
	group by RoomType

--7.	Change the price of rooms for Fridays by 15% of current price

			DECLARE @whichday as varchar(12)
			set @whichday = DATENAME(WEEKDAY, GETDATE())

			IF @whichday ='friday'
			BEGIN
			update Room
			set 
			Price =1.15*Price
			END
			ELSE 
	 
	
	
--8.	Remove customers who have not booked any room in current year

	

				Delete from Customer
				where CustomerId not in (
				select CustomerId from Customer as c
				inner join booking as b on b.CustomerId=c.CustomerId
				where year(b.BookingDate)=YEAR(getdate()))
				GO

/****************** 5.CREATE FUNCTION***********************************************
***********************************************************************************
*********************************************/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	AKASH ADHIKARI
-- Create date: 2022-04-23
-- Description:	Function to return total bill amount of the customer based on invoice created date.
-- =============================================
CREATE FUNCTION TABLEFUNCTION
(	
@Customer varchar(max),
@StartDate Date,
@EndDate Date
)
RETURNS TABLE 
AS
RETURN 
(

					Select SUM(InvoiceTotal)Total ,i.CustomerId  from Invoice  as i 
					inner join customer as c on c.CustomerId=i.CustomerId
					inner join string_split(@Customer,',') v on v.value=c.customerId
						where InvoiceDate between @StartDate and @EndDate
					Group by i.CustomerId
)
GO


/****************5.SP Billed amount of,Customer Details***************************
***********************************************************************
******************************************************/
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		AKASH ADHIKARI
-- Create date: 2022-04-23
-- Description:	Store procedure for customer Info Bill

-- =============================================
CREATE PROCEDURE [dbo].[spCustomerInfoBill] @jsonCustomerInfoBill nvarchar(max)
AS
BEGIN 
	SET NOCOUNT ON;
	Select * from Customer as c
	inner join (
	select SUM(i.invoiceTotal)Total ,c.CustomerId from Customer as c
	inner join Invoice as  i on c.CustomerId =i.CustomerId
	where c.CustomerId= CASE WHEN  json_value (@jsonCustomerInfoBill,'$.customerId')  IS NULL THEN c.customerId ELSE json_value (@jsonCustomerInfoBill,'$.customerId')  AND (convert(date,c.CreatedDate) between convert(date,json_value (@jsonCustomerInfoBill,'$.StatDate') )  and  convert (date,json_value(@jsonCustomerInfoBill,'$.EndDate')))
	group by c.CustomerId) cc on cc.CustomerId=c.CustomerId
END
GO



