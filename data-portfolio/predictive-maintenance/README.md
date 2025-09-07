# Predictive Maintenance — Multiclass Failure Classification (XGBoost · Random Forest · SHAP · Streamlit)

This project builds a **Predictive Maintenance (PdM)** pipeline that classifies **machine failure types** from sensor data.
It covers **EDA → preprocessing → feature engineering → modeling (LR / RF / XGB) → class imbalance (SMOTE) → tuning → SHAP explainability → deployment (Streamlit)**.

> **Goal:** reduce unplanned downtime by accurately predicting failure types and providing interpretable insights for maintenance teams.

---

## 📦 Project Highlights

- **Two tasks:** Binary (Failure vs No Failure) and **Multiclass** (6 classes: No Failure, Heat Dissipation, Power, Overstrain, Tool Wear, Random).
- **Models:** Logistic Regression (baseline), **Random Forest**, **XGBoost** (best overall).
- **Preprocessing:** outlier capping (Winsorization), **feature scaling**, and **feature engineering** (`temperature_diff = process - air`).
- **Imbalance handling:** **SMOTE** for minority classes.
- **Explainability:** **SHAP** global & local explanations (summary, violin, force/waterfall).
- **Deployment:** **Streamlit app** with on-demand prediction + SHAP waterfall for the predicted class.

---

## 🔄 Methodology

**Ingest → EDA → Clean → Engineer → Scale/Split → Train → Tune → Explain → Deploy**

![Methodology](./docs/methodology.png)
*Figure 1: Methodology flow (replace with your diagram).*

**Key steps**
1. Load dataset; audit types, nulls, duplicates.
2. Remove non-predictive identifiers; encode categorical `Type (L/M/H) → Type_encoded`.
3. **Winsorize** outliers for `Rotational speed [rpm]` and `Torque [Nm]`.
4. Engineer **`temperature_diff = Process temperature - Air temperature`**.
5. **Scale** numeric features; **train/test split** (80/20).
6. Train LR/RF/XGB for **binary** & **multiclass**; handle class imbalance with **SMOTE**.
7. **Tune** (RandomizedSearchCV) RF/XGB; evaluate with accuracy, precision, recall, F1, ROC.
8. **Explain** predictions using **SHAP**.
9. Package best **XGBoost** as a **joblib pipeline** and deploy with **Streamlit** (`app/app.py`).

---

## 🏗 Data & Features

- **Inputs:** `Air temperature [K]`, `Process temperature [K]`, `Rotational speed [rpm]`, `Torque [Nm]`, `Tool wear [min]`, `Type_encoded`
- **Engineered:** `temperature_diff = Process temperature - Air temperature`
- **Targets:**
  - **Binary:** `Target` (0 = No Failure, 1 = Failure)
  - **Multiclass:** `Failure type` → `{0..5}` (No Failure, Heat Dissipation, Power, Overstrain, Tool Wear, Random)

---

## 📈 Results (from dissertation/experiments)

- **Binary classification**
  - **Random Forest / XGBoost:** **Accuracy ≈ 0.9845**, strong recall for failure class
  - Logistic Regression: high accuracy but low failure recall
- **Multiclass classification (after tuning)**
  - **XGBoost:** **Accuracy ≈ 0.97**
  - **Random Forest:** Accuracy ≈ 0.94
- **Top features (SHAP):** **Torque [Nm]**, **Tool wear [min]**, **Rotational speed [rpm]**, **temperature_diff**

> *Exact confusion matrices, ROC, and SHAP plots should be exported to `docs/` and referenced below.*

---

## 🖼 Figures & Diagrams

- **Methodology:** `./docs/methodology.png`
- **EDA:** distributions, outliers before/after winsorization (`./docs/eda_*.png`)
- **Confusion matrices & ROC:** `./docs/confusion_*.png`, `./docs/roc_*.png`
- **SHAP:** `./docs/shap_summary.png`, `./docs/shap_violin.png`, `./docs/shap_force.png` (or waterfall)
- **Streamlit:** app screenshots `./docs/streamlit_ui.png`, `./docs/streamlit_pred.png`

> Place your images in the `docs/` folder using the filenames above so they render here.

---

## 🗂 Repository Structure

```
predictive-maintenance/
├─ README.md
├─ app/
│  └─ app.py                           # Streamlit app (uses models/xgb_multiclass_pipeline.pkl)
├─ models/
│  └─ .gitkeep                         # place trained pipeline here (joblib)
├─ notebooks/
│  └─ my_project_pdm.ipynb            # full notebook (outputs cleared if large)
├─ scripts/
│  ├─ train_xgb.py                     # training scaffold to reproduce the pipeline
│  └─ requirements.txt                 # minimal environment
├─ docs/
│  ├─ methodology.png                  # Fig 1
│  ├─ eda_distributions.png
│  ├─ eda_outliers_before.png
│  ├─ eda_outliers_after.png
│  ├─ confusion_binary.png
│  ├─ roc_binary.png
│  ├─ confusion_multiclass.png
│  ├─ roc_multiclass.png
│  ├─ shap_summary.png
│  ├─ shap_violin.png
│  ├─ shap_force.png
│  ├─ streamlit_ui.png
│  └─ streamlit_pred.png
└─ data/
   └─ README.md                       # put sample or synthetic data here if needed
```

---

## 🧪 Reproduce: Train the XGBoost Multiclass Model

```bash
# 1) Create & activate a venv (recommended)
python -m venv .venv
source .venv/bin/activate   # Windows: .venv\Scripts\activate

# 2) Install deps
pip install -r scripts/requirements.txt

# 3) Train & export joblib pipeline
python scripts/train_xgb.py --data ./data/predictive_maintenance.csv --out ./models/xgb_multiclass_pipeline.pkl
```

**Notes**
- Ensure your CSV columns match the feature names in this repo.
- The training script performs: load → clean → winsorize → encode → scale → SMOTE → train → save pipeline.

---

## ▶️ Run the Streamlit App

```bash
# In the project root
streamlit run app/app.py
```
The app expects `./models/xgb_multiclass_pipeline.pkl`. After training, ensure the file exists at that path.

---

## 🔍 Model Explainability (SHAP)

The app computes a **SHAP waterfall** for the predicted class on the provided input.  
Export your **global SHAP** plots (summary/violin) from the notebook into `./docs/` and reference them here.

---

## 📄 Data & Ethics

- Use only **public/synthetic** data in this repo.
- Never commit secrets or sensitive data.
- Document assumptions and preprocessing choices for reproducibility.

---

## ✅ Credits

- Dissertation/Report: *Predictive Maintenance in Manufacturing Industries: Leveraging Machine Learning for Operational Efficiency* (2025)
- Author: **Williams Providence Ogheneruese**

_Last updated: 07 Sep 2025_
