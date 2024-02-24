# Ramp README

## Objective 
Calculate the rolling three-day average for January 31st, 2021

## Overview
This document outlines the process and SQL corrections needed to calculate the rolling three-day average of transaction amounts for January 31st, 2021, from a given dataset. The original SQL schema contained bugs that have been identified and corrected in the instructions below.

## Original SQL Schema with Bugs

CREATE TABLE transactions (
  "transaction_time" TIMESTAMP,
  "transaction_amount" FLOAT
);

INSERT INTO transactions
  ("transaction_time", "transaction_amount")
VALUES
    ('2021-01-16 00:05:54.000000', '25.05'),
  ('2021-01-07 20:53:04.000000', '124.00'),
  ('2021-01-18 22:55:37.000000', '66.58'),
  ('2021-01-21 00:36:57.000000', '9.99'),
  ('2021-01-19 06:31:10.000000', '22.27'),
  .
  .
  .

## Identified Bugs and Corrections:

### 1. Incorrect Column Name Quotation
Bug: Column names were enclosed in double quotes, which is unnecessary unless the identifier is case-sensitive or reserved
Correction: Double quotes around column names were removed when creating the table

### 2. Incorrect Data Type for 'transaction_amount'
Bug: The 'transaction_amount column was defined as 'FLOAT', but the inserted values are text. 
Correction: Change the data type of the transaction_amount to 'TEXT' as values can be converted to Decimal values in the SQL query

### 3. Column Name Syntax In Insert
Bug: Column names were enclosed in double quotes in insert, which is unnecessary. 
Correction: Double quotes around column names were removed. 
