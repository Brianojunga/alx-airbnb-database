SELECT 
    Booking.Property_id,
    Booking.guest_id,
    Users.full_name,
    Users.email
FROM 
    Booking
INNER JOIN
    Users
ON 
    Booking.guest_id = Users.user_id;



SELECT
    Property.property_id,
    Property.price_per_night,
    Property.max_guest,
    Review.comment,
    Review.rating
FROM
    Property
LEFT JOIN 
    Review
ON 
    Property.property_id = Review.property_id
ORDER BY
    Property.property_id;

SELECT
    SELECT 
    Booking.Property_id,
    Booking.guest_id,
    Users.full_name,
    Users.email
FROM 
    Users
FULL OUTER JOIN
    Booking
ON 
    Booking.guest_id = Users.user_id;

