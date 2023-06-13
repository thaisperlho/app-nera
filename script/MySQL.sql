create database bdNERA

create table tipo_usuario
(
	id_tipo_usuario int auto_increment,
	tipo_usuario varchar(45) not null,
	updatedAt  datetime     null,
    createdAt  datetime     null,
	constraint tipo_usuario_pk
		primary key (id_tipo_usuario)
);

create table usuario
(
	id_usuario int auto_increment,
	email varchar(100) not null,
	senha varchar(50) not null,
	id_tipo_usuario int null,
	updatedAt  datetime     null,
    createdAt  datetime     null,
	constraint usuario_pk
		primary key (id_usuario),
	constraint fk_id_tipo_usuario
		foreign key (id_tipo_usuario) references tipo_usuario (id_tipo_usuario)
);

create table aluno
(
	id_aluno int auto_increment,
	nome varchar(100) not null,
	cpf varchar(14) null,
	id_usuario int null,
	updatedAt  datetime     null,
    createdAt  datetime     null,
	constraint aluno_pk
		primary key (id_aluno),
	constraint fk_id_usuario_aluno
		foreign key (id_usuario) references usuario (id_usuario)
);

create table professor
(
	id_professor int auto_increment,
	nome varchar(100) not null,
	cpf varchar(14) null,
	id_usuario int null,
	updatedAt  datetime     null,
    createdAt  datetime     null,
	constraint professor_pk
		primary key (id_professor),
	constraint fk_id_usuario_professor
	    foreign key (id_usuario) references usuario (id_usuario)
);

create table questao
(
	id_questao int auto_increment,
	enunciado varchar(200) not null,
	alternativa1 varchar(100) not null,
	alternativa2 varchar(100) not null,
	alternativa3 varchar(100) null,
	alternativa4 varchar(100) not null,
	alternativa_correta varchar(100) not null,
	updatedAt  datetime     null,
    createdAt  datetime     null,
	constraint questao_pk
		primary key (id_questao)
);

create table questoes
(
	id_questoes int auto_increment,
	id_questao int null,
	updatedAt  datetime     null,
    createdAt  datetime     null,
	constraint questoes_pk
		primary key (id_questoes),
	constraint fk_id_questao
		foreign key (id_questao) references questao (id_questao)
);

create table modulo
(
	id_modulo int auto_increment,
	descricao varchar(200) not null,
	tema varchar(100) not null,
	updatedAt  datetime     null,
    createdAt  datetime     null,
	constraint modulo_pk
		primary key (id_modulo)
);

create table questoes_modulo
(
	id_questoes_modulo int auto_increment,
	id_questoes int not null,
	id_modulo int not null,
	updatedAt  datetime     null,
    createdAt  datetime     null,
	constraint questoes_modulo_pk
		primary key (id_questoes_modulo),
	constraint fk_id_modulo
		foreign key (id_modulo) references modulo (id_modulo),
	constraint fk_id_questoes
		foreign key (id_questoes) references questoes (id_questoes)
);

create table tipo_trilha
(
	id_tipo_trilha int auto_increment,
	tipo_trilha varchar(100) not null,
	tema varchar(100) not null,
	descricao varchar(200) not null,
	updatedAt  datetime     null,
    createdAt  datetime     null,
	constraint tipo_trilha_pk
		primary key (id_tipo_trilha)
);

create table trilha
(
	id_trilha int auto_increment,
	id_tipo_trilha int not null,
	id_questoes_modulo int not null,
	updatedAt  datetime     null,
    createdAt  datetime     null,
	constraint trilha_pk
		primary key (id_trilha),
	constraint fk_id_questoes_modulo
		foreign key (id_questoes_modulo) references questoes_modulo (id_questoes_modulo),
	constraint id_tipo_trilha_fk
		foreign key (id_tipo_trilha) references tipo_trilha (id_tipo_trilha)
);

create table percurso
(
	id_percurso int auto_increment,
	id_aluno int not null,
	id_trilha int not null,
	updatedAt  datetime     null,
    createdAt  datetime     null,
	questoes_resolvidas int default 0 null,
	constraint percurso_pk
		primary key (id_percurso),
	constraint fk_id_aluno
		foreign key (id_aluno) references aluno (id_aluno),
	constraint fk_id_trilha
		foreign key (id_trilha) references trilha (id_trilha)
);

create table questoes_sala
(
	id_questoes_sala int auto_increment,
	id_trilha int not null,
	updatedAt  datetime     null,
    createdAt  datetime     null,
	constraint questoes_sala_pk
		primary key (id_questoes_sala),
	constraint fk_id_trilha2
		foreign key (id_trilha) references trilha (id_trilha)
);


create table sala
(
	id_sala int auto_increment,
	codigo varchar(50) not null,
	id_professor int not null,
	id_questoes_sala int not null,
	updatedAt  datetime     null,
    createdAt  datetime     null,
	constraint sala_pk
		primary key (id_sala),
	constraint fk_id_professor
		foreign key (id_professor) references professor (id_professor),
	constraint fk_id_questoes_sala
		foreign key (id_questoes_sala) references questoes_sala (id_questoes_sala)
);

create table progresso
(
	id_progresso int auto_increment,
	id_sala int not null,
	id_aluno int not null,
	updatedAt  datetime     null,
    createdAt  datetime     null,
	questoes_resolvidas int default 0 null,
	constraint progresso_pk
		primary key (id_progresso),
	constraint fk_id_aluno2
		foreign key (id_aluno) references aluno (id_aluno),
	constraint fk_id_sala
		foreign key (id_sala) references sala (id_sala)
);

