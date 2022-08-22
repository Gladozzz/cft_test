drop table catalog1;
drop table products1;
drop table records1;
drop table units
;
create table units (id number primary key,
  name varchar2(50)
);
COMMENT ON TABLE units IS '������� ���������';
comment on column units.id is 'id ������� ���������';
comment on column units.name is '������������ ������� ���������';
create table catalog1 (cid number primary key, -- id �������
  par_cid number null references catalog1, -- ������ �� ������������ ������
  rname varchar2(400), -- ������������ �������
  rdescr varchar2(4000), -- ��������
  rcdate date -- ���� ��������
);
COMMENT ON TABLE catalog1 IS '������� ��������';
comment on column catalog1.cid is 'id �������';
comment on column catalog1.par_cid is '������ �� ������������ ������';
comment on column catalog1.rname is '������������ �������';
comment on column catalog1.rdescr is '��������';
comment on column catalog1.rcdate is '���� ��������';
create table products1 (pid number primary key, -- id ��������
  rcid number references catalog1, -- ������ �� �������
  pname varchar2(500), -- ������������ ��������
  pdescr varchar2(4000), -- ������������
  punit number references units, -- ������� ���������
  pper number references persons -- �������������
);
COMMENT ON TABLE products1 IS '������� �������';
comment on column products1.pid is 'id ��������';
comment on column products1.rcid is '������ �� �������';
comment on column products1.pname is '������������ ��������';
comment on column products1.pdescr is '������������';
comment on column products1.punit is '������� ���������';
comment on column products1.pper is '�������������';
create table records1 (rpid number references products1, -- �������
  rdate date, -- ���� ��������
  incoming varchar2(2) default '1', -- ����������� '1', ������ '0'
  quantity number, -- ����������
  rate number -- ���� � ������
);
COMMENT ON TABLE records1 IS '������?';
comment on column records1.rpid is '�������';
comment on column records1.rdate is '���� ��������';
comment on column records1.incoming is '����������� ''1'', ������ ''0''';
comment on column records1.quantity is '����������';
comment on column records1.rate is '���� � ������';
