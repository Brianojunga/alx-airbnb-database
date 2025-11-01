-- Write an initial query that retrieves all bookings along with the user details, property details, and payment details and save it on perfomance.sql
EXPLAIN ANALYZE
SELECT 
    Booking.bookings_id,
    Payment.amount,
    Property.title,
    Users.full_name,
    Users.email
FROM
    Booking
JOIN
    Payment
ON 
    Payment.bookings_id = Booking.bookings_id
JOIN
    Property
ON 
    Property.property_id = Booking.property_id
JOIN
    Users
ON 
    Users.user_id = Property.user_id;

CREATE INDEX idx_booking_property ON Booking(property_id);
CREATE INDEX idx_users_email ON Users(email);