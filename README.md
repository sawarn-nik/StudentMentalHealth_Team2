# Student Mental Health Trend Analysis  
### Data Warehousing and Data Mining Project  

---

## Course
CSS321 – Data Warehousing and Data Mining  

## Submitted To
**Prof. Sushita Susan Joseph**

## Submission Date
March 2026

---

# Team Members

| Name | Roll Number |
|-----|-----|
| S S Pavan Charan | 2023BCS0078 |
| Nikkath Zabeen Shaik | 2023BCS0060 |
| Nikhil Kumar | 2023BCS0045 |

---

# Project Overview

Mental health among university students has become a significant concern in recent years.  
Students face multiple pressures including academic workload, financial stress, lifestyle imbalance, and social challenges.

This project performs **Student Mental Health Trend Analysis** using **Data Warehousing and Data Mining techniques**.

The system analyzes psychological, academic, and lifestyle factors to understand patterns influencing mental health and to build predictive models for identifying risk levels among students.

The project integrates multiple data analysis techniques including:

- Data preprocessing
- Exploratory Data Analysis
- Dimensionality Reduction
- Data Warehouse Modeling
- OLAP operations
- Classification algorithms
- Clustering techniques
- Association rule mining

The goal is to demonstrate a **complete DWDM workflow from ETL to predictive modeling**.

---

# Problem Statement

Student mental health is influenced by several factors including academic performance, sleep quality, lifestyle habits, and financial stress.

However, identifying relationships between these factors can be difficult due to the multidimensional nature of the data.

The problem addressed in this project is:

**How can data mining and data warehouse techniques be used to analyze student mental health trends and identify factors contributing to high mental health risk?**

---

# Project Objectives

The objectives of this project are:

- Analyze student mental health patterns using real-world data
- Identify relationships between lifestyle, academic, and psychological factors
- Perform exploratory data analysis to understand data distributions
- Build a data warehouse model for structured analytical queries
- Implement OLAP operations for multidimensional analysis
- Develop classification models to predict mental health risk levels
- Apply clustering algorithms to identify natural groups among students
- Discover relationships between variables using association rule mining

---

# Dataset Description

The dataset used in this project is a **Student Mental Health Survey Dataset** containing responses from university students.

The dataset contains demographic, academic, lifestyle, and psychological attributes that influence student mental health.

## Dataset Characteristics

Number of Records: **7022**

Number of Attributes: **20**

## Important Variables

| Attribute | Description |
|--------|--------|
| Age | Age of the student |
| Gender | Gender of student |
| Course | Academic program |
| CGPA | Academic performance |
| Stress_Level | Stress score |
| Depression_Score | Depression score |
| Anxiety_Score | Anxiety score |
| Sleep_Quality | Quality of sleep |
| Physical_Activity | Physical exercise level |
| Diet_Quality | Diet quality |
| Social_Support | Support system level |
| Financial_Stress | Financial stress level |
| Semester_Credit_Load | Academic workload |

The dataset combines multiple dimensions of student life, making it suitable for **data mining analysis**.

---

# Project Workflow

The complete project workflow consists of multiple stages:

1. Data Collection
2. ETL Process
3. Data Preprocessing
4. Exploratory Data Analysis
5. Data Warehouse Modeling
6. OLAP Operations
7. Data Mining Algorithms
8. Result Analysis

This pipeline enables a structured approach for extracting insights from student mental health data.

---

# Data Preprocessing

Before analysis, the dataset was cleaned and prepared.

The following preprocessing steps were applied:

### Duplicate Removal
Duplicate records were removed to avoid bias in analysis.

### Missing Value Handling
Missing values were replaced using **median values**, which are robust against outliers.

### Categorical Data Conversion
Categorical attributes were converted into machine-readable format.

### Outlier Detection

The **Interquartile Range (IQR) method** was used to detect extreme values.

Outlier detection was applied on:

- Stress Level
- Depression Score
- Anxiety Score

No unrealistic extreme values were found in the dataset.

---

# Smoothing and Discretization

Continuous mental health scores were converted into categories:

- Low
- Medium
- High

This discretization simplifies interpretation and enables rule-based mining techniques.

---

# Feature Engineering

A new variable called **Risk_Category** was created.

Risk levels were defined as:

High Risk → Stress ≥ 3 AND Depression ≥ 3 AND Anxiety ≥ 3

Medium Risk → Any score ≥ 2

Low Risk → Otherwise

This feature improves model performance and enables classification algorithms.

---

# Exploratory Data Analysis (EDA)

EDA was performed to understand patterns and relationships within the dataset.

Key visualizations include:

- Age Distribution
- Gender Distribution
- Course Distribution
- Stress Distribution
- Depression Distribution
- Anxiety Distribution
- Stress vs CGPA
- Sleep Quality vs Depression
- Financial Stress vs Anxiety

These plots reveal behavioral and academic patterns affecting mental health.

---

# Correlation Analysis

A correlation heatmap was created using the following variables:

- Stress Level
- Depression Score
- Anxiety Score
- CGPA
- Semester Credit Load

The analysis shows strong relationships among psychological variables such as stress, depression, and anxiety.

---

# Dimensionality Reduction (PCA)

Principal Component Analysis (PCA) was applied to reduce feature dimensionality.

Benefits of PCA:

- Removes redundancy among correlated features
- Captures maximum variance
- Simplifies high-dimensional data

PCA plots generated:

- Scree Plot
- PCA Biplot

---

# Data Warehouse Design

A **Star Schema** data warehouse was designed for analytical processing.

## Fact Table

Mental_Health_Fact

Measures:

- Stress Level
- Depression Score
- Anxiety Score
- CGPA
- Financial Stress

## Dimension Tables

Student Dimension  
Lifestyle Dimension  
Risk Dimension  
Academic Dimension  

This structure enables efficient analytical queries and multidimensional analysis.

---

# OLAP Operations

OLAP operations were implemented to analyze data from multiple perspectives.

### Roll-up
Summarizes data at higher aggregation levels.

Example: Average stress by course.

### Drill-down
Provides detailed views of aggregated data.

Example: Stress by course and gender.

### Slice
Filters data based on one dimension.

Example: Female students.

### Dice
Filters multiple dimensions simultaneously.

Example: Engineering students with high credit load.

### Pivot
Reorganizes data for comparative analysis.

---

# Classification Models

Classification algorithms were used to predict the **Risk_Category**.

The following models were implemented:

### Decision Tree

Advantages:

- Easy to interpret
- Visual representation
- Suitable for categorical prediction

### Naive Bayes

Advantages:

- Fast probabilistic model
- Performs well with large datasets

### Support Vector Machine (SVM)

Advantages:

- High accuracy
- Effective for complex decision boundaries

---

# Model Performance

| Model | Accuracy |
|------|------|
| Decision Tree | 100% |
| Naive Bayes | 99.48% |
| SVM | 99.95% |

SVM achieved the highest prediction accuracy.

---

# Clustering

Clustering was used to identify groups of students with similar mental health patterns.

Two algorithms were applied:

### K-Means Clustering

Groups students into fixed clusters based on similarity.

### Hierarchical Clustering

Creates tree-based cluster structures.

These methods help identify natural patterns in student mental health data.

---

# Association Rule Mining

Association rule mining was performed using the **Apriori Algorithm**.

Rules were discovered between variables such as:

- High Stress
- Poor Sleep
- High Depression

Example rule:

Poor Sleep → High Depression

Support and confidence metrics were used to evaluate rules.

---

# Key Insights

Several important patterns were identified:

- Stress, depression, and anxiety are strongly correlated.
- Students with poor sleep quality often show higher depression levels.
- Financial stress contributes significantly to anxiety.
- Academic workload affects stress levels.

These insights can help universities design better mental health support systems.

---

# Repository Structure

## Repository Structure

```
StudentMentalHealth_Team2/

README.md

data/
│
├── dataset_description.md
└── students_mental_health_survey.xlsx

scripts/
│
├── 01_data_preparation.R
├── 02_exploratory_analysis.R
├── 03_modeling.R
└── 04_evaluation.R

results/
│
└── figures/

presentation/
│
└── Data_Warehouse_&_Data_Mining_Project.pdf

requirements.R
```


```python

```
