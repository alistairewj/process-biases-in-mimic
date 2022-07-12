SELECT h.hadm_id
, CASE WHEN p.gender NOT IN ('M', 'F') THEN 1 ELSE 0 END AS exclusion_unknown_sex
, CASE WHEN p.anchor_age IS NULL THEN 1 ELSE 0 END AS exclusion_unknown_age
, CASE WHEN p.anchor_age > 89 THEN 1 ELSE 0 END AS exclusion_older_than_89
, CASE WHEN p.anchor_year_group NOT IN ('2011 - 2013') THEN 1 ELSE 0 END AS exclusion_outside_cohort
FROM `physionet-data.mimiciv_hosp.admissions` h
INNER JOIN `physionet-data.mimiciv_hosp.patients` p
    ON h.subject_id = p.subject_id
;