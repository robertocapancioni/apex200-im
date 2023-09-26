--APPROVE
declare
l_new_task_id  number;
l_initiator varchar2(32);
begin
  l_initiator := d300_pkg.insert_task_log(:APEX$TASK_ID);
   l_new_task_id := apex_approval.create_task(
                         p_application_id => :app_id,
                         p_task_def_static_id => 'PATH_1',
                         p_initiator => l_initiator, 
                         p_parameters => apex_approval.t_task_parameters(
                                                  1 => apex_approval.t_task_parameter(static_id => 'DOCUMENT_CODE', string_value => :codice)
                                         ),
                         p_detail_pk => :apex$task_pk
                    );

   l_new_task_id := apex_approval.create_task(
                         p_application_id => :app_id,
                         p_task_def_static_id => 'PATH_2',
                         p_initiator => l_initiator, 
                         p_parameters => apex_approval.t_task_parameters(
                                                  1 => apex_approval.t_task_parameter(static_id => 'DOCUMENT_CODE', string_value => :codice)
                                         ),
                         p_detail_pk => :apex$task_pk
                    );
    
end;

--REJECT
declare
l_initiator varchar2(32);
begin

  l_initiator := d300_pkg.insert_task_log(:APEX$TASK_ID);
    
end;