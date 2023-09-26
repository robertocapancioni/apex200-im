-- create tables
create table d301_documento (
    id                             number generated by default on null as identity 
                                   constraint d301_documento_id_pk primary key,
    codice                         varchar2(20 char)
                                   constraint d301_documento_codice_unq unique not null,
    descrizione                    varchar2(50 char) not null,
    data                           date not null,
    richiedente                    varchar2(50 char) not null,
    stato                          varchar2(20 char) not null
)
;

-- load data
 
-- Generated by Quick SQL Friday September 22, 2023  15:29:31
 
/*
documento
  codice vc20 /nn /unique
  descrizione vc50 /nn
  data d /nn
  richiedente vc50 /nn
  stato vc20 /nn

# settings = { prefix: "D301", semantics: "CHAR", language: "EN", APEX: true }
*/