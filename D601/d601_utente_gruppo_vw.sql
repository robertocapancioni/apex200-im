CREATE OR REPLACE FORCE EDITIONABLE VIEW d601_utente_gruppo_vw as
  select ug.id,
         d.dipartimento,
         g.gruppo,
         g.gruppo_des,
         upper(u.utente)utente,
         u.nome,
         u.email
  from d601_gruppo g 
  join d601_dipartimento d on g.dipartimento_id = d.id
  join d601_utente_gruppo ug on g.id = ug.gruppo_id
  join d601_utente u on ug.gruppo_id = u.id;
