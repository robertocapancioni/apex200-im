-- delete process before DML form process
 flow_api_pkg.flow_delete(
        p_process_id => :PROCESS_ID
      , p_comment    => 'Eliminato '||:P3_CODICE
   );
-- create and start declarative

-- approve process after DML form process
flow_process_vars.set_var(
        pi_prcs_id   => :PROCESS_ID
      , pi_var_name  => 'OUTCOME'
      , pi_vc2_value => 'NO'
   );

flow_api_pkg.flow_complete_step(
        p_process_id  => :PROCESS_ID
      , p_subflow_id  => :SUBFLOW_ID 
      , p_step_key    => :STEP_KEY
   );
-- approve condition
select 1 
  from d601_task_inbox_vw tibx
  join d601_gruppo_approvatore_vw ga on :P3_ID = ga.documento_id
                                    and (tibx.sbfl_potential_groups = ga.gruppo and tibx.sbfl_reservation is null or
                                         tibx.sbfl_reservation = ga.utente)
                                    and ga.utente = v('APP_USER')
  where :P3_ID= to_number(tibx.sbfl_business_ref default -1 on conversion error);

-- reject process after DML form process
flow_process_vars.set_var(
        pi_prcs_id   => :PROCESS_ID
      , pi_var_name  => 'OUTCOME'
      , pi_vc2_value => 'NO'
   );

flow_api_pkg.flow_complete_step(
        p_process_id  => :PROCESS_ID
      , p_subflow_id  => :SUBFLOW_ID 
      , p_step_key    => :STEP_KEY
   );

-- reject condition
select 1 
  from d601_task_inbox_vw tibx
  join d601_gruppo_approvatore_vw ga on :P3_ID = ga.documento_id
                                    and (tibx.sbfl_potential_groups = ga.gruppo and tibx.sbfl_reservation is null or
                                         tibx.sbfl_reservation = ga.utente)
                                    and ga.utente = v('APP_USER')
  where :P3_ID= to_number(tibx.sbfl_business_ref default -1 on conversion error);

-- reserve process after DML form process
flow_api_pkg.flow_reserve_step(
        p_process_id  => :PROCESS_ID
      , p_subflow_id  => :SUBFLOW_ID 
      , p_step_key    => :STEP_KEY
      , p_reservation => :APP_USER
   );

-- reserve condition
select 1 
  from d601_task_inbox_vw tibx
  join d601_gruppo_approvatore_vw ga on :P3_ID = ga.documento_id
                                    and (tibx.sbfl_potential_groups = ga.gruppo and tibx.sbfl_reservation is null)
                                    and ga.utente = v('APP_USER')
  where :P3_ID= to_number(tibx.sbfl_business_ref default -1 on conversion error);

-- release process after DML form process
flow_api_pkg.flow_release_step(
        p_process_id  => :PROCESS_ID
      , p_subflow_id  => :SUBFLOW_ID 
      , p_step_key    => :STEP_KEY
   );
-- release condition
select 1 
  from d601_task_inbox_vw tibx
  join d601_gruppo_approvatore_vw ga on :P3_ID = ga.documento_id
                                    and (tibx.sbfl_reservation = ga.utente)
                                    and ga.utente = v('APP_USER')
  where :P3_ID= to_number(tibx.sbfl_business_ref default -1 on conversion error);
