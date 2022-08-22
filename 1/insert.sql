truncate table journal
;
truncate table persons
;
insert into persons (name) values ('zuzu');insert into persons (name) values ('zaza')
;
insert into journal (person, DTime, Type)
select 1, to_date('01.07.2022 09:00', 'dd.mm.yyyy hh24:mi') + level-1, '0' from dual
where to_char(to_date('01.07.2022 13:00', 'dd.mm.yyyy hh24:mi') + level-1+level-1,'d') not in ('6','7')
connect by level <= 31
;
insert into journal (person, DTime, Type)
select 1, to_date('01.07.2022 18:00', 'dd.mm.yyyy hh24:mi') + level-1, '1' from dual
where to_char(to_date('01.07.2022 13:00', 'dd.mm.yyyy hh24:mi') + level-1+level-1,'d') not in ('6','7')
connect by level <= 31
;
insert into journal (person, DTime, Type)
select 1, to_date('01.07.2022 13:00', 'dd.mm.yyyy hh24:mi') + level-1, '1' from dual
where to_char(to_date('01.07.2022 13:00', 'dd.mm.yyyy hh24:mi') + level-1+level-1,'d') not in ('6','7')
connect by level <= 31
;
insert into journal (person, DTime, Type)
select 1, to_date('01.07.2022 14:00', 'dd.mm.yyyy hh24:mi') + level-1, '0' from dual
where to_char(to_date('01.07.2022 13:00', 'dd.mm.yyyy hh24:mi') + level-1+level-1,'d') not in ('6','7')
connect by level <= 31
;
insert into journal (person, DTime, Type)
select 2, to_date('01.07.2022 09:00', 'dd.mm.yyyy hh24:mi') + level-1, '0' from dual
where to_char(to_date('01.07.2022 13:00', 'dd.mm.yyyy hh24:mi') + level-1+level-1,'d') not in ('6','7')
connect by level <= 31
;
insert into journal (person, DTime, Type)
select 2, to_date('01.07.2022 18:00', 'dd.mm.yyyy hh24:mi') + level-1, '1' from dual
where to_char(to_date('01.07.2022 13:00', 'dd.mm.yyyy hh24:mi') + level-1+level-1,'d') not in ('6','7')
connect by level <= 31
;
insert into journal (person, DTime, Type)
select 2, to_date('01.07.2022 13:00', 'dd.mm.yyyy hh24:mi') + level-1, '1' from dual
where to_char(to_date('01.07.2022 13:00', 'dd.mm.yyyy hh24:mi') + level-1+level-1,'d') not in ('6','7')
connect by level <= 31
;
insert into journal (person, DTime, Type)
select 2, to_date('01.07.2022 14:00', 'dd.mm.yyyy hh24:mi') + level-1, '0' from dual
where to_char(to_date('01.07.2022 13:00', 'dd.mm.yyyy hh24:mi') + level-1+level-1,'d') not in ('6','7')
connect by level <= 31
;
delete from journal j where j.person = 1 and trunc(j.dtime,'dd') in (trunc(to_date('05.07.2022','dd.mm.yyyy'),'dd'),trunc(to_date('12.07.2022','dd.mm.yyyy'),'dd'),trunc(to_date('13.07.2022','dd.mm.yyyy'),'dd'),trunc(to_date('19.07.2022','dd.mm.yyyy'),'dd'),trunc(to_date('26.07.2022','dd.mm.yyyy'),'dd'));
delete from journal j where j.person = 2 and trunc(j.dtime,'dd') in (trunc(to_date('05.07.2022','dd.mm.yyyy'),'dd'),trunc(to_date('12.07.2022','dd.mm.yyyy'),'dd'),trunc(to_date('19.07.2022','dd.mm.yyyy'),'dd'),trunc(to_date('20.07.2022','dd.mm.yyyy'),'dd'),trunc(to_date('26.07.2022','dd.mm.yyyy'),'dd'));
update journal set dtime = to_date('04.07.2022 09:00', 'dd.mm.yyyy hh24:mi')
where person = 2 and type = '0' and dtime = to_date('04.07.2022 10:01', 'dd.mm.yyyy hh24:mi');
update journal set dtime = to_date('07.07.2022 09:00', 'dd.mm.yyyy hh24:mi')
where person = 1 and type = '0' and dtime = to_date('07.07.2022 11:00', 'dd.mm.yyyy hh24:mi');
update journal set dtime = to_date('10.07.2022 09:00', 'dd.mm.yyyy hh24:mi')
where person = 1 and type = '0' and dtime = to_date('10.07.2022 09:40', 'dd.mm.yyyy hh24:mi');
commit
;
