# Project overview
The Berlin Institute for Urban Safety (BIUS)

Focus: An independent, non-profit think tank dedicated to researching the causes and consequences of crime for evidence-based policy recommendations.


# Installation

1. **Clone the repository**:

```bash
git clone https://github.com/YourUsername/repository_name.git
```

2. **Install UV**

If you're a MacOS/Linux user type:

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

If you're a Windows user open an Anaconda Powershell Prompt and type :

```bash
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
```

3. **Create an environment**

```bash
uv venv 
```

3. **Activate the environment**

If you're a MacOS/Linux user type (if you're using a bash shell):

```bash
source ./venv/bin/activate
```

If you're a MacOS/Linux user type (if you're using a csh/tcsh shell):

```bash
source ./venv/bin/activate.csh
```

If you're a Windows user type:

```bash
.\venv\Scripts\activate
```

4. **Install dependencies**:

```bash
uv pip install -r requirements.txt
```

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

## Main dataset issues

- District names contain German characters that need to be cleaned out to work in UTF-8. 
- ...
- ...

## Solutions for the dataset issues
- We had to remove umlauts and eszetts, for example, substituting them with UTF-8 characters.

# Conclussions
...

# Next steps
...
