create table  d08_vendita 
   (
    id number generated by default on null as identity, 
	data date, 
	prodotto varchar2(50), 
	cliente varchar2(50), 
	zona_cliente varchar2(50), 
	quantita number, 
	importo number, 
	 constraint d08_vendita_id_pk primary key (id)
   )
/

create table  d08_vendita2 
   (
    id number generated by default on null as identity, 
	data date, 
	prodotto varchar2(50), 
	cliente varchar2(50), 
	zona_cliente varchar2(50), 
	quantita number, 
	importo number, 
	 constraint d08_vendita2_id_pk primary key (id)
   )
/
