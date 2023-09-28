-- create tables
create table d302_document_task (
    id                             number generated by default on null as identity 
                                   constraint d302_document_task_id_pk primary key,
    document_id                    number
                                   constraint d302_document_t_document_id_fk
                                   references d302_documento on delete cascade not null,
    task_name                      varchar2(32 char) not null,
    outcome_code                   varchar2(32 char) not null,
    approver                       varchar2(32 char) not null,
    created_on                     date not null,
    updated_on                     date not null,
    comments                       clob
)
;

-- table index
create index d302_document_task_i1 on d302_document_task (document_id);

-- load data
 
-- Generated by Quick SQL Thursday September 28, 2023  07:19:41
 
/*
document_task
  document_id /nn /fk documento
  task_name vc32 /nn,
  outcome_code vc32 /nn,
  approver vc32 /nn,
  created_on date /nn
  updated_on date /nn   
  comments clob

# settings = { prefix: "D302", semantics: "CHAR", language: "EN", APEX: true }
*/
