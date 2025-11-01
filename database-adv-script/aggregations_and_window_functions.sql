-- Write a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.

-- Use a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.

SELECT guest_id, COUNT(booking_id) AS total_bookings FROM Booking
GROUP BY guest_id;

SELECT 
    property_id,
    COUNT(booking_id) AS total_bookings,
    RANK() OVER (
        ORDER BY COUNT(booking_id) DESC AS rank
    )
    ROW_NUMBER() OVER (
        ORDER BY COUNT(booking_id) DESC AS row_num
    )
FROM Booking
GROUP BY property_id;