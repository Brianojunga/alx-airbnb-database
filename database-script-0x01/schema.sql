-- ==============================================
-- DATABASE: Airbnb Clone
-- DESCRIPTION: SQL schema based on ERD (3NF)
-- ==============================================

-- 1️⃣ Lookup Tables
-- -----------------

CREATE TABLE UserRole (
    role_id SERIAL PRIMARY KEY,
    role_name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE BookingStatus (
    status_id SERIAL PRIMARY KEY,
    status_name VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE PaymentMethod (
    method_id SERIAL PRIMARY KEY,
    method_name VARCHAR(30) UNIQUE NOT NULL
);

-- Optional lookup table for property types
CREATE TABLE PropertyType (
    type_id SERIAL PRIMARY KEY,
    type_name VARCHAR(50) UNIQUE NOT NULL
);

-- Location table to support scalability
CREATE TABLE Location (
    location_id SERIAL PRIMARY KEY,
    city VARCHAR(100),
    region VARCHAR(100),
    country VARCHAR(100)
);

-- 2️⃣ Core Entities
-- -----------------

CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    password_hash VARCHAR(255) NOT NULL,
    role_id INT NOT NULL REFERENCES UserRole(role_id) ON UPDATE CASCADE,
    date_joined TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_users_email ON Users(email);


CREATE TABLE Property (
    property_id SERIAL PRIMARY KEY,
    host_id INT NOT NULL REFERENCES Users(user_id) ON DELETE CASCADE,
    type_id INT REFERENCES PropertyType(type_id),
    title VARCHAR(150) NOT NULL,
    description TEXT,
    price_per_night DECIMAL(10,2) NOT NULL,
    location_id INT REFERENCES Location(location_id),
    max_guests INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_property_host ON Property(host_id);
CREATE INDEX idx_property_location ON Property(location_id);


CREATE TABLE Booking (
    booking_id SERIAL PRIMARY KEY,
    property_id INT NOT NULL REFERENCES Property(property_id) ON DELETE CASCADE,
    guest_id INT NOT NULL REFERENCES Users(user_id) ON DELETE CASCADE,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status_id INT NOT NULL REFERENCES BookingStatus(status_id) ON UPDATE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_booking_dates CHECK (end_date > start_date)
);

CREATE INDEX idx_booking_property ON Booking(property_id);
CREATE INDEX idx_booking_guest ON Booking(guest_id);


CREATE TABLE Payment (
    payment_id SERIAL PRIMARY KEY,
    booking_id INT NOT NULL REFERENCES Booking(booking_id) ON DELETE CASCADE,
    method_id INT REFERENCES PaymentMethod(method_id),
    amount DECIMAL(10,2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_positive_amount CHECK (amount > 0)
);

CREATE INDEX idx_payment_booking ON Payment(booking_id);


CREATE TABLE Review (
    review_id SERIAL PRIMARY KEY,
    property_id INT NOT NULL REFERENCES Property(property_id) ON DELETE CASCADE,
    guest_id INT NOT NULL REFERENCES Users(user_id) ON DELETE CASCADE,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_review_property ON Review(property_id);
CREATE INDEX idx_review_guest ON Review(guest_id);

