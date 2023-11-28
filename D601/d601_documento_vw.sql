create or replace view d601_documento_vw as
select distinct
            d.id
          , d.codice
          , d.descrizione
          , tibx.sbfl_potential_groups gruppo
          , case when ga.utente is not null then tibx.link_text else null end as link_text
          , case when ga.utente is not null  then 'style="display: block"' else 'style="display: none"' end as link_style
          , inst.prcs_id
          , tibx.sbfl_id 
          , tibx.sbfl_step_key step_key
          --, acld.user_name
          , tibx.SBFL_CURRENT_NAME Fase
          , inst.PRCS_INIT_BY
          , tibx.sbfl_livello_corrente livello_corrente
     from d601_documento d
left join flow_instances_vw inst
       on d.id = to_number(inst.prcs_business_ref default -1 on conversion error) and inst.dgrm_name = 'D601 Documento'
left join d601_task_inbox_vw tibx
       on d.id = to_number(tibx.sbfl_business_ref default -1 on conversion error) and tibx.sbfl_dgrm_name = 'D601 Documento'
left join d601_gruppo_approvatore_vw ga on d.id = ga.documento_id
                                       and tibx.SBFL_POTENTIAL_GROUPS = ga.gruppo
                                       and ga.utente = v('APP_USER');
