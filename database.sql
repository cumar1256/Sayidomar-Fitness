-- Sayidomar Fitness database schema and starter data
-- Use this with MySQL or MariaDB.

CREATE DATABASE IF NOT EXISTS sayidomar_fitness;
USE sayidomar_fitness;

CREATE TABLE IF NOT EXISTS membership_plans (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(8, 2) NOT NULL,
    billing_cycle VARCHAR(20) NOT NULL DEFAULT 'monthly',
    is_featured BOOLEAN NOT NULL DEFAULT FALSE,
    features TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS services (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(120) NOT NULL,
    description TEXT NOT NULL,
    image_path VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS trainers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(120) NOT NULL,
    title VARCHAR(120) NOT NULL,
    bio TEXT,
    image_path VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS gallery_images (
    id INT AUTO_INCREMENT PRIMARY KEY,
    image_path VARCHAR(255) NOT NULL,
    alt_text VARCHAR(255) NOT NULL,
    grid_column_span INT NOT NULL DEFAULT 1,
    grid_row_span INT NOT NULL DEFAULT 1,
    display_order INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS contact_messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(120) NOT NULL,
    email VARCHAR(160) NOT NULL,
    phone VARCHAR(40),
    objectives TEXT NOT NULL,
    status ENUM('new', 'contacted', 'closed') NOT NULL DEFAULT 'new',
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS faqs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    question VARCHAR(255) NOT NULL,
    answer TEXT NOT NULL,
    display_order INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO membership_plans (name, price, billing_cycle, is_featured, features) VALUES
('Basic Tier', 29.00, 'monthly', FALSE, 'Standard Facility Entry; Full Locker & Shower Access; 1 Complimentary Baseline Assessment'),
('Elite Tier', 59.00, 'monthly', TRUE, 'Unrestricted 24/7 Facility Key Access; Unlimited Standard Group Conditioning Classes; 2 Monthly Custom Coaching Assessment Hours; Complimentary Hydro-Recovery Zone Passes'),
('VIP Black Tier', 99.00, 'monthly', FALSE, 'All Elite Tier Infrastructure Access; Dedicated Permanent Private Locker; Weekly 1-on-1 Assigned Master Training Blocks; Tailored Nutrient & Macro Architecture Tracking');

INSERT INTO services (title, description, image_path) VALUES
('Powerlifting & Strength', 'Unlock absolute raw power with safe compound execution mechanics across key barbell movements including squat, bench press, and deadlift variations.', 'first.jpeg'),
('Metabolic Conditioning', 'High-intensity aerobic and anaerobic training blocks using rowers, air bikes, and kettlebell circuits.', 'second.jpeg'),
('Elite Personal Coaching', 'Tailor-made programming frameworks specific to your body, lifestyle, and target performance goals.', 'last.jpeg');

INSERT INTO trainers (full_name, title, bio, image_path) VALUES
('Sayidomar Said Hassan', 'Owner and Head Trainer', 'I am the owner and head trainer at Sayidomar Fitness.', 'omar.jpeg'),
('Sarah Jenkins', 'Metabolic Conditioning Specialist', 'Expert in high-output interval systems and custom baseline tracking.', 'images/trainer2.jpg');

INSERT INTO gallery_images (image_path, alt_text, grid_column_span, grid_row_span, display_order) VALUES
('main.jpeg', 'Main Floor Setup Tier 1', 2, 2, 1),
('loyout.jpeg', 'Industrial Strength Layout', 1, 1, 2),
('free.jpeg', 'Free Weights Array', 1, 1, 3),
('coach.jpeg', 'Coaching Platform Alpha', 1, 1, 4),
('hub.jpeg', 'Conditioning Hub', 1, 1, 5),
('drive.jpeg', 'Athlete Mechanical Drive', 2, 1, 6);

INSERT INTO faqs (question, answer, display_order) VALUES
('What are your gym hours?', 'Weekdays are 5:00 AM to 11:00 PM. Weekends are 6:00 AM to 9:00 PM.', 1),
('Do you offer personal training?', 'Yes. Sayidomar Fitness offers personal coaching and customized training programs.', 2),
('How do I join?', 'Choose a membership plan and contact us through the contact page to get started.', 3);
