SELECT h.hadm_id
, CASE WHEN p.dod IS NOT NULL THEN 1 ELSE 0 END AS died
, CASE WHEN DATETIME_DIFF(p.dod, h.dischtime, DAY) < 365 THEN 1 ELSE 0 END AS one_year_mortality
FROM `physionet-data.mimiciv_hosp.admissions` h
INNER JOIN `physionet-data.mimiciv_hosp.patients` p
    ON h.subject_id = p.subject_id
;