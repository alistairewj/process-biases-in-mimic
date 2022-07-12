# Paper Reproduction

## Title of the study

**Study title**: Biases in electronic health record data due to processes within the healthcare system: retrospective observational study

**DOI**: http://dx.doi.org/10.1136/k1479

## Dataset(s) used

The original dataset was sourced from Brigham and Women's Hospital and Massachusetts General Hospital.

The dataset used in the reproduction is MIMIC-IV.

* **Dataset**: MIMIC-IV v2.0
* **DOI**: https://doi.org/10.13026/7vcr-e114
* **Citation**: Johnson, A., Bulgarelli, L., Pollard, T., Horng, S., Celi, L. A., & Mark, R. (2022). MIMIC-IV (version 2.0). PhysioNet. https://doi.org/10.13026/7vcr-e114.
* **Other info**: https://mimic.mit.edu

## Data extraction

### Inclusion/Exclusion criteria

* exclusion_unknown_sex - Remove patients with unknown sex. Will use the *patients* table.
* exclusion_unknown_age - Remove patients with unknown age. Will use the *patients* and *admissions* table, and define age as the age at first hospitalization.
* exclusion_older_than_89 - Remove patients older than 89. Will use the *patients* table. Will use the *patients* and *admissions* table, and define age as the age at first hospitalization.
* exclusion_outside_cohort - Remove patients outside the 2008 - 2010 cohort.

### Variables

Variable name | Description | Timing | Aggregation | Source | Notes
--- | --- | --- | --- | --- | ---
wbc_exists | Whether a WBC was measured | Anytime during hospital stay | ANY_VALUE() | 
*labevents* | filter out any outpatient labs using `hadm_id`

### Outcome(s)

Variable name | Description | Timing | Aggregation | Source | Notes
--- | --- | --- | --- | --- | ---
one_year_mortality | Whether the patient died one year after hospital discharge | 1 year from dischtime | ANY_VALUE() | patients | existence of dod indicates patient died
