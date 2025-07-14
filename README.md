# 🏥 Hospital Data Warehouse Project

A comprehensive Data Warehouse project designed to transform and analyze hospital data using Microsoft SQL Server, SSIS, and Power BI. This project simulates real-world OLTP to OLAP transformation and offers business intelligence insights through visual dashboards.

## 📊 Project Overview

The goal of this project is to demonstrate how data from a transactional hospital system can be extracted, transformed, and loaded into a data warehouse, and then visualized for business insights.

### 🔧 Components

* **OLTP Database**: Simulated operational database with normalized tables for hospital data
* **Data Warehouse (OLAP)**: Star schema designed for analytical querying
* **ETL with SSIS**: SQL Server Integration Services packages to automate data flow from OLTP to OLAP
* **Power BI Dashboard**: Interactive visualizations to support data-driven decision-making

---

## 🗂️ Folder Structure

```plaintext
Hospital_DataWarehouse_Project/
│
├── ETL_SSIS/                    # SSIS packages and ETL scripts
├── OLTP_SQL/                    # SQL scripts to create and populate OLTP schema
├── DWH_SQL/                     # Scripts for building the Data Warehouse star schema
├── PowerBI_Dashboard/           # Power BI .pbix file with visualizations
└── README.md                    # Project documentation
```

---

## 🏗️ Data Model

### ✅ OLTP Schema Highlights

* `Patients`, `Doctors`, `Appointments`, `Departments`, `Diagnoses`, `Bills`, etc.
* Fully normalized to reduce redundancy and improve data integrity

### ⭐ OLAP (Data Warehouse) Star Schema

* **Fact Table**:

  * `Fact_Visits`: Contains keys to dimensions and numeric measures such as cost and visit duration
* **Dimension Tables**:

  * `Dim_Patient`
  * `Dim_Doctor`
  * `Dim_Date`
  * `Dim_Department`
  * `Dim_Diagnosis`

---

## 🔁 ETL Process (SSIS)

* **Extract**: From OLTP tables using SQL queries
* **Transform**: Clean, deduplicate, and convert formats
* **Load**: Insert into DWH star schema
* Includes error handling and data validation steps

---

## 📊 Power BI Dashboard

Includes interactive visuals for:

* Total revenue trends
* Number of patients per department
* Diagnosis frequency
* Doctor performance metrics
* Monthly visit analytics

> 📌 *Power BI file located in the `PowerBI_Dashboard` folder*

---

## 💡 How to Use

1. **Set up OLTP schema**:

   * Run scripts from `OLTP_SQL` in SQL Server

2. **Build DWH schema**:

   * Execute scripts in `DWH_SQL`

3. **Configure SSIS ETL**:

   * Open SSIS solution in Visual Studio
   * Update connection strings if needed
   * Run ETL packages

4. **Open Power BI Dashboard**:

   * Load `.pbix` file and refresh data source

---

## 🎯 Learning Objectives

* Understand the end-to-end process of data warehousing
* Apply ETL using SSIS for healthcare data
* Visualize data using Power BI to support decision making

---

## 📬 Contact

Created by [@AbdooMatrix](https://github.com/AbdooMatrix)
Contributions and feedback are welcome!
