-- ==============================================
-- SAMPLE DATA POPULATION SCRIPT
-- ==============================================

-- 1️⃣ Lookup Tables
-- -----------------

INSERT INTO UserRole (role_name) VALUES
('guest'),
('host'),
('admin');

INSERT INTO BookingStatus (status_name) VALUES
('pending'),
('confirmed'),
('canceled');

INSERT INTO PaymentMethod (method_name) VALUES
('credit_card'),
('paypal'),
('stripe');

INSERT INTO PropertyType (type_name) VALUES
('Apartment'),
('Villa'),
('Cottage'),
('Studio');

INSERT INTO Location (city, region, country) VALUES
('Nairobi', 'Nairobi County', 'Kenya'),
('Mombasa', 'Coast', 'Kenya'),
('Kigali', 'Kigali City', 'Rwanda'),
('Cape Town', 'Western Cape', 'South Africa');

-- 2️⃣ Users
-- ---------

INSERT INTO Users (full_name, email, phone, password_hash, role_id) VALUES
('Alice Mwangi', 'alice@example.com', '+254700111222', 'hashed_pw_1', 1), -- guest
('Brian Ochieng', 'brian@example.com', '+254711333444', 'hashed_pw_2', 2), -- host
('Caroline Njeri', 'caroline@example.com', '+254722555666', 'hashed_pw_3', 1), -- guest
('David Otieno', 'david@example.com', '+254733777888', 'hashed_pw_4', 2), -- host
('Admin User', 'admin@example.com', '+254700000000', 'hashed_pw_admin', 3); -- admin

-- 3️⃣ Properties
-- --------------

INSERT INTO Property (host_id, type_id, title, description, price_per_night, location_id, max_guests)
VALUES
(2, 1, 'Cozy City Apartment', 'Modern apartment near CBD with Wi-Fi and parking.', 55.00, 1, 2),
(2, 2, 'Luxury Villa with Pool', 'Spacious villa with ocean view and pool.', 150.00, 2, 6),
(4, 3, 'Rustic Cottage', 'Quiet cottage surrounded by trees — perfect for retreat.', 75.00, 3, 4),
(4, 4, 'Modern Studio', 'Compact studio ideal for solo travelers.', 40.00, 1, 1);

-- 4️⃣ Bookings
-- ------------

INSERT INTO Booking (property_id, guest_id, start_date, end_date, status_id)
VALUES
(1, 1, '2025-10-01', '2025-10-05', 2),  -- confirmed
(2, 3, '2025-11-10', '2025-11-15', 1),  -- pending
(3, 1, '2025-09-20', '2025-09-25', 3),  -- canceled
(4, 3, '2025-10-20', '2025-10-22', 2);  -- confirmed

-- 5️⃣ Payments
-- ------------

INSERT INTO Payment (booking_id, method_id, amount)
VALUES
(1, 1, 220.00),
(2, 2, 750.00),
(4, 3, 80.00);

-- 6️⃣ Reviews
-- -----------

INSERT INTO Review (property_id, guest_id, rating, comment)
VALUES
(1, 1, 5, 'Amazing stay — very clean and host was super friendly!'),
(2, 3, 4, 'Beautiful villa but Wi-Fi could be better.'),
(3, 1, 3, 'Good for a quiet retreat, but location is a bit remote.');

-- ✅ Optional extra example for Messages (if included in schema)
INSERT INTO Message (sender_id, recipient_id, message_body)
VALUES
(1, 2, 'Hi Brian, is your apartment available next week?'),
(2, 1, 'Hi Alice! Yes, it’s available from Monday onwards.'),
(3, 4, 'Hi David, can I get a discount for two nights?');

