--IMPLEMENTATION
CREATE DATABASE [RMS] 
GO
 
USE [RMS] 
GO
 
CREATE TABLE [dbo].[Table_type]( 
[table_type_ID] [int] IDENTITY(1,1) NOT NULL, 
[table_type_name] [varchar](30) NOT NULL, 
CONSTRAINT PK_TableType PRIMARY KEY (table_type_ID) 
) 
 
CREATE TABLE [dbo].[Table_status]( 
[table_status_ID] [int] IDENTITY(1,1) NOT NULL, 
[table_status_name] [varchar](30) NOT NULL, 
CONSTRAINT PK_TableStatus PRIMARY KEY (table_status_ID) 
) 
 
CREATE TABLE [dbo].[TableofRestaurant]( 
[table_ID] [int] IDENTITY(1,1) NOT NULL, 
[table_type] [int], 
[table_status] [int], 
[table_capacity] [int],
CONSTRAINT PK_TableofRestaurant PRIMARY KEY (table_ID), 
CONSTRAINT FK_TableofRestaurant_TableType FOREIGN KEY (table_type) 
        REFERENCES [Table_type] (table_type_ID), 
CONSTRAINT FK_TableofRestaurant_TableStatus FOREIGN KEY (table_status) 
        REFERENCES [Table_status] (table_status_ID) 
) 
 
CREATE TABLE [dbo].[Country]( 
[country_ID] [int] IDENTITY(1,1) NOT NULL, 
[country_name] [varchar](150) NOT NULL, 
CONSTRAINT PK_Country PRIMARY KEY (country_ID) 
) 
 
CREATE TABLE [dbo].[City]( 
[city_ID] [int] IDENTITY(1,1) NOT NULL, 
[city_name] [varchar](30) NOT NULL, 
[city_country_ID] [int], 
CONSTRAINT PK_City PRIMARY KEY (city_ID), 
CONSTRAINT FK_City_Country FOREIGN KEY (city_country_ID) 
        REFERENCES [Country] (country_ID), 
) 
 
CREATE TABLE [dbo].[Customer]( 
[customer_ID] [int] IDENTITY(1,1) NOT NULL, 
[customer_fname] [varchar](30), 
[customer_lname] [varchar](30), 
[customer_add] [varchar](30), 
[customer_city_ID] [int], 
[customer_phone] [varchar](30), 
[customer_email] [varchar](30), 
CONSTRAINT PK_Customer PRIMARY KEY (customer_ID), 
CONSTRAINT FK_Customer_City FOREIGN KEY (customer_city_ID) 
        REFERENCES [City] (city_ID), 
) 
 
CREATE TABLE [dbo].[Reservation]( 
[reservation_ID] [int] IDENTITY(1,1) NOT NULL, 
[reservation_customer_ID] [int], 
[reservation_table_ID] [int], 
[reservation_date] [date], 
[total_tables_reserved] [int], 
CONSTRAINT PK_Reservation PRIMARY KEY (reservation_ID), 
CONSTRAINT FK_Reservation_Table FOREIGN KEY (reservation_table_ID) 
        REFERENCES [TableofRestaurant] (table_ID), 
CONSTRAINT FK_Reservation_Customer FOREIGN KEY (reservation_customer_ID)         REFERENCES [Customer] (customer_ID), 
) 
 
CREATE TABLE [dbo].[Login]( 
[login_ID] [int] IDENTITY(1,1) NOT NULL, 
[login_email] [varchar] NOT NULL, 
[login_password] [varchar] NOT NULL, 
CONSTRAINT PK_Login PRIMARY KEY (login_ID), 
CONSTRAINT Login_Email_Unqiue UNIQUE (login_email) 
) 
 
CREATE TABLE [dbo].[Employee]( 
[employee_ID] [int] IDENTITY(1,1) NOT NULL, 
[employee_fname] [varchar](100), 
[employee_lname] [varchar](100), 
[employee_add] [varchar](100), 
[employee_city_ID] [int], 
[employee_phone] [varchar](30), 
[employee_login_id] [int], 
[employee_job_id] [int], 
CONSTRAINT PK_Employee PRIMARY KEY (employee_ID), 
CONSTRAINT FK_Employee_Login FOREIGN KEY (employee_login_ID) 
REFERENCES [Login] (login_ID), 
CONSTRAINT FK_Employee_City FOREIGN KEY (employee_city_ID) 
	 	REFERENCES [City] (City_ID), 
) 
 
 
CREATE TABLE [dbo].[Area]( 
[area_ID] [int] IDENTITY(1,1) NOT NULL, 
[area_name] [varchar] , 
[area_employee_id] [int], 
CONSTRAINT PK_Area PRIMARY KEY (area_ID), 
CONSTRAINT FK_Area_Employee FOREIGN KEY (area_employee_id) 
        REFERENCES [Employee] (employee_ID), 
) 
 
CREATE TABLE [dbo].[Job]( 
[job_ID] [int] IDENTITY(1,1) NOT NULL, 
[job_name] [varchar] , 
[job_wage] [decimal](10,2), 
[job_area_id] [int], 
CONSTRAINT PK_Job PRIMARY KEY (job_ID), 
CONSTRAINT FK_Job_Area FOREIGN KEY (job_area_ID) 
        REFERENCES [Area] (area_ID), 
) 
 

CREATE TABLE [dbo].[Service]( 
[service_ID] [int] IDENTITY(1,1) NOT NULL, 
[service_name] [varchar](30), 
CONSTRAINT PK_Service PRIMARY KEY (service_ID), 
) 
 

CREATE TABLE [dbo].[Order_status]( 
[order_status_ID] [int] IDENTITY(1,1) NOT NULL, 
[order_status_name] [varchar](30) NOT NULL, 
CONSTRAINT PK_OrderStatus PRIMARY KEY (order_status_ID) 
) 

CREATE TABLE [dbo].[Order1]( 
[order_ID] [int] IDENTITY(1,1) NOT NULL, 
[table_ID] [int], 
[service_ID] [int] , 
[quantity] [int] , 
[order_date] [date], 
[order_price] [decimal](10,2),
[order_order_status_ID] [int], 
CONSTRAINT PK_Order1 PRIMARY KEY (order_ID), 
CONSTRAINT FK_Order1_Table FOREIGN KEY (table_ID) 
        REFERENCES [TableofRestaurant] (table_ID), 
CONSTRAINT FK_Order1_Service FOREIGN KEY (service_ID)         REFERENCES [Service] (service_ID), 
CONSTRAINT FK_Order1_OrderStatus FOREIGN KEY (order_order_status_ID)         REFERENCES [Order_status] (order_status_ID),

) 
 
CREATE TABLE [dbo].[Task_status]( 
[task_status_ID] [int] IDENTITY(1,1) NOT NULL, 
[task_status_name] [varchar](30) NOT NULL, 
CONSTRAINT PK_TaskStatus PRIMARY KEY (task_status_ID) 
) 
 
CREATE TABLE [dbo].[Task]( 
[task_ID] [int] IDENTITY(1,1) NOT NULL, 
[task_name] [varchar](30) NOT NULL, 
[task_begin] [date], 
[task_end] [date], 
[task_task_status_ID] [int], 
CONSTRAINT PK_Task PRIMARY KEY (task_ID), 
CONSTRAINT FK_Task_TaskStatus FOREIGN KEY (task_task_status_ID)         REFERENCES [Task_status] (task_status_ID), 
) 
 
CREATE TABLE [dbo].[Employee_Task]( 
[employee_ID] [int] NOT NULL, 
[task_ID] [int] NOT NULL, 
CONSTRAINT PK_Emp_Task PRIMARY KEY (employee_ID, task_ID), 
CONSTRAINT FK_Employee FOREIGN KEY (employee_ID)  
REFERENCES Employee(employee_ID), 
CONSTRAINT FK_Task_Rel FOREIGN KEY (task_ID)  
REFERENCES Task(task_ID) 
); 

