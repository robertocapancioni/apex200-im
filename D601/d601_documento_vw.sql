  create or replace force editionable view "D601_DOCUMENTO_VW"  as 
    select distinct
            d.id
          , d.codice
          , d.descrizione
          , tibx.sbfl_potential_groups gruppo
          , tibx.sbfl_reservation assegnato
          , case when ga.utente is not null then tibx.link_text else null end as link_text
          , case when ga.utente is not null  then 'style="display: block"' else 'style="display: none"' end as link_style
          , inst.prcs_id
          , tibx.sbfl_id 
          , tibx.sbfl_step_key step_key
          --, acld.user_name
          , tibx.sbfl_current_name fase
          , inst.prcs_init_by
          , tibx.sbfl_livello_corrente livello_corrente
     from d601_documento d
left join d601_instances_vw inst
       on d.id = to_number(inst.prcs_business_ref default -1 on conversion error)
left join d601_task_inbox_vw tibx
       on d.id = to_number(tibx.sbfl_business_ref default -1 on conversion error)
left join d601_gruppo_approvatore_vw ga on d.id = ga.documento_id
                                       and (tibx.sbfl_potential_groups = ga.gruppo and tibx.sbfl_reservation is null or
                                            tibx.sbfl_reservation = ga.utente)
                                       and ga.utente = v('APP_USER');
