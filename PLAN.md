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

Provide the column names for your proposed "cohort" table, which will apply all inclusion/exclusion criteria. Include the description of the criteria, the table in the dataset you will use, and how missing data will be interpreted (e.g. missing values will be assumed to include the patient).

### Variables

List out the planned source for all covariates and exposures extracted for the study, e.g. admission source.
If describing a time-varying covariate, be specific regarding the aggregation and the time window (e.g. "lowest mean arterial pressure during the first 24 hours of the ICU stay."). The following template is a useful guide.

Variable name | Description | Timing | Aggregation | Source | Notes
--- | --- | --- | --- | --- | ---
Heart Rate Day 1 | Patient heart rate | First 24 hours of ICU stay | Highest | chartevents | 
Sedative use | Midazolam or propofol | Any time during the ICU Stay | Any value | inputevents | 

If unsure about the source, write all possibilities, and justify them in the notes.
Also include in the notes whether outliers were processed (and how), as well as the approach for missing data.

### Outcome(s)

List the outcome(s) used in the study, e.g. 28-day mortality, with similar detail as the above variables.
