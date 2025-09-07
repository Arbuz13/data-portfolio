# AWS Data Lake & Warehouse — S3 · Pentaho (Kettle) · PostgreSQL · Glue · Athena · SageMaker

This project implements a cloud data platform for retail analytics. Raw data lands in **Amazon S3** (data lake),
is cataloged with **AWS Glue**, queried in **Athena**, transformed by **Pentaho (Kettle)** into a **PostgreSQL star schema**,
and explored in **SageMaker** notebooks.

## Architecture Overview
- Data Lake (S3): `s3://<bucket>/raw/` → `s3://<bucket>/curated/`
- Catalog/Query: AWS Glue crawler + Athena external tables over S3
- ETL: Pentaho (Kettle) jobs to stage, transform, and load into warehouse
- Warehouse: PostgreSQL star schema (facts & conformed dimensions)
- Analytics: SageMaker notebook for EDA/visuals and validation
- Governance: IAM roles/policies, versioned ETL, logging, and data quality checks

See `docs/architecture.png` and `docs/star_schema.png` (export small PNGs to keep the repo light).

## How to Run
1. Warehouse: run `sql/BDCC.sql` in PostgreSQL
2. ETL: open `.kjb/.ktr` in Spoon, update connections, execute with logging
3. Lake & Catalog: upload raw CSVs to S3, run Glue crawler, validate in Athena
4. Validation: open `notebooks/groupwork.ipynb` (outputs cleared) for EDA

> Note: Large assets (e.g., full PPTX) are intentionally excluded. Keep diagrams as small PNGs.

_Last updated: 07 Sep 2025_
