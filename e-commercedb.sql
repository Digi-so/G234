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

-- Create table for product categories
CREATE TABLE product_category (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    parent_category_id INT,
    description TEXT,
    FOREIGN KEY (parent_category_id) REFERENCES product_category(id)
);

-- Create table for product brand
CREATE TABLE brand (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    logo_url VARCHAR(255)
);

-- Create table for product size categories
CREATE TABLE size_category (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT
);