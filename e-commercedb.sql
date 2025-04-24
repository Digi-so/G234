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

-- Create table for product size options
CREATE TABLE size_option (
    id INT PRIMARY KEY,
    size_category_id INT NOT NULL,
    value VARCHAR(50) NOT NULL,
    FOREIGN KEY (size_category_id) REFERENCES size_category(id)
);

-- Create table for product attributes
CREATE TABLE attribute_type (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Create table for product attribute categories
CREATE TABLE attribute_category (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

-- Create table for products
CREATE TABLE product (
    id INT PRIMARY KEY,
    brand_id INT NOT NULL,
    category_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    base_price DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP,
    FOREIGN KEY (brand_id) REFERENCES brand(id),
    FOREIGN KEY (category_id) REFERENCES product_category(id)
);

-- Create table for product images
CREATE TABLE product_image (
    id INT PRIMARY KEY,
    product_item_id INT NOT NULL,
    image_url VARCHAR(255),
    alt_text VARCHAR(255),
    created_at TIMESTAMP,
    FOREIGN KEY (product_item_id) REFERENCES product(id)
);

-- Create table for product items
CREATE TABLE product_item (
    id INT PRIMARY KEY,
    product_id INT NOT NULL,
    sku VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL,
    color_id INT,
    size_option_id INT,
    created_at TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (color_id) REFERENCES color(id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(id)
);