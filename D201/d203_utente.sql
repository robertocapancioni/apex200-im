-- create tables
create table d203_utente (
    id                             number generated by default on null as identity 
                                   constraint d203_utente_id_pk primary key,
    utente                         varchar2(30 char)
                                   constraint d203_utente_utente_unq unique not null,
    email                          varchar2(255 char),
    attivo_yn                      varchar2(1 char) default on null 'Y' constraint d203_utente_attivo_yn_ck
                                   check (attivo_yn in ('Y','N')) not null
)
;

-- load data
 
-- Generated by Quick SQL Sunday May 28, 2023  14:38:41
 
/*
utente
  utente vc30 /nn /unique
  email
  attivo_yn /nn /default Y

# settings = { prefix: "D203", semantics: "CHAR", language: "EN", APEX: true }
*/