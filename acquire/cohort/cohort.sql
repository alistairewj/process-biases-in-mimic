SELECT h.hadm_id
, CASE WHEN p.gender NOT IN ('M', 'F') THEN 1 ELSE 0 END AS exclusion_unknown_sex
, CASE WHEN p.anchor_age IS NULL THEN 1 ELSE 0 END AS exclusion_unknown_age
, CASE WHEN p.anchor_age > 89 THEN 1 ELSE 0 END AS exclusion_older_than_89
, CASE
    -- first admission 2008 - 2010, and the current one is at least 3 years later
    WHEN p.anchor_year_group IN ('2008 - 2010')
        AND p.anchor_year < (EXTRACT(YEAR FROM h.dischtime) + 3)
        AND EXTRACT(YEAR FROM h.dischtime) < (p.anchor_year + 6)
    WHEN p.anchor_year_group IN ('2011 - 2013')
        AND p.anchor_year < (EXTRACT(YEAR FROM h.dischtime) + 3)
    THEN 0 ELSE 1 END AS exclusion_outside_cohort
FROM `physionet-data.mimiciv_hosp.admissions` h
INNER JOIN `physionet-data.mimiciv_hosp.patients` p
    ON h.subject_id = p.subject_id
;