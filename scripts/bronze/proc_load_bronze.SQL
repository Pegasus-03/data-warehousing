CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
  DECLARE @start_time DATETIME, @end_time DATETIME;
  BEGIN TRY 
		PRINT'========================';
		PRINT'Loading Bronze Layer';
		PRINT'========================';

		PRINT'---------------------------------';
		PRINT'Loading CRM Tables';
		PRINT'---------------------------------';
		SET @start_time = GETDATE();
		PRINT'Truncating the Table: bronze.crm_cust_info'
		TRUNCATE TABLE	bronze.crm_cust_info ;

		PRINT'Inserting Data Into : bronze.crm_cust_info'
		BULK INSERT bronze.crm_cust_info 
		FROM 'C:\Users\pkabh\OneDrive\Desktop\Abhi\SQL\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
		 FIRSTROW = 2,
		 FIELDTERMINATOR =',',
		 TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT'---Loading Duration is Completed---'
		PRINT'.. LOAD DURATION :' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' SECONDS' ;

			SET @start_time = GETDATE();
			PRINT'Truncating the Table: bronze.crm_prd_info'
		TRUNCATE TABLE	bronze.crm_prd_info	;

			PRINT'Inserting Data Into : bronze.crm_prd_info'
		BULK INSERT bronze.crm_prd_info

		FROM 'C:\Users\pkabh\OneDrive\Desktop\Abhi\SQL\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (
		 FIRSTROW = 2,
		 FIELDTERMINATOR =',',
		 TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT'---Loading Duration is Completed---'
		PRINT'.. LOAD DURATION :' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' SECONDS' ;
		SET @start_time = GETDATE();
		PRINT'Truncating the Table:bronze.crm_sales_details'
		TRUNCATE TABLE	bronze.crm_sales_details;

		PRINT'Inserting Data Into : bronze.crm_sales_details'
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\pkabh\OneDrive\Desktop\Abhi\SQL\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (
		 FIRSTROW = 2,
		 FIELDTERMINATOR =',',
		 TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT'---Loading Duration is Completed---'
		PRINT'.. LOAD DURATION :' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' SECONDS' ;

		PRINT'---------------------------------'
		PRINT'Loading ERP Tables'
		PRINT'---------------------------------'
		SET @start_time = GETDATE();
		PRINT'Truncating the Table:bronze.erp_CUST_AZ12'
		TRUNCATE TABLE	bronze.erp_CUST_AZ12;

		PRINT'Inserting Data Into : bronze.erp_CUST_AZ12'
		BULK INSERT bronze.erp_CUST_AZ12
		FROM 'C:\Users\pkabh\OneDrive\Desktop\Abhi\SQL\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH (
		 FIRSTROW = 2,
		 FIELDTERMINATOR =',',
		 TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT'---Loading Duration is Completed---'
		PRINT'.. LOAD DURATION :' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' SECONDS' ;
		SET @start_time = GETDATE();

		PRINT'Truncating the Table:bronze.erp_LOC_A101'
		TRUNCATE TABLE	bronze.erp_LOC_A101;

		PRINT'Inserting Data Into :bronze.erp_LOC_A101'
		BULK INSERT bronze.erp_LOC_A101
		FROM 'C:\Users\pkabh\OneDrive\Desktop\Abhi\SQL\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH (
		 FIRSTROW = 2,
		 FIELDTERMINATOR =',',
		 TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT'---Loading Duration is Completed---'
		PRINT'.. LOAD DURATION :' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' SECONDS' ;
		SET @start_time = GETDATE();
		PRINT'Truncating the Table:bronze.erp_PX_CAT_G1V2'
		TRUNCATE TABLE	bronze.erp_PX_CAT_G1V2;

		PRINT'Inserting Data Into :bronze.erp_PX_CAT_G1V2'
		BULK INSERT bronze.erp_PX_CAT_G1V2
		FROM 'C:\Users\pkabh\OneDrive\Desktop\Abhi\SQL\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
		 FIRSTROW = 2,
		 FIELDTERMINATOR =',',
		 TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT'---Loading Duration is Completed---'
		PRINT'.. LOAD DURATION :' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' SECONDS' ;
   END TRY

   BEGIN CATCH
          PRINT'======================================='
		  PRINT'Error Occured in Broze Layer ' 
		  PRINT'======================================='
		  PRINT'Error Message:' + ERROR_MESSAGE();
		  PRINT'Error Message:' + CAST (ERROR_NUMBER() AS NVARCHAR);
		  PRINT'Error Message:' + CAST (ERROR_STATE() AS NVARCHAR);
   END CATCH 
END
