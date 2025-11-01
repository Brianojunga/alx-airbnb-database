-- 1️⃣ Drop the table if it already exists (for demo purposes)
DROP TABLE IF EXISTS Booking CASCADE;

-- 2️⃣ Create a parent table for partitioning
CREATE TABLE Booking (
    booking_id SERIAL PRIMARY KEY,
    property_id INT NOT NULL,
    user_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_amount DECIMAL(10,2)
) PARTITION BY RANGE (start_date);

-- 3️⃣ Create partitions based on date ranges
CREATE TABLE booking_2025_q1 PARTITION OF Booking
    FOR VALUES FROM ('2025-01-01') TO ('2025-04-01');

CREATE TABLE booking_2025_q2 PARTITION OF Booking
    FOR VALUES FROM ('2025-04-01') TO ('2025-07-01');

CREATE TABLE booking_2025_q3 PARTITION OF Booking
    FOR VALUES FROM ('2025-07-01') TO ('2025-10-01');

CREATE TABLE booking_2025_q4 PARTITION OF Booking
    FOR VALUES FROM ('2025-10-01') TO ('2026-01-01');


EXPLAIN ANALYZE 
SELECT * FROM Booking 
WHERE start_date BETWEEN '2025-01-01' AND '2025-03-31';