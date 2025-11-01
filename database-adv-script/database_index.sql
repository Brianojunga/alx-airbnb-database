
-- Indexes for Users table
CREATE INDEX idx_users_email ON Users(email);
CREATE INDEX idx_users_created_at ON Users(created_at);

-- Indexes for Property table
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_price ON Property(price);
CREATE INDEX idx_property_host ON Property(host_id);

-- Indexes for Booking table
CREATE INDEX idx_booking_user ON Booking(user_id);
CREATE INDEX idx_booking_property ON Booking(property_id);
CREATE INDEX idx_booking_check_in ON Booking(check_in);


-- testing query perfomance
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE property_id = 5;