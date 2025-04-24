-- Create database if it doesnt exist
CREATE DATABASE IF NOT EXISTS e_commerce_db;

-- Use the database
USE database_name;

-- Create table for color
CREATE TABLE color (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    hex_code VARCHAR(7)
);