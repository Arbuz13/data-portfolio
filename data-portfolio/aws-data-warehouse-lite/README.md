# AWS Data Lake & Warehouse — S3 · Pentaho (Kettle) · PostgreSQL · Glue · Athena · SageMaker

This project implements a cloud data platform for retail analytics.  
Raw data lands in **Amazon S3** (data lake), is cataloged with **AWS Glue**, queried in **Athena**, transformed by **Pentaho (Kettle)** into a **PostgreSQL star schema**, and explored in **SageMaker** notebooks.

> **Goal:** Deliver a governed, scalable pipeline from raw files to conformed dimensional models that support fast BI and ad-hoc analysis.

---

## Objectives

- Build a **data lake → warehouse** pipeline with clear **Raw → Curated** zones.  
- Enforce **schema, quality, and governance** before loading into the warehouse.  
- Provide **dimensional models** (conformed dimensions + fact tables) optimized for BI.  
- Enable **self-service analytics** (Athena, SQL) and **notebook-driven EDA** (SageMaker).  
- Capture **operational metadata** (row counts, rejects, logs) for auditability.

---

## Methodology

**Ingestion → Catalog → Transform → Model → Validate → Serve**

<img width="1004" height="801" alt="C0BBED8C-0F0E-4617-A120-D287151946E9" src="https://github.com/user-attachments/assets/fc01211b-5233-4dd3-982f-c1f5e779e37a" /> 

*Figure 1: Methodology flow (replace with your diagram).*

**Steps**
1. **Ingest** to S3 Raw zone.  
2. **Catalog** with Glue, validate in Athena.  
3. **Transform & Load** using Pentaho.  
4. **Model** into star schema in PostgreSQL.  
5. **Validate** metrics via Athena/Postgres queries and SageMaker EDA.  
6. **Serve** to BI tools for dashboards.  

---

## Architecture

### Data Lake (S3)

<img width="820" height="438" alt="Screenshot 2025-05-11 at 6 00 53 pm" src="https://github.com/user-attachments/assets/9335e85f-60ed-4ae3-b16c-c8925eff142e" /> 

*Figure 2: Data Lake design with Raw and Curated zones.*

- Buckets: `s3://<bucket>/raw/` → `s3://<bucket>/curated/`  
- **Glue** for cataloging, **Athena** for query.  
- **Parquet/Delta** formats recommended for Curated.  
- Security via IAM policies, bucket encryption, VPC endpoints.  

### Data Warehouse (PostgreSQL)

<img width="803" height="508" alt="Screenshot 2025-05-11 at 11 02 12 am" src="https://github.com/user-attachments/assets/42e806ff-f536-4593-8877-e8839d8dd50b" /> 

*Figure 3: Data Warehouse schema in PostgreSQL.*

- **Staging schema** (raw mirror).  
- **DW schema** (dimensions + facts).  
- Optimized for BI workloads (indexes, constraints).  

---

## Data Model (ERD)

<img width="1512" height="953" alt="Screenshot 2025-05-12 at 11 16 44 pm" src="https://github.com/user-attachments/assets/88c1bd46-cff7-490a-b3ab-b32de2eaaf0a" /> 

*Figure 4: Star schema with dimensions + fact table.*

**Dimensions**
- `dim_customer` — demographics, region, segment  
- `dim_product` — category, subcategory, brand  
- `dim_order` — dates, status  
- `dim_payment` — method, provider  
- `dim_shipping` — carrier, service  
- `dim_date` — calendar hierarchy  

**Fact**
- `fact_sales` — order details, quantities, revenue, profit, tax, shipping metrics  

---

## ETL with Pentaho

ETL designed with **Kettle (Pentaho Data Integration)**:  

- **Jobs (.kjb)**: Orchestrate workflows.  
- **Transformations (.ktr)**: Handle cleaning, type casting, surrogate keys, and FK lookups.  

**Screenshots (replace with yours)**   
<img width="1512" height="953" alt="Screenshot 2025-05-12 at 11 13 48 pm" src="https://github.com/user-attachments/assets/40edb2bd-94ec-42f3-9f3d-64e9afa8f480" /> 
  *Figure 5: Loading to DW with surrogate key lookups.*  

---

## Governance · Security · Monitoring

- **Governance**: versioned ETL jobs, audit logs, lineage.  
- **Security**: IAM roles/policies, S3 bucket policies, Key Vault/secrets manager.  
- **Monitoring**: Pentaho job logs, Athena query logs, Postgres slow query logs.  
- **Cost**: Parquet/Delta compression, lifecycle rules (IA/Glacier), right-sized DB.  

---


---

## How to Run

### Prerequisites
- AWS account (S3, Glue, Athena).  
- PostgreSQL (local or managed).  
- Pentaho Data Integration (Spoon).  
- Python/Jupyter or SageMaker.  

### Steps
1. **Lake & Catalog**  
   - Upload CSVs → Raw S3 bucket.  
   - Run Glue crawler → verify in Athena.  

2. **Warehouse**  
   - Create schemas → run `sql/BDCC.sql`.  
   - Update Pentaho connections → run jobs.  

3. **Validation**  
   - Query DW with `99_sample_queries.sql`.  
   - Run `groupwork.ipynb` (or `groupwork_light.ipynb`).  

---

## Sample Queries

**Top Products by Revenue**
```sql
SELECT p.product_name, SUM(f.revenue) AS revenue
FROM dw.fact_sales f
JOIN dw.dim_product p ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 10;
SELECT c.country, SUM(f.revenue) AS total_revenue
FROM dw.fact_sales f
JOIN dw.dim_customer c ON c.customer_key = f.customer_key
GROUP BY c.country
ORDER BY total_revenue DESC;

Results & Insights

End-to-end pipeline: from S3 ingestion → PostgreSQL DW.

Optimized star schema: improved query speed for BI.

Data quality: row counts, null/type checks, rejects.

Business insights:

Top-performing categories & regions.

Shipping carrier SLA trends.

Payment method adoption.
