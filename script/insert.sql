INSERT INTO public.questao (id_questao, enunciado, alternativa1, alternativa2, alternativa3, alternativa4, alternativa_correta, "updatedAt", "createdAt") VALUES (1, ' Toque na fração correspondente às fatias que faltam', '1/8', '1/2', '6/8', '1/1', '1/8', '2023-06-04', '2023-06-03');
INSERT INTO public.questao (id_questao, enunciado, alternativa1, alternativa2, alternativa3, alternativa4, alternativa_correta, "updatedAt", "createdAt") VALUES (2, ' Toque na fração correspondente às fatias que faltam', '2/4', '4/8', '8/4', '1/1', '4/8', '2023-06-05', '2023-06-04');

INSERT INTO public.tipo_usuario (id_tipo_usuario, tipo_usuario) VALUES (1, 'aluno');
INSERT INTO public.tipo_usuario (id_tipo_usuario, tipo_usuario) VALUES (2, 'professor');

INSERT INTO public.usuario (id_usuario, email, senha, id_tipo_usuario, "createdAt", "updatedAt") VALUES (1, 'vinicius', '1010', null, '2023-06-03 13:02:09.838000 +00:00', '2023-06-03 13:02:09.838000 +00:00');
INSERT INTO public.usuario (id_usuario, email, senha, id_tipo_usuario, "createdAt", "updatedAt") VALUES (4, 'keke', '12345', null, '2023-06-04 16:47:58.556000 +00:00', '2023-06-04 16:47:58.556000 +00:00');
INSERT INTO public.usuario (id_usuario, email, senha, id_tipo_usuario, "createdAt", "updatedAt") VALUES (5, 'keke2', '12345', null, '2023-06-04 16:49:19.484000 +00:00', '2023-06-04 16:49:19.484000 +00:00');
INSERT INTO public.usuario (id_usuario, email, senha, id_tipo_usuario, "createdAt", "updatedAt") VALUES (3, 'thais', '1234', null, '2023-06-03 13:17:18.326000 +00:00', '2023-06-03 13:17:18.326000 +00:00');
INSERT INTO public.usuario (id_usuario, email, senha, id_tipo_usuario, "createdAt", "updatedAt") VALUES (6, 'keke212', '12345', null, '2023-06-04 19:06:07.257000 +00:00', '2023-06-04 19:06:07.257000 +00:00');
INSERT INTO public.usuario (id_usuario, email, senha, id_tipo_usuario, "createdAt", "updatedAt") VALUES (7, 'vincis', '4321', null, '2023-06-04 19:10:13.705000 +00:00', '2023-06-04 19:10:13.705000 +00:00');
INSERT INTO public.usuario (id_usuario, email, senha, id_tipo_usuario, "createdAt", "updatedAt") VALUES (8, 'Aluno', '1234', null, '2023-06-05 22:52:11.436000 +00:00', '2023-06-05 22:52:11.436000 +00:00');