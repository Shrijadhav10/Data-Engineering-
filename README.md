ETL Project: End-to-End Data Pipeline

Overview

This repository contains an end-to-end ETL (Extract, Transform, Load) project demonstrating the integration of Python, SQL Server, and Kaggle API for data extraction, transformation, and storage. The project provides a comprehensive workflow for building and managing data pipelines.

Features

Data Extraction: Fetch data from Kaggle using the Kaggle API.
Data Transformation: Utilize Pandas in Jupyter Notebook to clean, preprocess, and transform the data.
Data Loading: Store the transformed data into SQL Server for analysis and querying.

![image](https://github.com/user-attachments/assets/80930618-b7ff-440e-bb39-4a987bd214a6)


File Structure

├── notebooks
│   └── Order Data Analysis.ipynb      # Jupyter Notebook containing the Python code for ETL
├── sql
│   └── SQLQuery1.sql      # SQL script to create tables and schemas in SQL Server
├── README.md                    # Project documentation

Prerequisites

Python Packages:
pandas
sqlalchemy
kaggle
pyodbc

Install these packages using:
pip install pandas sqlalchemy kaggle pyodbc

Kaggle API Setup:
Sign up or log in to your Kaggle account.
Navigate to your account settings and generate a new API token.
Save the downloaded kaggle.json file in the directory ~/.kaggle/ (Linux/Mac) or %USERPROFILE%\.kaggle\ (Windows).

SQL Server Setup:
Ensure SQL Server is installed and running.
Configure a database and set up the schema using the provided database_schema.sql file.

Workflow

Step 1: Data Extraction
Use the Kaggle API to download the dataset programmatically. The etl_pipeline.ipynb notebook demonstrates how to authenticate and fetch datasets from Kaggle.

Step 2: Data Transformation
Load the downloaded dataset into a Pandas DataFrame.
Perform data cleaning, preprocessing, and transformation.
The notebook showcases operations like handling missing values, data type conversions, and creating derived columns.

Step 3: Data Loading
Establish a connection to SQL Server using pyodbc or sqlalchemy.
Create tables in the database as per the schema in database_schema.sql.
Load the transformed data into SQL Server tables.

Running the Project

Clone this repository:

git clone <repository_url>
cd <repository_name>

Run the Jupyter Notebook:

jupyter notebook - Order Data Analysis.ipynb

Execute the SQL script to set up the database schema:

sqlcmd -S <server_name> -d <database_name> -i sql/database_schema.sql

Highlights

Automation: The ETL process is automated for efficient data handling.

Scalability: Modular design enables easy extension for new datasets or transformations.
Integration: Combines Python for data processing and SQL Server for robust storage and querying.

Future Enhancements

Add error handling and logging for better debugging.
Incorporate advanced transformations using Python libraries like PySpark.
Explore visualization tools (e.g., Power BI, Tableau) for data insights.

License

This project is licensed under the MIT License. See the LICENSE file for details.

Acknowledgments

Kaggle for providing the dataset and API.
Pandas for robust data manipulation.
SQL Server for reliable database management.
