# ETL Concepts

## What is ETL?

ETL stands for Extract, Transform, Load — the process of moving data from source
systems into a destination system where it can be analyzed or reported on.

- **Extract**: Pull raw data out of source systems. In my day-to-day work this
  is like pulling data out of `ApplicationMaster`, `ApplicationStatus`, or other
  BANCA tables — the data exists, but it's scattered across many tables and not
  yet in a form useful for analysis.
- **Transform**: Clean, reshape, and enrich the raw data — deduplicating rows,
  converting data types, joining tables together, calculating derived columns
  (similar to how a stored procedure joins `ApplicationMaster` with role-status
  tables and applies business logic before returning a result).
- **Load**: Write the transformed data into a destination — a data warehouse,
  a reporting database, or in the Fabric/Power BI world, a Lakehouse or
  Warehouse item that BI tools can query directly.

ETL is normally run as a scheduled or triggered pipeline, not manually — a
banking system that reconciles revenue daily is conceptually doing an ETL job
each night, just without calling it that.

## What is a Pipeline?

A pipeline is the automated sequence of steps that carries data from source
to destination — it's the "plumbing" that runs the Extract, Transform, and
Load stages in order, on a schedule or trigger, without someone manually
running each step. Pipelines also usually include logging, error handling,
and retries, so that if a step fails, it doesn't fail silently — similar to
how a well-written SP logs errors instead of swallowing them.

## Data Lake vs. Data Warehouse

- **Data Lake**: Stores raw, unstructured or semi-structured data in its
  original format (JSON, CSV, logs, images) — cheap, flexible storage with no
  enforced schema. Good for storing "everything, just in case," but not
  optimized for fast queries.
- **Data Warehouse**: Stores structured, cleaned, schema-enforced data —
  typically in tables with defined columns and types, optimized for fast
  analytical queries (aggregations, joins, reporting). This is closer to what
  `BancaDemo` already is: tables like `ApplicationMaster` have a fixed schema
  and are built to be queried directly.

The rough analogy: a data lake is like a shared drive full of raw exports and
backups, and a warehouse is like a properly normalized SQL Server database
built for reporting — which is the world I already work in day to day.