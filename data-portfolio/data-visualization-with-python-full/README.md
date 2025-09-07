# 📈 Data Visualization with Python — Retail Sales & Operations Insights

This project analyses the **Superstore dataset (Kaggle)** to uncover actionable insights in **sales, profitability, discounts, shipping, and customer segmentation**.  
It was originally completed as part of my **Data Visualization with Python module (2025)** and presented as both a full report and a poster.

👉 Dataset: [Kaggle Superstore Dataset](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final/)

---

## 🎯 Objectives
- Identify top-performing product categories and products  
- Assess the **impact of discounts** on sales and profits  
- Evaluate **shipping efficiency** and its effect on profitability  
- Segment customers and analyse **regional/state-level sales trends**  
- Track sales & profit growth over time  

---

## 🔄 Methodology
**Load → Clean → Explore → Visualize → Summarize → Recommend**

![Methodology](./docs/methodology.png)

1. Data cleaning: type conversions, duplicate removal, feature engineering (`Shipping Delay = Actual - Scheduled`)  
2. Outlier inspection (profit, sales) retained for business insight  
3. Visualizations: built in **Python (Plotly, make_subplots)** for interactivity & dashboard layouts  
4. Dashboard design: grouped multiple charts into cohesive views (Sales/Profit, Shipping, Segments)  
5. Poster summarization for academic submission  

---

## 📊 Key Findings & Insights

- **KPIs:** $2.3M sales, $286K profit, 37.9K units sold; avg. discount **15.6%**; shipping efficiency avg. **-0.36 days** (early).  
- **Profitability:** 77.7% of orders profitable; Furniture = sales-heavy but low margin; Office Supplies = high profitability ratio.  
- **Trends:** Sales steadily grew (2019–2023), but profit remained inconsistent, revealing **discount & cost issues**.  
- **Discounts:** Sales peak at 50% discounts, but profit declines sharply when discounts >20%.  
- **Shipping:** 49.1% of orders early; delays concentrated in **First/Second Class** modes, reducing profit.  
- **Segments/Regions:** Consumer segment dominates sales; West & East regions drive profit; heavy reliance on CA & NY poses risk.  

---

## 🖼 Figure Gallery

- ![KPI Card](./docs/fig_kpi.png)  
- ![Profitability](./docs/fig_profitability.png)  
- ![Trends](./docs/fig_trend.png)  
- ![Discount Impact](./docs/fig_discount.png)  
- ![Shipping Dashboard](./docs/fig_shipping.png)  
- ![Segmentation Dashboard](./docs/fig_segments.png)  
- ![Poster](./docs/poster_summary.png)  

---

## ✅ Recommendations
- Keep **discounts below 20%** to protect margins  
- Review Furniture pricing & costs to fix weak profitability  
- Improve shipping reliability in **First/Second Class** modes  
- Diversify growth beyond CA & NY to avoid over-reliance  
- Expand Technology & Office Supplies categories  

---

## 🧰 Tech Stack
- **Python**: pandas, numpy, plotly (go, make_subplots)  
- **EDA/Prep**: Jupyter Notebook  
- **Poster**: Tableau + PowerPoint  
- **Dataset**: Kaggle Superstore  

---

## 📄 Deliverables
- Full report: [Visualisation assessment report.docx](../Visualisation assessment report.docx)  
- Poster: [Poster work Visualization 240.pdf](../Poster work Visualization 240.pdf)  
- Notebook: [assessment_visualisation.ipynb](./notebooks/assessment_visualisation.ipynb)

---

Author: *Williams Providence Ogheneruese*  
Module: *Data Visualization with Python, MSc Data Science, 2025*
