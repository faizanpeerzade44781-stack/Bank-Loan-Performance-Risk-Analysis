<div align="center">

# 🏦 Bank Loan Portfolio & Risk Analysis

**End-to-end analysis of 38,576 loan records to quantify portfolio health, credit risk exposure, and borrower repayment behavior.**

![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-150458?style=flat-square&logo=pandas&logoColor=white)
![NumPy](https://img.shields.io/badge/NumPy-013243?style=flat-square&logo=numpy&logoColor=white)
![Excel](https://img.shields.io/badge/Excel-217346?style=flat-square&logo=microsoftexcel&logoColor=white)
![Jupyter](https://img.shields.io/badge/Jupyter-F37626?style=flat-square&logo=jupyter&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)

`#data-analytics` `#python` `#pandas` `#risk-analysis` `#banking` `#fintech` `#excel` `#portfolio-project`

</div>

<!-- 🖼️ DASHBOARD / REPORT SCREENSHOT — replace with an actual PNG export from your PDF/PPT -->
<p align="center"><img src="assets/report_preview.png" alt="Bank Loan Analysis Report Preview" width="850"/></p>

---

## 📖 Table of Contents
- [Business Problem](#-business-problem)
- [Objectives](#-objectives)
- [Dataset](#-dataset)
- [Tech Stack](#-tech-stack)
- [Folder Structure](#-folder-structure)
- [Installation](#-installation)
- [Data Cleaning Steps](#-data-cleaning-steps)
- [Exploratory Data Analysis](#-exploratory-data-analysis)
- [KPIs](#-key-performance-indicators)
- [Risk Analysis](#️-bad-loan--risk-analysis)
- [Business Insights](#-business-insights)
- [Recommendations](#-recommendations)
- [Dashboard / Report](#-dashboard--report-preview)
- [Future Improvements](#-future-improvements)
- [License](#-license)
- [Acknowledgements](#-acknowledgements)

---

## 🧩 Business Problem

A retail lender needs a clear, data-backed view of its loan book to answer three questions leadership asks every quarter: *Is the portfolio growing profitably? How much of it is at risk? Which borrower segments should we lend to more (or less) confidently?* Without a consolidated view, these questions get answered anecdotally by branch managers instead of by the data.

## 🎯 Objectives

- Measure overall **loan portfolio performance** (funded vs. received amounts)
- Track **month-to-date (MTD)** loan issuance and collection trends
- Quantify **bad-loan exposure and recovery rate**
- Profile **borrower demographics and stability** (employment tenure, home ownership)
- Translate findings into **credit policy and lending strategy recommendations**

## 💾 Dataset

<details>
<summary><b>Click to expand dataset details</b></summary>

| Attribute | Detail |
|---|---|
| Source | Bank loan portfolio dataset (Excel) |
| Granularity | One row per loan application |
| Records | 38,576 loan applications |
| Format | `.xlsx` |

**Key columns**

| Column | Description |
|---|---|
| `id` | Unique loan application ID |
| `issue_date` | Date the loan was issued |
| `loan_amount` | Funded principal amount |
| `total_payment` | Total amount received to date |
| `loan_status` | Fully Paid / Charged Off / Current |
| `int_rate` | Interest rate on the loan |
| `dti` | Debt-to-income ratio |
| `emp_length` | Borrower's employment tenure |
| `home_ownership` | RENT / OWN / MORTGAGE |
| `address_state` | Borrower's U.S. state |

</details>

## 🧰 Tech Stack

| Layer | Tools |
|---|---|
| Analysis | Python (Pandas, NumPy) |
| Visualization | Matplotlib, Seaborn |
| Source data | Excel |
| Environment | Jupyter Notebook |
| Reporting | PDF report, PowerPoint executive deck |

## 📁 Folder Structure

```
Bank-Loan-Risk-Analysis/
│
├── data/
│   └── financial_loan.xlsx              # Raw source dataset
│
├── notebooks/
│   └── Bank_Loan_Analysis.ipynb         # Full cleaning + EDA + KPI notebook
│
├── reports/
│   ├── Bank-Loan-Analysis-Report.pdf    # Written findings report
│   └── Problem_Statement.pptx           # Executive summary deck
│
├── assets/
│   └── report_preview.png               # Screenshot(s) for this README
│
├── README.md
└── LICENSE
```

## ⚙️ Installation

```bash
# 1. Clone the repository
git clone https://github.com/faizanpeerzade44781-stack/Bank-Loan-Risk-Analysis.git
cd Bank-Loan-Risk-Analysis

# 2. Create a virtual environment (recommended)
python -m venv venv
source venv/bin/activate      # Windows: venv\Scripts\activate

# 3. Install dependencies
pip install pandas numpy matplotlib seaborn openpyxl jupyter

# 4. Launch the notebook
jupyter notebook notebooks/Bank_Loan_Analysis.ipynb
```

## 🧹 Data Cleaning Steps

1. Converted `issue_date` and related fields to proper `datetime` dtype
2. Standardized categorical text values (e.g., loan status, home ownership labels)
3. Handled missing / inconsistent entries prior to aggregation
4. Engineered derived fields: monthly trend buckets, MTD metrics, bad-loan flag, DTI bucket

## 🔎 Exploratory Data Analysis

- **Trend analysis** — monthly loan issuance vs. monthly amount received, checked for seasonality
- **Regional analysis** — state-level concentration of applications (growth vs. concentration risk)
- **Borrower profiling** — repayment behavior by employment tenure and home ownership
- **Home ownership heatmap** — cross-tab of ownership type against loan status

## 📊 Key Performance Indicators

| Metric | Value |
|---|---|
| Total Loan Applications | **38,576** |
| Total Funded Amount | **$435.8M** |
| Total Amount Received | **$473.1M** |
| MTD Applications (Dec 2021) | **4,314** |
| MTD Funded Amount (Dec 2021) | **$54.0M** |
| MTD Amount Received (Dec 2021) | **$58.1M** |
| Average Interest Rate | **12.0%** |
| Average Debt-to-Income (DTI) | **13.3%** |

> **Read:** Total amount received exceeds total funded amount portfolio-wide, indicating the book is in a healthy collections cycle overall — the risk that matters is concentrated in a subset of loans, not the portfolio as a whole.

## ⚠️ Bad Loan & Risk Analysis

| Metric | Value |
|---|---|
| Bad Loan Rate | **13.8%** |
| Bad Loan Applications | **5,333** |
| Bad Loan Funded Amount | **$65.5M** |
| Bad Amount Recovered | **$37.3M** |
| Recovery Rate | **~57%** |

## 💡 Business Insights

- Roughly **1 in 7 loans (13.8%)** is classified as bad, representing a moderate but non-trivial risk concentration
- Only **~57% of bad-loan principal** is ultimately recovered — the remaining ~43% is a direct write-off cost
- **Home ownership status** is a meaningfully strong signal: OWN/MORTGAGE borrowers show more stable repayment than RENT borrowers
- **Longer employment tenure** correlates with lower default risk
- Application volume is **not evenly distributed geographically** — a handful of states account for a disproportionate share

## ✅ Recommendations

1. **Tighten underwriting for high-risk segments**: weight `home_ownership = RENT` and short `emp_length` more heavily in approval scoring
2. **Set a recovery-rate target**: with recovery currently at ~57%, even a 5-point improvement in collections on bad loans is worth several million dollars at this book size
3. **Watch state concentration**: states with outsized application share should be reviewed for both growth potential and default correlation before further marketing spend
4. **Build a DTI-based risk tier**: borrowers above the 13.3% average DTI should carry a distinct risk premium or additional review step

## 🖼️ Dashboard / Report Preview

<!-- Replace these with actual exported PNGs from your PDF/PPT deliverables -->
<p align="center">
  <img src="assets/kpi_summary.png" alt="KPI Summary" width="45%"/>
  <img src="assets/risk_breakdown.png" alt="Risk Breakdown" width="45%"/>
</p>

## 🔮 Future Improvements

- [ ] Rebuild this analysis in SQL to demonstrate query-layer KPI computation (not just Pandas)
- [ ] Add a logistic regression baseline to predict `bad_loan` flag from borrower attributes
- [ ] Convert the static PDF/PPT into a live Power BI dashboard with slicers by state and loan status
- [ ] Add automated data-quality checks (e.g., `great_expectations` or simple assertion tests)
- [ ] Publish the notebook's core logic as reusable `.py` scripts, not just an `.ipynb`

## 📄 License

Licensed under the [MIT License](LICENSE) — free to use, modify, and distribute with attribution.

## 🙏 Acknowledgements

- Dataset structure inspired by common public bank-loan analytics datasets used in the data analytics learning community
- Built as part of an independent portfolio project by **Sayed Faizan Peerzade**

---

<div align="center">

📧 [faizanpeerzade44781@gmail.com](mailto:faizanpeerzade44781@gmail.com) · 💼 [LinkedIn](https://www.linkedin.com/in/sayed-peerzade-82377a24a) · 🐙 [GitHub](https://github.com/faizanpeerzade44781-stack)

</div>
