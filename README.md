# 🏙️ Berlin Urban Safety Analysis: A BIUS Project

## Project Overview

This project is an independent analysis conducted on behalf of the **Berlin Institute for Urban Safety (BIUS)**, a non-profit think tank. The goal is to conduct evidence-based research into the causes and consequences of crime in Berlin to support data-driven policy recommendations for municipal safety.

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

### Data Integration and Modeling (ERD) 📐

- **Action:** The **Entity-Relationship Diagram (ERD)** was created to formally define the database structure and ensure the integrity of the merge operation.
- **Relationship:** The two datasets are linked by a **One-to-Many** relationship, where **one unique postal area** (`postal_code` in Demographics) can have **many** associated annual crime statistics records (`Code` in Crime_Statistics).
  - **PK (Demographics):** `postal_code`
  - **FK (Crime_Statistics):** `Code` references `Demographics.postal_code`
- **Action:** The two cleaned DataFrames were merged using an **inner join** on the appropriate key columns (`postal_code` and `Code`).

---
