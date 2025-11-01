**Database Indexing Report**

The goal of this task was to improve query performance on the Users, Property, and Booking tables by identifying high-usage columns and creating indexes on them.

Indexes help the database locate data faster, especially in queries with WHERE, JOIN, or ORDER BY clauses.


**Test Query Performance**

To evaluate the impact of indexing, we ran a set of test queries before and after creating the indexes. The queries were designed to simulate common operations on the database.

**Results Before**

Seq Scan on Booking  (cost=0.00..120.00 rows=10 width=72)
Execution Time: 1.20 ms

**Results After**
Index Scan using idx_booking_property on Booking  (cost=0.15..8.37 rows=10 width=72)
Execution Time: 0.20 ms

**Conclusion**
The implementation of indexes on high-usage columns significantly improved query performance. The execution time for the test query decreased from 1.20 ms to 0.20 ms, demonstrating the effectiveness of indexing in optimizing database operations.
However, it’s important to use them wisely, too many indexes can slow down data modification operations and consume more storage.