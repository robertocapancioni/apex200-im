create or replace force editionable view d601_utente_gruppo_vw as
  select ug.id,
         d.dipartimento,
         g.gruppo,
         g.gruppo_des,
         upper(u.utente)utente,
         u.nome,
         u.email
  from d601_utente_gruppo ug 
  join d601_gruppo g on ug.gruppo_id = g.id
  join d601_utente u on ug.utente_id = u.id
  join d601_dipartimento d on g.dipartimento_id = d.id
  
