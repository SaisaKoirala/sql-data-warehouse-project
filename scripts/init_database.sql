/*
 Project: SQL Data Warehouse Project
 Script: Database & Schema Initialization
 Description:
  - Creates the main DataWarehouse database.
  - Defines the Bronze, Silver, and Gold schemas used for modern data warehouse layering.
    • Bronze  → Raw data ingestion layer
    • Silver  → Cleaned, standardized data layer
    • Gold    → Business-ready analytics layer
*/


--Create Database 'DataWarehouse'

USE master;

CREATE DATABASE DataWarehouse;

USE DataWarehouse;
 
 --Creating a space (container) where tables are created

CREATE SCHEMA bronze;

CREATE SCHEMA silver;

CREATE SCHEMA gold;
