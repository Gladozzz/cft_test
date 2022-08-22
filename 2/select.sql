with cat as (
        select
            0 type,rownum rn,level-1 lvl,c.cid,c.rname rname,
            nvl((
                select sum(r.quantity*r.rate) from products1 p join records1 r on p.pid = r.rpid
                where (p.rcid in (
                        select
                            cc.cid
                        from catalog1 cc
                        start with cc.par_cid = c.cid
                        connect by prior cc.cid = cc.par_cid) or p.rcid = c.cid)
                      and r.incoming = '1'
            ),0) income,
            nvl((
                select sum(r.quantity*r.rate) from products1 p join records1 r on p.pid = r.rpid
                where (p.rcid in (
                        select
                            cc.cid
                        from catalog1 cc
                        start with cc.par_cid = c.cid
                        connect by prior cc.cid = cc.par_cid) or p.rcid = c.cid)
                      and r.incoming = '0'
            ),0) outcome
        from catalog1 c
        start with c.par_cid is null
        connect by prior c.cid = c.par_cid
    ), prod_of_cat as (
       select 1 type,c.rn,c.lvl + 1 lvl,p.pname name
              ,sum(case when r.incoming = '1' then r.quantity*r.rate else 0 end) income
              ,sum(case when r.incoming = '0' then r.quantity*r.rate else 0 end) outcome
       from cat c join products1 p on p.rcid = c.cid left outer join records1 r on p.pid = r.rpid
       group by c.rn,c.lvl,p.pid,p.pname
    ), total as (
       select pod.type,pod.rn,pod.lvl,pod.name name,pod.income,pod.outcome
       from prod_of_cat pod
       union all
       select c.type,c.rn,c.lvl,c.rname name,c.income,c.outcome
       from cat c
       order by 2,1,4
    )
select
    rpad('|',t.lvl*6,'                   ')||
    case when t.type = 0 then '<'||t.name||'>'
         else t.name
    end s
    ,t.income,t.outcome
from total t
