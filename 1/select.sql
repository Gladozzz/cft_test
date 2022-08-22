with yyyy as (
        select '2022' y from dual
     ), mm as (
        select to_char(to_date('01.07.'||yyyy.y,'dd.mm.yyyy'),'mm.yyyy') my, to_char(to_date('01.07.2022','dd.mm.yyyy'),'Month') m, yyyy.y from yyyy
     ), dd as (
        select to_char(to_date('01'||mm.my,'dd.mm.yyyy')+level-1,'dd') d, mm.m, mm.y, trunc(to_date('01'||mm.my,'dd.mm.yyyy')+level-1,'dd') full from mm
        where to_char(to_date('01'||mm.my,'dd.mm.yyyy')+level-1,'mm.yyyy') = mm.my and to_char(to_date('01'||mm.my,'dd.mm.yyyy')+level-1,'d') not in ('6','7')
        connect by level <= 31
     ), dd_with_persons as (
        select dd.*,p.id p_id,p.name from dd, persons p
     )
select
     dwp.y,dwp.m,dwp.d
     ,dwp.p_id,dwp.name
     ,to_number(to_char(min(j.dtime),'sssss'))/60 - 9*60 "минуты опоздания"
from dd_with_persons dwp left outer join journal j on trunc(j.dtime,'dd') = dwp.full and dwp.p_id = j.person
where j.type = '0'
group by dwp.p_id,dwp.name,dwp.y,dwp.m,dwp.d
having to_number(to_char(min(j.dtime),'sssss'))/60/60 > 9
union
select
     dwp.y,dwp.m,dwp.d
     ,dwp.p_id,dwp.name
     ,-1 "минуты опоздания" --отсутствовал
from dd_with_persons dwp
where not exists(
          select * from journal j
          where j.type = '0' and j.person = dwp.p_id and trunc(j.dtime,'dd')=dwp.full
      )
order by 1,2,3,4
