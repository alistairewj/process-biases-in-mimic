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
* exclusion_outside_cohort - Remove patients outside the 2011 - 2013 cohort.

### Variables

Variable name | Description | Timing | Aggregation | Source | Notes
--- | --- | --- | --- | --- | ---
wbc_exists | Whether a WBC was measured | Anytime during cohort period | ANY_VALUE() |  *labevents* | filter out any outpatient labs using `hadm_id`
wbc_value | The value of WBC | Random specimen | N/A | *labevents*.valuenum |
wbc_abnormal | Whether the value of WBC is abnormal | Random specimen | N/A | *labevents*.flag |
wbc_day_of_week | The day of the week the WBC is ordered | Random specimen | N/A | *labevents*.charttime |
wbc_time_of_day | The time of day the WBC is ordered | Random specimen | N/A | *labevents*.charttime |
wbc_prev_hours_between | The hours between two neighbouring tests | Specimen before random specimen above | N/A | *labevents* | Only present if two tests exist
wbc_prev_value | The value of WBC | Random specimen - 1 | N/A | *labevents*.valuenum |
wbc_prev_abnormal | Whether the value of WBC is abnormal | Random specimen - 1 | N/A | *labevents*.flag |
wbc_prev_day_of_week | The day of the week the WBC is ordered | Random specimen - 1 | N/A | *labevents*.charttime |
wbc_prev_time_of_day | The time of day the WBC is ordered | Random specimen - 1 | N/A | *labevents*.charttime |

### Outcome(s)

Variable name | Description | Timing | Aggregation | Source | Notes
--- | --- | --- | --- | --- | ---
one_year_mortality | Whether the patient died one year after hospital discharge | 1 year from dischtime | ANY_VALUE() | patients | existence of dod indicates patient died
