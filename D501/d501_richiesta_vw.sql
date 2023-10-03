  create or replace force editionable view d501_richiesta_vw   as 
  select distinct
       r.id
     , r.codice
     , r.descrizione
     , r.importo
     , r.stato
     , r.created_by
     , r.created
     , case when aclr.user_name = v('APP_USER') then tibx.link_text else null end as link_text
     , case when aclr.user_name = v('APP_USER') then 'style="display: block"' else 'style="display: none"' end as link_style
     , inst.prcs_id
     , aclr.user_name
  from d501_richiesta r
  join flow_instances_vw inst
    on r.id = to_number(inst.prcs_business_ref default -1 on conversion error) and inst.dgrm_name = 'D501'
  left join flow_task_inbox_vw tibx
    on r.id = to_number(tibx.sbfl_business_ref default -1 on conversion error) and tibx.sbfl_dgrm_name = 'D501'
    -- enable authorization roles if you have lanes defined in your flow
  left join apex_appl_acl_user_roles aclr
    on upper(tibx.sbfl_potential_groups) = aclr.role_static_id and (tibx.sbfl_potential_groups != 'RICHIEDENTE' or r.created_by = aclr.user_name)
   and aclr.application_id = v('APP_ID');

/*
 usare questa condizione nella vista
 where created_by = :APP_USER or user_name = :APP_USER
*/
/*
usare #LINK_STYLE!RAW# nell attributo dell'iconcina al link documento ad esempio
    <span class="fa fa-edit" aria-hidden="true" #LINK_STYLE!RAW#></span>
*/
