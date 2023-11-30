insert into d602_dipartimento (dipartimento,dipartimento_des) values ('DIP1','DIPARTIMENTO 1');
insert into d602_dipartimento (dipartimento,dipartimento_des) values ('DIP2','DIPARTIMENTO 2');
insert into d602_dipartimento (dipartimento,dipartimento_des) values ('DIP3','DIPARTIMENTO 3');
insert into d602_dipartimento (dipartimento,dipartimento_des) values ('DIP4','DIPARTIMENTO 4');

insert into d602_gruppo (gruppo,gruppo_des,dipartimento_id) values ('GRP11','GRUPPO 11',(select id from d602_dipartimento where dipartimento='DIP1'));
insert into d602_gruppo (gruppo,gruppo_des,dipartimento_id) values ('GRP12','GRUPPO 12',(select id from d602_dipartimento where dipartimento='DIP1'));
insert into d602_gruppo (gruppo,gruppo_des,dipartimento_id) values ('GRP21','GRUPPO 21',(select id from d602_dipartimento where dipartimento='DIP2'));
insert into d602_gruppo (gruppo,gruppo_des,dipartimento_id) values ('GRP22','GRUPPO 22',(select id from d602_dipartimento where dipartimento='DIP2'));
insert into d602_gruppo (gruppo,gruppo_des,dipartimento_id) values ('GRP31','GRUPPO 31',(select id from d602_dipartimento where dipartimento='DIP3'));
insert into d602_gruppo (gruppo,gruppo_des,dipartimento_id) values ('GRP32','GRUPPO 32',(select id from d602_dipartimento where dipartimento='DIP3'));
insert into d602_gruppo (gruppo,gruppo_des,dipartimento_id) values ('GRP41','GRUPPO 41',(select id from d602_dipartimento where dipartimento='DIP4'));
insert into d602_gruppo (gruppo,gruppo_des,dipartimento_id) values ('GRP42','GRUPPO 42',(select id from d602_dipartimento where dipartimento='DIP4'));

insert into d602_utente (utente,nome,email) values ('U111','UTENTE 111','u111@gmail.com');
insert into d602_utente (utente,nome,email) values ('U211','UTENTE 211','u211@gmail.com');
insert into d602_utente (utente,nome,email) values ('U311','UTENTE 311','u311@gmail.com');
insert into d602_utente (utente,nome,email) values ('U411','UTENTE 411','u411@gmail.com');
insert into d602_utente (utente,nome,email) values ('U112','UTENTE 112','u112@gmail.com');
insert into d602_utente (utente,nome,email) values ('U212','UTENTE 212','u212@gmail.com');
insert into d602_utente (utente,nome,email) values ('U312','UTENTE 312','u312@gmail.com');
insert into d602_utente (utente,nome,email) values ('U412','UTENTE 412','u412@gmail.com');

insert into d602_utente (utente,nome,email) values ('U121','UTENTE 121','u121@gmail.com');
insert into d602_utente (utente,nome,email) values ('U221','UTENTE 221','u221@gmail.com');
insert into d602_utente (utente,nome,email) values ('U321','UTENTE 321','u321@gmail.com');
insert into d602_utente (utente,nome,email) values ('U421','UTENTE 421','u421@gmail.com');
insert into d602_utente (utente,nome,email) values ('U122','UTENTE 122','u122@gmail.com');
insert into d602_utente (utente,nome,email) values ('U222','UTENTE 222','u222@gmail.com');
insert into d602_utente (utente,nome,email) values ('U322','UTENTE 322','u322@gmail.com');
insert into d602_utente (utente,nome,email) values ('U422','UTENTE 422','u422@gmail.com');

delete from d602_utente_gruppo;
insert into d602_utente_gruppo (utente_id,gruppo_id) select u.id utente_id,g.id gruppo_id from d602_gruppo g ,d602_utente u where u.utente='U111' and g.gruppo = 'GRP11';
insert into d602_utente_gruppo (utente_id,gruppo_id) select u.id utente_id,g.id gruppo_id from d602_gruppo g ,d602_utente u where u.utente='U112' and g.gruppo = 'GRP11';
insert into d602_utente_gruppo (utente_id,gruppo_id) select u.id utente_id,g.id gruppo_id from d602_gruppo g ,d602_utente u where u.utente='U121' and g.gruppo = 'GRP12';
insert into d602_utente_gruppo (utente_id,gruppo_id) select u.id utente_id,g.id gruppo_id from d602_gruppo g ,d602_utente u where u.utente='U122' and g.gruppo = 'GRP12';
insert into d602_utente_gruppo (utente_id,gruppo_id) select u.id utente_id,g.id gruppo_id from d602_gruppo g ,d602_utente u where u.utente='U211' and g.gruppo = 'GRP21';
insert into d602_utente_gruppo (utente_id,gruppo_id) select u.id utente_id,g.id gruppo_id from d602_gruppo g ,d602_utente u where u.utente='U212' and g.gruppo = 'GRP21';
insert into d602_utente_gruppo (utente_id,gruppo_id) select u.id utente_id,g.id gruppo_id from d602_gruppo g ,d602_utente u where u.utente='U221' and g.gruppo = 'GRP22';
insert into d602_utente_gruppo (utente_id,gruppo_id) select u.id utente_id,g.id gruppo_id from d602_gruppo g ,d602_utente u where u.utente='U222' and g.gruppo = 'GRP22';
insert into d602_utente_gruppo (utente_id,gruppo_id) select u.id utente_id,g.id gruppo_id from d602_gruppo g ,d602_utente u where u.utente='U311' and g.gruppo = 'GRP31';
insert into d602_utente_gruppo (utente_id,gruppo_id) select u.id utente_id,g.id gruppo_id from d602_gruppo g ,d602_utente u where u.utente='U312' and g.gruppo = 'GRP31';
insert into d602_utente_gruppo (utente_id,gruppo_id) select u.id utente_id,g.id gruppo_id from d602_gruppo g ,d602_utente u where u.utente='U321' and g.gruppo = 'GRP32';
insert into d602_utente_gruppo (utente_id,gruppo_id) select u.id utente_id,g.id gruppo_id from d602_gruppo g ,d602_utente u where u.utente='U322' and g.gruppo = 'GRP32';
insert into d602_utente_gruppo (utente_id,gruppo_id) select u.id utente_id,g.id gruppo_id from d602_gruppo g ,d602_utente u where u.utente='U411' and g.gruppo = 'GRP41';
insert into d602_utente_gruppo (utente_id,gruppo_id) select u.id utente_id,g.id gruppo_id from d602_gruppo g ,d602_utente u where u.utente='U412' and g.gruppo = 'GRP41';
insert into d602_utente_gruppo (utente_id,gruppo_id) select u.id utente_id,g.id gruppo_id from d602_gruppo g ,d602_utente u where u.utente='U421' and g.gruppo = 'GRP42';
insert into d602_utente_gruppo (utente_id,gruppo_id) select u.id utente_id,g.id gruppo_id from d602_gruppo g ,d602_utente u where u.utente='U422' and g.gruppo = 'GRP42';
