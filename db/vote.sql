create table votelist (
    num number primary key,
    question varchar2(200) not null,
    sdate date,
    edate date,
    wdate date default sysdate,
    type number default 1 not null,
    active number default 1
);

create table voteitem (
    listnum number,
    itemnum number,
    item varchar2(50),
    count number default 0,
    primary key(listnum, itemnum)
);

create sequence seq_vote nocache; 


