truncate table records1;
truncate table products1;
truncate table catalog1;
truncate table units;
;
INSERT ALL
   into units (id,name) VALUES (1,'штуки')
   into units (id,name) VALUES (2,'килограммы')
   into units (id,name) VALUES (3,'литры')
SELECT 1 FROM DUAL
;
INSERT ALL
   into catalog1 (cid,par_cid, rname, rdescr, rcdate) VALUES (1,null, 'товары на продажу', 'товары из поставок или будущих поставок, ожидающие продажи', trunc(to_date('01.01.2000','dd.mm.yyyy'),'dd'))
   into catalog1 (cid,par_cid, rname, rdescr, rcdate) VALUES (2,1,'компьютерные комплектующие', 'компьютерные комплектующие(gpu,cpu,ssd,hdd...)', trunc(to_date('01.02.2000','dd.mm.yyyy'),'dd'))
   into catalog1 (cid,par_cid, rname, rdescr, rcdate) VALUES (3,2,'gpu', 'видеокарты', trunc(to_date('01.03.2000','dd.mm.yyyy'),'dd'))
   into catalog1 (cid,par_cid, rname, rdescr, rcdate) VALUES (4,2,'cpu', 'процессоры', trunc(to_date('01.03.2000','dd.mm.yyyy'),'dd'))
   into catalog1 (cid,par_cid, rname, rdescr, rcdate) VALUES (5,2,'ssd', 'м¤гкотельные накопители', trunc(to_date('01.03.2000','dd.mm.yyyy'),'dd'))
   into catalog1 (cid,par_cid, rname, rdescr, rcdate) VALUES (6,5,'ssd 2.5 sata', 'м¤гкотельные накопители 2.5 sata', trunc(to_date('01.05.2000','dd.mm.yyyy'),'dd'))
   into catalog1 (cid,par_cid, rname, rdescr, rcdate) VALUES (7,5,'ssd 3.5 sata', 'м¤гкотельные накопители 3.5 sata', trunc(to_date('01.04.2000','dd.mm.yyyy'),'dd'))
   into catalog1 (cid,par_cid, rname, rdescr, rcdate) VALUES (8,5,'ssd m2', 'м¤гкотельные накопители m2', trunc(to_date('01.04.2000','dd.mm.yyyy'),'dd'))
   into catalog1 (cid,par_cid, rname, rdescr, rcdate) VALUES (9,2,'hdd', 'твердотельные накопители', trunc(to_date('01.06.2000','dd.mm.yyyy'),'dd'))
   into catalog1 (cid,par_cid, rname, rdescr, rcdate) VALUES (10,9,'hdd 2.5 sata', 'твердотельные накопители 2.5 sata', trunc(to_date('01.04.2000','dd.mm.yyyy'),'dd'))
   into catalog1 (cid,par_cid, rname, rdescr, rcdate) VALUES (11,9,'hdd 3.5 sata', 'твердотельные накопители 3.5 sata', trunc(to_date('01.04.2000','dd.mm.yyyy'),'dd'))
   into catalog1 (cid,par_cid, rname, rdescr, rcdate) VALUES (12,1,'автомобильные расходники', 'автомобильные расходники', trunc(to_date('01.04.2000','dd.mm.yyyy'),'dd'))
   into catalog1 (cid,par_cid, rname, rdescr, rcdate) VALUES (13,12,'антифриз', 'антифриз', trunc(to_date('01.04.2000','dd.mm.yyyy'),'dd'))
SELECT 1 FROM DUAL
;
INSERT ALL
   into products1 (pid,rcid, pname, pdescr, punit,pper) values (1,3,'rtx 3060 ti','nvidia geforce rtx 3060 ti',1,1)
   into products1 (pid,rcid, pname, pdescr, punit,pper) values (2,3,'rtx 2060 ti','nvidia geforce rtx 2060 ti',1,2)
   into products1 (pid,rcid, pname, pdescr, punit,pper) values (3,4,'core i5 11600 kf','intel core i5 11600 kf',1,1)
   into products1 (pid,rcid, pname, pdescr, punit,pper) values (4,4,'core i3 11600 kf','intel core i3 11400 kf',1,2)
   into products1 (pid,rcid, pname, pdescr, punit,pper) values (5,6,'samsung 500 gb','samsung 500 gb rev 1',1,1)
   into products1 (pid,rcid, pname, pdescr, punit,pper) values (6,7,'kingstone 500 gb','kingstone 500 gb rev 1',1,2)
   into products1 (pid,rcid, pname, pdescr, punit,pper) values (7,7,'samsung 500 gb','samsung 500 gb rev 2',1,1)
   into products1 (pid,rcid, pname, pdescr, punit,pper) values (8,8,'kingstone 500 gb m2','kingstone 500 gb rev 2',1,2)
   into products1 (pid,rcid, pname, pdescr, punit,pper) values (9,10,'samsung 500 gb','samsung 500 gb rev 3',1,1)
   into products1 (pid,rcid, pname, pdescr, punit,pper) values (10,11,'kingstone 500 gb','kingstone 500 gb rev 3',1,2)
   into products1 (pid,rcid, pname, pdescr, punit,pper) values (11,13,'sintec g12','антифриз sintec g12',3,2)
SELECT 1 FROM DUAL
;
INSERT ALL
       into records1 (rpid,rdate, incoming, quantity, rate) values (1,trunc(to_date('01.01.2001','dd.mm.yyyy'),'dd'),'1',100,100)
       into records1 (rpid,rdate, incoming, quantity, rate) values (2,trunc(to_date('01.01.2001','dd.mm.yyyy'),'dd'),'1',100,101)
       into records1 (rpid,rdate, incoming, quantity, rate) values (3,trunc(to_date('01.01.2001','dd.mm.yyyy'),'dd'),'1',100,102)
       into records1 (rpid,rdate, incoming, quantity, rate) values (4,trunc(to_date('01.01.2001','dd.mm.yyyy'),'dd'),'1',100,103)
       into records1 (rpid,rdate, incoming, quantity, rate) values (5,trunc(to_date('01.01.2002','dd.mm.yyyy'),'dd'),'1',100,104)
       into records1 (rpid,rdate, incoming, quantity, rate) values (6,trunc(to_date('01.01.2002','dd.mm.yyyy'),'dd'),'1',100,105)
       into records1 (rpid,rdate, incoming, quantity, rate) values (7,trunc(to_date('01.01.2002','dd.mm.yyyy'),'dd'),'1',100,106)
       into records1 (rpid,rdate, incoming, quantity, rate) values (8,trunc(to_date('01.01.2002','dd.mm.yyyy'),'dd'),'1',100,107)
       into records1 (rpid,rdate, incoming, quantity, rate) values (9,trunc(to_date('01.01.2002','dd.mm.yyyy'),'dd'),'1',100,108)
       into records1 (rpid,rdate, incoming, quantity, rate) values (10,trunc(to_date('01.01.2002','dd.mm.yyyy'),'dd'),'1',100,109)
       into records1 (rpid,rdate, incoming, quantity, rate) values (11,trunc(to_date('01.01.2002','dd.mm.yyyy'),'dd'),'1',100,110)
       into records1 (rpid,rdate, incoming, quantity, rate) values (8,trunc(to_date('01.01.2002','dd.mm.yyyy'),'dd'),'0',10,200)
       into records1 (rpid,rdate, incoming, quantity, rate) values (9,trunc(to_date('01.01.2002','dd.mm.yyyy'),'dd'),'0',11,201)
       into records1 (rpid,rdate, incoming, quantity, rate) values (10,trunc(to_date('01.01.2002','dd.mm.yyyy'),'dd'),'0',12,202)
       into records1 (rpid,rdate, incoming, quantity, rate) values (11,trunc(to_date('01.01.2002','dd.mm.yyyy'),'dd'),'0',13,203)
SELECT 1 FROM DUAL
