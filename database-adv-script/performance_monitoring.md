This file will keep on the basis of db optimizations using:
    *INDEXING*
        **Syntax** : 
        CREATE INDEX indx_on_email ON Users(email)
    *PARTITONING*
        **Syntax** : 
        CREATE TABLE(
            ...
        ) PARTITION BY ...()

and other methods such as schema adjustments plus using *SHOW PROFILE* or *EXPLAIN ANALYZE* to monitor the performance of a few of frequently used queries.