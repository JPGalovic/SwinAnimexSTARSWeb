-- Creates Database and User for webpage if database is not found
CREATE DATABASE IF NOT EXISTS swinan01_smart_web;
CREATE USER IF NOT EXISTS 'swinan01'@'localhost' IDENTIFIED BY 'qdVbzdb498';
GRANT ALL PRIVILEGES ON swinan01_smart_web.* TO 'swinan01'@'localhost';

-- Use the swinan01_smart_web database
USE swinan01_smart_web;
