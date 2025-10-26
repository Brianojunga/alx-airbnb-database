**🧩 Database Normalization**

The Airbnb database schema follows relational database normalization principles to ensure data consistency, minimize redundancy, and improve integrity.

The current schema satisfies First (1NF) and Second Normal Form (2NF) and is almost fully in Third Normal Form (3NF).
The following refinements can be applied to make it strictly 3NF-compliant:

**1. Replace ENUMs with Lookup Tables**

Currently, some attributes (e.g., User.role, Booking.status, and Payment.payment_method) use ENUMs.
Although convenient, ENUMs reduce flexibility when updating possible values.

**Normalization Action:**
Create small reference tables (e.g., UserRole, BookingStatus, PaymentMethod) and link them via foreign keys.
This ensures that allowed values are managed dynamically and prevents schema-level constraints when updating roles or statuses.

**2. Remove or Derive the total_price Attribute**

The total_price field in the Booking table can be derived from:

total_price = Property.pricepernight × number_of_days


**Normalization Action:**
Omit total_price from the table and compute it at query time, or store it in a reporting table if needed for performance optimization.
This eliminates derived data storage and upholds 3NF rules (each field must depend only on the primary key).

**3. Separate the location Attribute into Its Own Entity**

The Property table currently stores location as a single string value.
If the application scales to multiple cities, regions, or countries, it’s better to normalize location details into a dedicated table.

**Normalization Action:**
Create a Location table with columns such as:

location_id (PK)
city
region
country


Then, reference it in the Property table via a foreign key (location_id).
This enhances data consistency and enables efficient location-based queries.