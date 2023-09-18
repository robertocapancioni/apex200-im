select 
      sr.ID,
      sr.DENOMINAZIONE,
      sr.INDIRIZZO,
      sr.PRIVATI,
      sr.LINGUE,
      sr.SPORT,
      sr.LATITUDINE,
      sr.LONGITUDINE,
      sr.COMUNE_ID,
       c.COMUNE,
      sr.ZONA_ID,
       z.ZONA,
      sr.CLASSIFICAZIONE_ID,
       l.CLASSIFICAZIONE
 from D201_STRUTTURE_RICETTIVE sr
 join D201_COMUNE c
   on sr.COMUNE_ID = c.COMUNE_ID
 join D201_ZONA z
   on sr.ZONA_ID = z.ZONA_ID
 join D201_CLASSIFICAZIONE l
   on sr.CLASSIFICAZIONE_ID = l.CLASSIFICAZIONE_ID