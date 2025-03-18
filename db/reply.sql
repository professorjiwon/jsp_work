create table reply (
    no number primary key,
    content varchar2(500),
    ref number,
    name varchar2(20),
    rdate date
);

create sequence seq_reply NOCACHE;

insert into reply values(seq_reply.nextval, '와우 첫 댓글이다', 1, '김처음', '2025/02/01');
insert into reply values(seq_reply.nextval, '행복한 그림이네요', 1, '박행복', '2025/03/05');
insert into reply values(seq_reply.nextval, '아기가 예뻐요', 1, '나아기', '2025/03/15');

commit;



