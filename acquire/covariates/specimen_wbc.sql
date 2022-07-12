WITH spec AS
(
    SELECT DISTINCT hadm_id, specimen_id, charttime
    , FARM_FINGERPRINT(CAST(specimen_id AS STRING)) AS spec_hash
    FROM `physionet-data.mimiciv_hosp.labevents`
    WHERE itemid = 51301 -- only include wbc specimens
)
, rnd AS
(
    SELECT hadm_id, specimen_id, charttime
    , ROW_NUMBER() OVER (PARTITION BY hadm_id ORDER BY charttime) AS rn_charttime
    , ROW_NUMBER() OVER (PARTITION BY hadm_id ORDER BY spec_hash) AS rn_rnd
    FROM spec
)
SELECT r.hadm_id, r.specimen_id
, r.charttime
, prev.specimen_id AS prev_specimen_id
, prev.charttime AS prev_charttime
FROM rnd r
LEFT JOIN rnd prev
    ON r.hadm_id = prev.hadm_id
    AND r.rn_charttime = prev.rn_charttime + 1
WHERE r.rn_rnd = 1
;