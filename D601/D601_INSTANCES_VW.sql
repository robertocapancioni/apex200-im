       CREATE OR REPLACE FORCE EDITIONABLE VIEW D601_INSTANCES_VW AS 
  select prcs.prcs_id
       , prcs.prcs_name
       , dgrm.dgrm_id
       , dgrm.dgrm_name
       , dgrm.dgrm_version
       , dgrm.dgrm_status
       , prcs.prcs_priority
       , dgrm.dgrm_category
       , prcs.prcs_status
       , prcs.prcs_init_ts
       , prcs.prcs_init_by
       , prcs.prcs_start_ts
       , prcs.prcs_due_on
       , prcs.prcs_complete_ts
       , prcs.prcs_last_update
       , prcs.prcs_last_update_by
       , prov.prov_var_vc2 as prcs_business_ref
       , p2.prov_var_num as prcs_livello_corrente
    from flow_processes prcs
    join flow_diagrams dgrm
      on dgrm.dgrm_id = prcs.prcs_dgrm_id
    left join flow_process_variables prov
      on prov.prov_prcs_id = prcs.prcs_id
     and prov.prov_var_name = 'BUSINESS_REF'
     and prov.prov_var_type = 'VARCHAR2' 
     and prov.prov_scope = 0
     left join flow_process_variables p2
        on p2.prov_prcs_id = prcs.prcs_id
       and p2.prov_var_name = 'LIVELLO_CORRENTE'
       and p2.prov_var_type = 'NUMBER' 
       and p2.prov_scope = 0
     where dgrm.dgrm_name = 'D601 Documento'
with read only
;
     
     
