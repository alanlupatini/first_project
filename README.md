# 🏙️ Berlin Urban Safety Analysis: A BIUS Project

## Project Overview

This project is an independent analysis conducted on behalf of the **Berlin Institute for Urban Safety (BIUS)**, a non-profit think tank. The goal is to conduct evidence-based research into the causes and consequences of crime for evidence-based policy recommendations.

---

## 💾 Data Sources

The analysis relies on merging two key public datasets, linked by geographic identifiers (postal/area codes and districts).

| Dataset                        | Source                                                    | Purpose                                                                                    |
| :----------------------------- | :-------------------------------------------------------- | :----------------------------------------------------------------------------------------- |
| **Crimes in Berlin**           | Kaggle: `martincymorek/berlin-crimes`                     | Core data for all crime counts by year and area.                                           |
| **Berlin District Population** | Kaggle: `shreejahoskerenatesh/berlin-district-population` | Provides population counts by age group and gender for calculating per-capita crime rates. |

---

## Day 1: Exploration and Hypothesis Formulation

The initial day focused on exploratory data analysis (EDA) and defining the core analytical framework.

### Analysis Goals

The project is structured around three primary goals designed to inform policymakers:

1.  **Goal A: Develop a Crime Risk Index.** Create a weighted index that combines crime rates (crime count / population) to rank districts.
2.  **Goal B: Identify Correlation between Demographics and Crime.** Determine if the proportion of specific age groups is statistically correlated with specific crime types.
3.  **Goal C: Analyze Crime Specialization and Temporal Trends.** Investigate unique crime patterns in specific districts and analyze year-over-year changes.

### Testable Hypotheses

Five testable hypotheses were established to guide the statistical analysis:

| ID     | Category                  | Hypothesis Statement                                                                                                                  |
| :----- | :------------------------ | :------------------------------------------------------------------------------------------------------------------------------------ |
| **H1** | General Crime Rate        | Districts with higher population density will have a higher absolute number of non-violent crimes.                                    |
| **H2** | General Crime Rate        | The **Regierungsviertel** will have an above-average rate of **Threat** and **Damage** (per capita).                                  |
| **H3** | Demographics (Age)        | Locations with a higher proportion of residents aged **65 and older** will show a higher rate of **Burglary** per capita.             |
| **H4** | Demographics (Age)        | Locations with a higher proportion of the **$18-27$** age group will correlate with a higher rate of **Drugs** offenses (per capita). |
| **H5** | Specific Crime (Temporal) | The rate of **Car theft** has declined over the years covered in the dataset.                                                         |

---

## Day 2: Data Cleaning and Preprocessing

The second day was dedicated to preparing the raw data for analysis by ensuring consistent formatting and readability.

### Key Cleaning Steps Performed (Python/Pandas)

1.  **Column Name Translation & Standardization:** All column names were translated and standardized (e.g., spaces replaced with underscores).
2.  **Umlaut Removal:** Umlauts and other special characters were removed from string columns (e.g., `District` names) to prevent encoding issues during merging and analysis.
3.  **Initial Dataset Analysis:** Conducted the first dataset analysis and EDA on the separate data sources to understand distributions and data quality issues.

---

Data Integration, Modeling (ERD), and Feature Engineering

Day 3 focuses on uniting the disparate data sources based on the established ERD, and preparing the calculated features for hypothesis testing.

### 1. Data Integration and Modeling (ERD) 📐

- **Action:** The **Entity-Relationship Diagram (ERD)** was formalized, establishing a robust three-table structure required for integration.
- **Relationship:** The final model confirms a **Many-to-Many** relationship between **Population** and **Crimes**, linked via the **Location** (bridge) table.
  - **Tables:** `Population` (Demographics), `Crimes` (Statistics), and `Location` (Bridge/Intermediate).
  - **Key Merge Strategy:** A **two-step inner join** is used: first linking `Crimes` to `Location`, and then linking the result to `Population` on `postal_code`.
- **Final Result:** A master DataFrame containing all crime and population statistics linked by the correct geographical and temporal keys.
