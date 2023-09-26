update d301_documento
   set stato = 'APPROVATO'
 where id = :APEX$TASK_PK;

 update d301_documento
   set stato = 'RIFIUTATO'
 where id = :APEX$TASK_PK;