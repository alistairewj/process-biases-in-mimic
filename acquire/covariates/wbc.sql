SELECT sp.hadm_id
, sp.specimen_id
, le.valuenum AS wbc_value
, CASE WHEN le.flag = 'abnormal' THEN 1 ELSE 0 END AS wbc_abnormal
--, wbc_day_of_week -- cannot determine DOW in MIMIC-IV
, CAST(EXTRACT(HOUR FROM le.charttime) AS NUMERIC)
+ CAST(EXTRACT(MINUTE FROM le.charttime) AS NUMERIC)/60.0 
    AS wbc_time_of_day

-- add in previous values
, sp.prev_specimen_id
, le_prev.valuenum AS wbc_prev_value
, CASE WHEN le_prev.flag = 'abnormal' THEN 1 ELSE 0 END AS wbc_prev_abnormal
--, wbc_day_of_week -- cannot determine DOW in MIMIC-IV
, CAST(EXTRACT(HOUR FROM le_prev.charttime) AS NUMERIC)
+ CAST(EXTRACT(MINUTE FROM le_prev.charttime) AS NUMERIC)/60.0 
    AS wbc_prev_time_of_day

FROM `physionet-data.mimiciv_hosp.labevents` le
INNER JOIN `kind-lab.process_bias.specimen_wbc` sp
    ON le.specimen_id = sp.specimen_id
LEFT JOIN  `physionet-data.mimiciv_hosp.labevents` le_prev
    ON sp.prev_specimen_id = le_prev.specimen_id
    AND le_prev.itemid = 51301
WHERE le.itemid = 51301