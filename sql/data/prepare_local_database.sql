-- Initalise Database & User Permissions, Version 1.2, FEB18, JPGalovic
-- Creates Database and User for webpage if database is not found
CREATE DATABASE IF NOT EXISTS swinan01_smart_web;
CREATE USER IF NOT EXISTS 'swinan01'@'localhost' IDENTIFIED BY 'EgLcxZ8uHT';
GRANT ALL PRIVILEGES ON swinan01_smart_web.* TO 'swinan01'@'localhost';

