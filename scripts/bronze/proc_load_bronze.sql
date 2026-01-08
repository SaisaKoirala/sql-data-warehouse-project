--creating stored procedure
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @finish_time DATETIME;
	BEGIN TRY
		--Bulk insertion of data (full load: TRUNCATE + INSERT)
		SET @start_time = GETDATE();
		PRINT 'LOADING BRONZE LAYER';
		PRINT '-------------------------------------------------------------------------------------------------';
		PRINT 'CRM';
		TRUNCATE TABLE bronze.crm_cust_info;
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\saisa\OneDrive\Desktop\SQLproject\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		TRUNCATE TABLE bronze.crm_prd_info;
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\saisa\OneDrive\Desktop\SQLproject\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		TRUNCATE TABLE bronze.crm_sales_details;
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\saisa\OneDrive\Desktop\SQLproject\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		PRINT '------------------------------------------------------------------------------------------------';
		PRINT 'ERP';
		TRUNCATE TABLE bronze.erp_cust_az12;
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\saisa\OneDrive\Desktop\SQLproject\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		TRUNCATE TABLE bronze.erp_loc_a101;
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\saisa\OneDrive\Desktop\SQLproject\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		TRUNCATE TABLE bronze.erp_px_cat_g1v2;
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\saisa\OneDrive\Desktop\SQLproject\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @finish_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second,@start_time,@finish_time) AS NVARCHAR) + ' seconds';
		END TRY
		BEGIN CATCH 
			PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER';
			PRINT 'ERROR MESSAGE' + ERROR_MESSAGE();
			PRINT 'ERROR MESSAGE' + CAST(ERROR_NUMBER() AS NVARCHAR);
		END CATCH
END
