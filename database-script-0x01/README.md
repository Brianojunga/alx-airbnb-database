**⚙️ Notes**

Primary Keys (PK): Each entity has a unique SERIAL-based PK.

Foreign Keys (FK): All relationships follow referential integrity using ON DELETE CASCADE and ON UPDATE CASCADE.

Lookup Tables: Replace ENUMs with lookup tables for roles, statuses, and payment methods for full 3NF compliance.

Indexes: Added for columns frequently used in queries (email, host_id, location_id, etc.) to improve performance.

Check Constraints: Enforce data validity (e.g., end_date > start_date, rating BETWEEN 1 AND 5).