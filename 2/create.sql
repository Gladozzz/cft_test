drop table catalog1;
drop table products1;
drop table records1;
drop table units
;
create table units (id number primary key,
  name varchar2(50)
);
COMMENT ON TABLE units IS 'еденицы измерения';
comment on column units.id is 'id еденицы измерения';
comment on column units.name is 'наименование еденицы измерения';
create table catalog1 (cid number primary key, -- id раздела
  par_cid number null references catalog1, -- ссылка на родительский раздел
  rname varchar2(400), -- наименование раздела
  rdescr varchar2(4000), -- описание
  rcdate date -- дата создания
);
COMMENT ON TABLE catalog1 IS 'разделы каталога';
comment on column catalog1.cid is 'id раздела';
comment on column catalog1.par_cid is 'ссылка на родительский раздел';
comment on column catalog1.rname is 'наименование раздела';
comment on column catalog1.rdescr is 'описание';
comment on column catalog1.rcdate is 'дата создания';
create table products1 (pid number primary key, -- id продукта
  rcid number references catalog1, -- ссылка на каталог
  pname varchar2(500), -- наименование продукта
  pdescr varchar2(4000), -- спецификация
  punit number references units, -- единица измерения
  pper number references persons -- ответственный
);
COMMENT ON TABLE products1 IS 'каталог товаров';
comment on column products1.pid is 'id продукта';
comment on column products1.rcid is 'ссылка на каталог';
comment on column products1.pname is 'наименование продукта';
comment on column products1.pdescr is 'спецификация';
comment on column products1.punit is 'единица измерения';
comment on column products1.pper is 'ответственный';
create table records1 (rpid number references products1, -- продукт
  rdate date, -- дата операции
  incoming varchar2(2) default '1', -- поступление '1', расход '0'
  quantity number, -- количество
  rate number -- цена в рублях
);
COMMENT ON TABLE records1 IS 'записи?';
comment on column records1.rpid is 'продукт';
comment on column records1.rdate is 'дата операции';
comment on column records1.incoming is 'поступление ''1'', расход ''0''';
comment on column records1.quantity is 'количество';
comment on column records1.rate is 'цена в рублях';
