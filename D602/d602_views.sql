  create or replace force editionable view d602_utente_gruppo_vw as 
  select ug.id,
         d.dipartimento,
         g.gruppo,
         g.gruppo_des,
         upper(u.utente)utente,
         u.nome,
         u.email
  from d602_utente_gruppo ug 
  join d602_gruppo g on ug.gruppo_id = g.id
  join d602_utente u on ug.utente_id = u.id
  join d602_dipartimento d on g.dipartimento_id = d.id;

 create or replace force editionable view d602_gruppo_approvatore_vw as 
  select ga.id,
         ga.documento_id,
         ga.gruppo_id,
         ga.ordine,
         d.dipartimento,
         g.dipartimento_id,
         g.gruppo,
         g.gruppo_des,
         ug.utente_id,
         upper(u.utente)utente,
         u.nome,
         u.email
  from d602_gruppo_approvatore ga 
  join d602_utente_gruppo ug on ga.gruppo_id = ug.gruppo_id
  join d602_gruppo g on ug.gruppo_id = g.id
  join d602_utente u on ug.utente_id = u.id
  join d602_dipartimento d on g.dipartimento_id = d.id;
