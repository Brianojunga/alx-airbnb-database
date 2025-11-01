
SELECT property_id, title FROM properties 
WHERE property_id IN(
    SELECT property_id FROM reviews
    GROUP BY property_id HAVING 
    AVG(rating) > 4.0;
)

SELECT user_id, full_name FROM Users
WHERE user_id IN(
    SELECT guest_id FROM Booking
    GROUP BY guest_id
    HAVING COUNT(guest_id) > 3
)

