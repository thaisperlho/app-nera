create table tipo_usuario
(
    id_tipo_usuario serial
        constraint tipo_usuario_pkey
            primary key,
    tipo_usuario    varchar(45) not null,
    "updatedAt"         date         not null,
    "createdAt"         date         not null
);
create table usuario
(
    id_usuario      serial
        constraint usuario_pkey
            primary key,
    email           varchar(255),
    senha           varchar(255),
    id_tipo_usuario integer,
    "createdAt"     timestamp with time zone not null,
    "updatedAt"     timestamp with time zone not null
);


create table professor
(
    id_professor serial
        constraint professor_pkey
            primary key,
    nome         varchar(100) not null,
    cpf          varchar(14),
    id_usuario   integer,
    "updatedAt"         date         not null,
    "createdAt"         date         not null
);
create table questao
(
    id_questao          serial
        constraint questao_pkey
            primary key,
    enunciado           varchar(200) not null,
    alternativa1        varchar(100) not null,
    alternativa2        varchar(100) not null,
    alternativa3        varchar(100),
    alternativa4        varchar(100) not null,
    alternativa_correta varchar(100) not null,
    "updatedAt"         date         not null,
    "createdAt"         date         not null
);
create table trilha
(
    id_trilha          serial
        constraint trilha_pkey
            primary key,
    id_tipo_trilha     integer not null
        constraint trilha_id_tipo_trilha_fkey
            references tipo_trilha,
    id_questoes_modulo integer not null
        constraint trilha_id_questoes_modulo_fkey
            references questoes_modulo
);
create table progresso
(
    id_progresso        serial
        constraint progresso_pkey
            primary key,
    id_sala             integer not null
        constraint progresso_id_sala_fkey
            references sala,
    id_aluno            integer not null
        constraint progresso_id_aluno_fkey
            references aluno,
    questoes_resolvidas integer default 0
);

create table aluno
(
    id_aluno   serial
        constraint aluno_pkey
            primary key,
    nome       varchar(100) not null,
    cpf        varchar(14),
    id_usuario integer
);
create table modulo
(
    id_modulo serial
        constraint modulo_pkey
            primary key,
    descricao varchar(200) not null,
    tema      varchar(100) not null
);
create table percurso
(
    id_percurso         serial
        constraint percurso_pkey
            primary key,
    id_aluno            integer not null
        constraint percurso_id_aluno_fkey
            references aluno,
    id_trilha           integer not null
        constraint percurso_id_trilha_fkey
            references trilha,
    questoes_resolvidas integer default 0
);
create table tipo_trilha
(
    id_tipo_trilha serial
        constraint tipo_trilha_pkey
            primary key,
    tipo_trilha    varchar(100) not null,
    tema           varchar(100) not null,
    descricao      varchar(200) not null
);
create table sala
(
    id_sala          serial
        constraint sala_pkey
            primary key,
    codigo           varchar(50) not null,
    id_professor     integer     not null
        constraint sala_id_professor_fkey
            references professor,
    id_questoes_sala integer     not null
        constraint sala_id_questoes_sala_fkey
            references questoes_sala
);
create table questoes
(
    id_questoes serial
        constraint questoes_pkey
            primary key,
    id_questao  integer
        constraint questoes_id_questao_fkey
            references questao
);
create table questoes_sala
(
    id_questoes_sala serial
        constraint questoes_sala_pkey
            primary key,
    id_trilha        integer not null
        constraint questoes_sala_id_trilha_fkey
            references trilha
);
create table questoes_modulo
(
    id_questoes_modulo serial
        constraint questoes_modulo_pkey
            primary key,
    id_questoes        integer not null
        constraint questoes_modulo_id_questoes_fkey
            references questoes,
    id_modulo          integer not null
        constraint questoes_modulo_id_modulo_fkey
            references modulo
);

