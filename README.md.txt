**Author:** Benjamin Philip  
**Tools:** R, ggplot2,dplyr  
**Project Type:** Statistical Analysis / Health Data  

## Project Overview
This project analyses a melanoma dataset to explore clinical factors affecting patient survival. The goal is to identify key predictors of survival using correlation analysis, regression modeling, and survival analysis techniques.

## Dataset
- Source: Retrospective patient data  
- Format: CSV

The dataset contains information on melanoma patients including:

- Survival time
- Age
- Sex
- Tumor thickness
- Ulceration status

## Analysis Performed
1. **Exploratory Data Analysis (EDA)** – Summary statistics, distributions, and outlier detection.  
2. **Normality Testing** – Shapiro-Wilk tests to assess data distribution for key variables.  
3. **Correlation Analysis** – Pearson and Spearman correlations to identify relationships between variables.  
4. **Regression Analysis** – Linear regression models to quantify the impact of predictors on survival outcomes.  
5. **Survival Analysis** – Kaplan-Meier survival curves and log-rank tests to compare survival across groups.

## Key Insights
- **Age**: Older patients showed lower survival probability.  
- **Tumor Thickness**: Strong negative correlation with survival; thicker tumors are associated with poorer outcomes.  
- **Ulceration Status**: Patients with ulcerated tumors had significantly reduced survival times (Kaplan-Meier, p < 0.05).  
- **Regression Model**: Age and tumor thickness were the strongest predictors of survival in multivariate analysis.

## How to Reproduce
1. Open `melanoma_dataset.csv`.  
2. Open the analysis file (`melanoma_analysis.R`).  
3. Follow the steps in the analysis file to replicate the results.  

## Project Outcome
This project demonstrates:
- Data cleaning and preparation skills  
- Statistical analysis and modeling abilities  
- Interpretation and communication of clinical data insights  

## Skills Demonstrated

- Exploratory Data Analysis (EDA)
- Statistical modelling
- Correlation analysis
- Regression modelling
- Data interpretation and reporting