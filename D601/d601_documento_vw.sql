  create or replace view d601_documento_vw as
  select r.id,
         r.codice,
         r.descrizione,
         ga.ordine,
         d.dipartimento,
         g.gruppo,
         g.gruppo_des,
         upper(u.utente)utente,
         u.nome,
         u.email
  from d601_documento r
  join d601_gruppo_approvatore ga on r.id = ga.documento_id
  join d601_gruppo g on ga.gruppo_id = g.id
  join d601_dipartimento d on g.dipartimento_id = d.id
  join d601_utente_gruppo ug on g.id = ug.gruppo_id
  join d601_utente u on ug.gruppo_id = u.id
