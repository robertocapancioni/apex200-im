select ID,
       DENOMINAZIONE,
       INDIRIZZO,
       PRIVATI,
       LINGUE,
       SPORT,
       LATITUDINE,
       LONGITUDINE,
       COMUNE_ID,
       ZONA_ID,
       CLASSIFICAZIONE_ID,
       '{"type" : "Point","coordinates" : ['||
            replace(to_char(longitudine),',','.')||','||
            replace(to_char(latitudine ),',','.')||
       ']}'MAP
  from D201_STRUTTURE_RICETTIVE