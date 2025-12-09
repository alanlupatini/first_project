<<<<<<< HEAD
# 🏙️ Berlin Urban Safety Analysis: A BIUS Project
=======
# Project overview
The Berlin Institute for Urban Safety (BIUS)

Focus: An independent, non-profit think tank dedicated to researching the causes and consequences of crime for evidence-based policy recommendations.

This project is an independent analysis conducted on behalf of the **Berlin Institute for Urban Safety (BIUS)**, a non-profit think tank. The goal is to conduct evidence-based research into the causes and consequences of crime for evidence-based policy recommendations.
The presentation of this project is available here: https://docs.google.com/presentation/d/1Y4ldaEibWwJ1H7KI63VCK8tHZ-8zNZeO/edit?usp=sharing&ouid=105239850282776443277&rtpof=true&sd=true

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

<<<<<<< HEAD
1.  **Column Name Translation & Standardization:** All column names were translated and standardized (e.g., spaces replaced with underscores).
2.  **Umlaut Removal:** Umlauts and other special characters were removed from string columns (e.g., `District` names) to prevent encoding issues during merging and analysis.
3.  **Initial Dataset Analysis:** Conducted the first dataset analysis and EDA on the separate data sources to understand distributions and data quality issues.

---
=======
# Questions 

Goal A: Develop a Crime Risk Index.
Action: Create a weighted index that combines crime rates (crime count / population) for multiple crime categories to rank Berlin's districts/locations from safest to most dangerous. This could be a single, easily digestible metric for policymakers.

Goal B: Identify Correlation between Demographics and Crime.
Action: Determine if the proportion of specific age groups (e.g., 18 - 27 or 65 und mehr) in a location is statistically correlated with specific types of crime (e.g., street robbery or burglary).

Goal C: Analyze Crime Specialization and Temporal Trends.
Action: Investigate which types of crime are disproportionately high in specific districts (e.g., is Graffiti a unique problem for one district compared to the rest of the city?). Also, analyze year-over-year changes to identify fastest-growing or declining crime categories.


Testable Hypotheses
General Crime Rate Hypothesis
H1: Districts with a higher population density (as calculated by combining the population data with external area data, or simply assuming higher population overall) will have a higher absolute number of non-violent crimes (e.g., Theft, Damage, Graffiti).

H2: The district containing the Regierungsviertel (Government District) will have an above-average rate of Threat and Damage (per capita) compared to residential districts due to its political significance and potential for protest activity.

Demographic and Crime Type Hypotheses
H3 (Age-related): Locations with a higher proportion of residents in the 65 and older age group will show a higher rate of Burglary per capita compared to the Berlin average, as criminals may perceive these areas as containing more vulnerable targets.

H4 (Age-related): Locations with a higher proportion of the 18 - 27 age group will correlate with a higher rate of Drugs offenses (per capita), reflecting typical patterns of drug use and policing effort.

Specific Crime Hypotheses
H5 (Temporal Trend): The rate of Car theft (stolen cars) has declined over the years covered in the dataset, due to modern vehicle anti-theft technology.


# Dataset 
We used two raw datasets, one containing demographic information from Berlin's districs and another with information of different crimes commited per district. 
>>>>>>> main

Data Integration, Modeling (ERD), and Feature Engineering

<<<<<<< HEAD
Day 3 focuses on uniting the disparate data sources based on the established ERD, and preparing the calculated features for hypothesis testing.

### 1. Data Integration and Modeling (ERD) 📐
=======
- District names contain German characters that need to be cleaned out to work in UTF-8. 
- ...
- ...

## Solutions for the dataset issues
- We had to remove umlauts and eszetts, for example, substituting them with UTF-8 characters.
>>>>>>> main

- **Action:** The **Entity-Relationship Diagram (ERD)** was formalized, establishing a robust three-table structure required for integration.
- **Relationship:** The final model confirms a **Many-to-Many** relationship between **Population** and **Crimes**, linked via the **Location** (bridge) table.
  - **Tables:** `Population` (Demographics), `Crimes` (Statistics), and `Location` (Bridge/Intermediate).
  - **Key Merge Strategy:** A **two-step inner join** is used: first linking `Crimes` to `Location`, and then linking the result to `Population` on `postal_code`.
- **Final Result:** A master DataFrame containing all crime and population statistics linked by the correct geographical and temporal keys.
