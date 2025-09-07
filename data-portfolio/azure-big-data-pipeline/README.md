# Azure Big Data Pipeline — ADLS Gen2 · Databricks (Spark) · Data Factory

This project implements a cloud‑native lakehouse-style data pipeline on Microsoft Azure for a retail dataset.
It demonstrates secure ingestion to Azure Data Lake Storage Gen2, transformation at scale with Azure Databricks (Apache Spark),
and orchestration with Azure Data Factory (ADF). The design emphasizes governance, security, cost control, and monitoring.

## Problem
Retail organizations ingest diverse data (files/DBs/APIs/IoT) and need a scalable, secure, cost‑efficient pipeline to
land, curate, and analyze data with minimal operational overhead.

## Architecture Overview
- Storage: Azure Data Lake Storage Gen2 (Raw → Curated zones; Parquet/Delta for analytics)
- Compute: Azure Databricks (Spark) for batch transformations and feature engineering
- Orchestration: Azure Data Factory (pipelines, triggers, dependencies)
- Governance & Security: RBAC, Key Vault secrets, private endpoints, encryption at rest/in transit
- Monitoring: Azure Monitor, Activity Logs, and (optionally) Log Analytics for centralized observability

High-level diagram: see `docs/architecture.png` (add your draw.io export here).

## Method
1. Ingestion
   - Land source files to ADLS Gen2 Raw container (AzCopy/ADF copy activity).
   - Optional stream ingestion via Event Hubs / IoT Hub (future work).
2. Transform (Databricks)
   - Read raw data into Spark, enforce schema, clean/standardize types.
   - Derive features (temporal, operational, financial) and write Parquet/Delta to Curated zone.
3. Orchestrate (ADF)
   - Build pipelines with activities for copy → notebook jobs → validation.
   - Schedule via time or event triggers; add failure alerts.
4. Secure & Govern
   - Use RBAC & POSIX ACLs on ADLS; Key Vault for secrets; Private Endpoints to keep traffic off public internet.
5. Monitor & Optimize Cost
   - Enable Activity Logs, Azure Monitor metrics/alerts.
   - Use Databricks autoscaling and auto‑termination; lifecycle policies for storage tiers.

## Tech Stack
- Azure: ADLS Gen2, Databricks (Spark), Data Factory, Key Vault, Monitor
- Formats: Parquet / Delta
- Languages: Python (PySpark, pandas), SQL
- Tooling: draw.io for architecture, notebooks for EDA/visuals

## Repository Structure
```
azure-big-data-pipeline/
├─ README.md
├─ docs/
│  ├─ architecture.png               # export your draw.io diagram here
│  └─ cost-analysis.png              # optional Azure cost screenshot
├─ scripts/
│  ├─ spark_transform.py             # PySpark batch transform (example scaffold)
│  └─ adf_pipeline.json              # ADF pipeline export (placeholder)
├─ notebooks/
│  └─ databricks_superstore_notebook.ipynb  # Databricks notebook (from your project)
└─ sql/
   └─ curated_queries.sql            # example analytics queries over Delta/Parquet
```

## How to Run (Guide)
1. Provision Azure resources
   - Resource Group → Storage Account (ADLS Gen2) → Containers: `raw/`, `curated/`
   - Databricks Workspace + Cluster (enable auto‑termination)
   - Data Factory with Managed Identity; grant it access to Storage & Key Vault
2. Ingest data
   - Upload CSV to `raw/` (or configure ADF Copy activity / AzCopy).
3. Transform
   - Open the Databricks notebook in `notebooks/`; update storage paths/SAS/ABFS configs and run.
   - Output curated tables/files to `curated/` in Parquet/Delta.
4. Orchestrate
   - Import `scripts/adf_pipeline.json` into ADF and parameterize connections.
5. Secure & Monitor
   - RBAC on resource group & storage; secrets in Key Vault; enable Activity Logs & alerts.

## Results (Examples)
- Cleaned and standardized dataset ready for analytics (dates, missing values, duplicates handled).
- Curated Parquet/Delta outputs enable fast querying and BI consumption.
- Cost‑aware operation via autoscaling clusters and storage lifecycle policies.
- Governance in place with access controls and centralized monitoring.

## Notes on Data & Privacy
- Use public/sample data in demos; never commit secrets or PII.
- Replace any SAS tokens or keys with Key Vault references in production.

## Next Steps
- Add Delta Live Tables or Unity Catalog for lineage & governance.
- Add stream ingestion path (Event Hubs) and near‑real‑time transforms.
- Integrate BI layer (Synapse Serverless / Power BI / Databricks SQL) over curated tables.
- Add CI/CD for notebooks/pipelines (e.g., Azure DevOps or GitHub Actions).
