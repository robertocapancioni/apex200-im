/*
MY_TASKS        
ADMIN_TASKS     
INITIATED_BY_ME 
SINGLE_TASK 

APEX_APPROVAL.GET_TASKS (
    p_context           IN VARCHAR2 DEFAULT wwv_flow_approval_api.c_context_my_tasks,
    p_user              IN VARCHAR2 DEFAULT wwv_flow_security.g_user,
    p_task_id           IN NUMBER   DEFAULT NULL,
    p_application_id    IN NUMBER   DEFAULT NULL )
RETURN wwv_flow_t_approval_tasks pipelined;

*/

select *
  from table (
      apex_approval.get_tasks (
          p_context            => 'INITIATED_BY_ME',
          p_show_expired_tasks => :P6_SHOW_EXPIRED ) )
 where app_id = :APP_ID



select d.*,
       a.*
  from apex_tasks t
  join table (apex_approval.get_tasks ('INITIATED_BY_ME'))a
    on t.task_id = a.task_id and t.application_id = a.app_id
  join d301_documento d 
    on t.detail_pk = d.id
 where a.app_id = :APP_ID


select app_id,
       task_id,
       task_def_id,
       task_def_name,
       subject,
       initiator,
       actual_owner,
       state,
       is_completed,
       outcome,
       badge_css_classes,
       badge_text
  from table (apex_approval.get_tasks ('INITIATED_BY_ME')) 
 where app_id = :APP_ID
