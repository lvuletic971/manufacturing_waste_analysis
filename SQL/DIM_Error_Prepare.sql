--Isolating errors and causes, among other additional data, that led to waste in the production of bakery products. 
This data will serve to create two dimensions within the data warehouse: error type and error cause

--INSERT INTO [KG].[dbo].[DodatniPodaci]
SELECT 
	MSSifra AS SifrDP,
	MSTipSif AS TipDP,
	MSNaziv AS NazivDP
FROM MaliSifranti
WHERE MSTipSif IN ('VRN', 'VZN') 
