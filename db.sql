-- Database: Zithara

-- DROP DATABASE IF EXISTS "Zithara";
SELECT current_user;


CREATE DATABASE "Zithara"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_India.1252'
    LC_CTYPE = 'English_India.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
CREATE TABLE IF NOT EXISTS customers (
    sno SERIAL PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    phone VARCHAR(20),
    location VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO customers (customer_name, age, phone, location, created_at) VALUES
    ('John Doe', 25, '123-456-7890', 'New York', '2023-01-01 08:30:00'),
    ('Jane Smith', 30, '987-654-3210', 'Los Angeles', '2023-02-15 12:45:00'),
    ('Bob Johnson', 22, '555-123-4567', 'Chicago', '2023-03-20 14:20:00'),
    ('Emily Davis', 35, '333-999-8888', 'San Francisco', '2023-04-05 16:10:00'),
    ('Michael White', 28, '777-111-2222', 'Miami', '2023-05-12 09:45:00'),
    ('Sophia Brown', 31, '444-555-6666', 'Seattle', '2023-06-30 11:30:00'),
    ('Daniel Miller', 27, '666-888-0000', 'Dallas', '2023-07-18 14:50:00'),
    ('Olivia Wilson', 29, '111-333-4444', 'Boston', '2023-08-02 17:25:00'),
    ('William Anderson', 32, '222-888-9999', 'Denver', '2023-09-10 19:15:00'),
    ('Emma Garcia', 26, '777-555-4444', 'Phoenix', '2023-10-25 21:40:00'),
    ('Liam Taylor', 34, '999-111-0000', 'Houston', '2023-11-11 23:55:00'),
    ('Ava Rodriguez', 23, '444-666-8888', 'Atlanta', '2023-12-07 06:30:00'),
    ('Noah Moore', 33, '888-777-3333', 'Philadelphia', '2024-01-15 08:45:00'),
    ('Isabella Lee', 24, '222-333-5555', 'Minneapolis', '2024-02-20 10:20:00'),
    ('James Smith', 36, '111-222-3333', 'Portland', '2024-03-05 12:35:00'),
    ('Olivia Harris', 30, '555-888-6666', 'Detroit', '2024-04-14 14:10:00'),
    ('Ethan Davis', 25, '777-666-5555', 'Raleigh', '2024-05-29 16:45:00'),
    ('Ava Johnson', 28, '333-444-9999', 'San Diego', '2024-06-18 19:20:00'),
    ('Mia Brown', 31, '666-333-5555', 'Nashville', '2024-07-03 21:35:00'),
    ('Liam Anderson', 26, '999-111-7777', 'Orlando', '2024-08-12 23:50:00'),
    ('Emma Taylor', 29, '555-777-2222', 'Charlotte', '2024-09-30 03:15:00'),
    ('Noah White', 32, '222-444-8888', 'Austin', '2024-10-15 05:30:00'),
    ('Sophia Smith', 27, '888-111-4444', 'Tampa', '2024-11-20 07:45:00'),
    ('Oliver Wilson', 30, '444-666-3333', 'Columbus', '2024-12-05 09:10:00'),
    ('Ava Brown', 33, '777-555-9999', 'San Antonio', '2025-01-10 11:25:00'),
    ('Liam Martin', 28, '111-222-5555', 'Kansas City', '2025-02-25 13:40:00'),
    ('Emma Garcia', 31, '666-555-1111', 'Las Vegas', '2025-03-15 15:55:00'),
    ('Lucas Lee', 34, '999-888-2222', 'St. Louis', '2025-04-20 18:10:00'),
    ('Sophia Martinez', 29, '222-333-7777', 'Salt Lake City', '2025-05-05 20:25:00'),
    ('Jackson Davis', 32, '555-777-8888', 'Oklahoma City', '2025-06-10 22:40:00'),
    ('Olivia White', 27, '888-111-4444', 'Memphis', '2025-07-25 00:55:00'),
    ('Aiden Taylor', 30, '333-555-6666', 'Louisville', '2025-08-10 03:10:00'),
    ('Sophie Anderson', 33, '777-999-1111', 'Baltimore', '2025-09-15 05:25:00'),
    ('Henry Wilson', 28, '444-666-3333', 'Albuquerque', '2025-10-20 07:40:00'),
    ('Grace Harris', 31, '111-555-7777', 'Milwaukee', '2025-11-05 09:55:00'),
    ('Benjamin Davis', 34, '666-888-2222', 'Tucson', '2025-12-10 12:10:00'),
    ('Chloe Garcia', 29, '999-222-5555', 'Fresno', '2026-01-25 14:25:00'),
    ('William Johnson', 32, '555-777-3333', 'Wichita', '2026-02-10 16:40:00'),
    ('Ella Lee', 27, '111-444-6666', 'Bakersfield', '2026-03-15 18:55:00'),
    ('Liam Martinez', 30, '777-888-1111', 'New Orleans', '2026-04-20 21:10:00'),
    ('Avery Brown', 33, '333-666-9999', 'Arlington', '2026-05-05 23:25:00'),
    ('Harper White', 28, '888-111-5555', 'Cleveland', '2026-06-10 01:40:00'),
    ('Mason Taylor', 31, '444-555-7777', 'Tampa', '2026-07-25 03:55:00'),
    ('Evelyn Anderson', 34, '111-777-2222', 'Honolulu', '2026-08-10 06:10:00'),
	('William Johnson', 32, '555-777-3333', 'Wichita', '2026-02-10 16:40:00'),
    ('Ella Lee', 27, '111-444-6666', 'Bakersfield', '2026-03-15 18:55:00'),
    ('Liam Martinez', 30, '777-888-1111', 'New Orleans', '2026-04-20 21:10:00'),
    ('Avery Brown', 33, '333-666-9999', 'Arlington', '2026-05-05 23:25:00'),
    ('Harper White', 28, '888-111-5555', 'Cleveland', '2026-06-10 01:40:00'),
    ('Mason Taylor', 31, '444-555-7777', 'Tampa', '2026-07-25 03:55:00'),
    ('Evelyn Anderson', 34, '111-777-2222', 'Honolulu', '2026-08-10 06:10:00');



