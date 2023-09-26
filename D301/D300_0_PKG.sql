create or replace package d300_pkg as 
    function get_for_role(p_app_id number, 
                          p_role   varchar2) return varchar2; 

    function has_user_role(p_app_id number, 
                           p_user   varchar2, 
                           p_role   varchar2) return boolean; 
    
    function insert_task_log (p_task_id number) return varchar2;
end; 
/

create or replace package body d300_pkg as 
    function get_for_role(p_app_id number, 
                          p_role   varchar2) return varchar2 
    is 
    l_utenti varchar2(100); 
    begin 
      select listagg(user_name,',') within group (order by user_name) utenti into l_utenti 
        from apex_appl_acl_user_roles  
       where application_id = p_app_id 
         and role_static_id = p_role; 
         apex_debug.info('Estratti utenti filtrando per application_id = %s e ruolo = %s e sono: %s ',p_app_id,p_role, l_utenti); 
         return l_utenti; 
    end get_for_role; 
 
    function has_user_role(p_app_id number, 
                           p_user   varchar2, 
                           p_role   varchar2) return boolean 
    is 
    begin 
      return apex_acl.has_user_role ( 
             p_application_id => p_app_id,  
             p_user_name      => p_user, 
             p_role_static_id => p_role ); 
    end has_user_role; 
 
 function insert_task_log (p_task_id number) return varchar2
 is
 l_document_id  number;
 l_task_def_name    varchar2(32);
 l_outcome_code varchar2(32);
 l_approver     varchar2(32);
 l_initiator    varchar2(32);
 l_created_on   date;
 l_updated_on   date;
 l_comments clob;
 begin 
      select detail_pk document_id, t.task_def_name, t.outcome_code, t.actual_owner, t.initiator, t.created_on, sysdate into
                     l_document_id, l_task_def_name, l_outcome_code,     l_approver, l_initiator, l_created_on, l_updated_on
        from apex_tasks t 
       where t.task_id = p_task_id;

       select json_arrayagg(json_object(text,created_on,created_by) order by created_on)c into 
              l_comments 
         from apex_task_comments where task_id = p_task_id;

    insert into d300_document_task (  document_id,       task_name,  outcome_code,   approver,   created_on,   updated_on,   comments) values
                                   (l_document_id, l_task_def_name,l_outcome_code, l_approver, l_created_on, l_updated_on, l_comments);
    return l_initiator;
 end insert_task_log;
end d300_pkg;
/