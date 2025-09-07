# Data Cleaning with Python — From Raw Excel to Analysis-Ready CSV

This mini-project demonstrates how to take a **messy Excel dataset** and transform it into a **clean, structured CSV** ready for analysis.  
It highlights core **data wrangling** skills that are essential in every analytics and data engineering workflow.

---

## Objectives
- Audit the raw dataset for missing values, duplicates, and inconsistent formatting  
- Apply cleaning steps: drop/rename columns, handle nulls, standardize types  
- Export a clean, well-structured CSV for downstream use  

---

## Methodology

**Load → Inspect → Clean → Validate → Export**

1. **Load** the raw Excel dataset (`unclean_dataset.xlsx`).  
2. **Inspect** columns, missingness, data types.  
3. **Clean**:  
   - Remove duplicates  
   - Standardize column names  
   - Fill or drop null values  
   - Convert types (e.g., dates, numerics)  
4. **Validate** row counts, schema, summary stats.  
5. **Export** cleaned data to CSV (`cleaned_excel_file.csv`).  

---

---

## Repository Structure

```
data-cleaning-with-python/
├─ notebooks/data_cleaning.ipynb     # Jupyter notebook with full workflow
├─ data/unclean_dataset.xlsx         # raw data
├─ data/cleaned_excel_file.csv       # final cleaned data
└─ docs/before_after.png             # screenshot of transformation
```

---

## Tech Stack
- **Python**: pandas, numpy  
- **Excel/CSV**: openpyxl engine for Excel, pandas I/O for CSV  
- **Jupyter** for workflow documentation  

---

## How to Run

```bash
# Install dependencies
pip install -r scripts/requirements.txt

# Open notebook
jupyter notebook notebooks/data_cleaning.ipynb
```

---

## Outcome
- A cleaned dataset with consistent schema, no duplicates, and valid types.  
- Workflow reproducible in `data_cleaning.ipynb`.  

---

Author: *Williams Providence Ogheneruese*  
Year: 2025
