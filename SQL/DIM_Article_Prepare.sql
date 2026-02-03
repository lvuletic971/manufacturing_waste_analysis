--Select for articles
--INSERT INTO [KG].[dbo].[Artikli]
SELECT 
	MpSifra AS SifraA,
	MpNaziv AS NazivA,
	MpOsnSklad AS SkladisteA,
	MpSifKarKlj AS KKljucA,
	MpSifPlaKlj AS PKljucA,
	MpSifEnoteMere1 AS JedinicaMereA,
	MpTeza AS TezinaA,
	MpOznKlas AS KlasifikacijaA,
	MpOznTez AS KategorijaTezinaA,
	MpCena AS KategorijaCenaA
FROM MaticniPodatki
WHERE MpSifKarKlj IN ('I', 'P') 
	

--Select for classification
--INSERT INTO [KG].[dbo].[Klasifikacija]
SELECT 
	KLoStZapisa AS SifraKlasif,
	KLoOpis AS OpisKlasif
FROM KlasOzn

--Select fror pricelist	
--INSERT INTO [Cenovnik]
SELECT 
	CnStZapisa AS SifraC,
	CnSifMp AS ArtiklC,
	CAST(CnDatSpremembe AS date) AS DatumC,
	CnRazTipCn AS TipCenovnika,
	CnSklad AS SkladisteC,
	CnCena AS CenaC
FROM Cenik c --to je view na KG
WHERE c.CnRazTipCn ='4' AND c.CnDatSpremembe BETWEEN '2021-10-01' AND '2021-12-31' 
ORDER BY DatumC DESC, ArtiklC
