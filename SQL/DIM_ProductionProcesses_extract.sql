/*
Purpose:
Preparation of source data for the DimProductionProcess dimension.

This script extracts production processes that led to product waste.
For each combination of item and work center, only one production process
is selected to avoid duplicates in the dimension.
*/

------------------------------------------------------------
-- Production processes (deduplicated by item and work center)
------------------------------------------------------------

;WITH cte AS (
    SELECT 
        DpSifra AS SifraRP, 
        DpNaziv AS NazivRP, 
        DpSifMp AS MatPodRP, 
        DpSifDelovnegaCentra AS RadCenRP,
        ROW_NUMBER() OVER (PARTITION BY DpSifMp, DpSifDelovnegaCentra ORDER BY DpNaziv) AS rn,
        COUNT(*) OVER (PARTITION BY DpSifMp, DpSifDelovnegaCentra) AS cnt
    FROM 
         delpostopek
)
--INSERT INTO RadniPostupci(SifraRP, NazivRP, MatPodRP,  RadCenRP)
SELECT
    SifraRP, 
    NazivRP, 
    MatPodRP, 
    RadCenRP
FROM 
    cte
WHERE 
    cnt = 1 OR (cnt > 1 AND rn = 1);
