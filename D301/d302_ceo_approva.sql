declare
l_initiator varchar(32);
begin

  l_initiator := d302_pkg.insert_task_log(:APEX$TASK_ID);
update d302_documento
   set stato = 'APPROVATO'
 where id = :APEX$TASK_PK;
 end;
