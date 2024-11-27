-- Inserção de dados na tabela Usuario com senhas
INSERT INTO Usuario (nome_usuario, email, data_nascimento, foto_perfil, senha) 
VALUES 
('joaosilva', 'joao@gmail.com', '1990-01-01', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\imagens\\jose.png'), 'senha123'),
('mariaribeiro', 'maria@gmail.com', '1992-02-02', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\imagens\\maria.png'), '123senha'),
('carlos123', 'carlos@gmail.com', '1985-03-03', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\imagens\\carlos.png'), 'abc12345'),
('ana_clara', 'ana@gmail.com', '1993-04-04', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\imagens\\ana.png'), 'segredo1'),
('lucas_monte', 'lucas@gmail.com', '1991-05-05', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\imagens\\lucas.png'), 'senhaabc'),
('rafaela.m', 'rafaela@gmail.com', '1987-06-06', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\imagens\\rafaela.png'), '87654321'),
('fernando.s', 'fernando@gmail.com', '1989-07-07', LOAD_FILE('C:\\ProgramData\MySQL\\MySQL Server 8.0\\Uploads\\imagens\\fernando2.png'), 'minhasen'),
('beatrizf', 'beatriz@gmail.com', '1994-08-08', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\imagens\\beatriz.png'), 'qwerty12'),
('gustavo.r', 'gustavo@gmail.com', '1995-09-09', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\imagens\\gustavo.png'), '1234abcd'),
('larissad', 'larissa@gmail.com', '1996-10-10', LOAD_FILE('C:\\ProgramData\MySQL\\MySQL Server 8.0\\Uploads\\imagens\\larissa2.png'), 'senha456');






-- Inserção de dados na tabela Conexao
INSERT INTO Conexao (usuario1_id, usuario2_id) 
VALUES 
(1, 2), (1, 3), (2, 4), (3, 5), (4, 6), 
(5, 7), (6, 8), (7, 9), (8, 10), (9, 1);



-- Inserção de dados na tabela Postagem
INSERT INTO Postagem (usuario_id, conteudo, tipo) 
VALUES 
(1, 'Primeira postagem!', 'texto'),
(3, 'Assistam este vídeo incrível.', 'video'),
(4, 'Pensamento do dia.', 'texto'),
(6, 'Compartilhando um tutorial.', 'video'),
(7, 'Bom dia, pessoal!', 'texto'),
(9, 'Meu novo projeto.', 'video'),
(10, 'Feliz aniversário para mim!', 'texto');

-- Inserção de postagens com fotos
INSERT INTO Postagem (usuario_id, conteudo, tipo, foto)
VALUES 
(1, 'Foto da minha viagem!', 'imagem', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\imagens\viagem1.png')),
(2, 'Compartilhando uma receita deliciosa.', 'imagem', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\imagens\receita1.jpg')),
(3, 'Paisagem incrível.', 'imagem', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\imagens\paisagem1.jpg')),
(4, 'Novo produto lançado!', 'imagem', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\imagens\produto1.png')),
(5, 'Confira essa arte!', 'imagem', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\imagens\arte1.jpg')),
(6, 'Vamos Treinae!!.', 'imagem', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\imagens\treino1.png')),
(7, 'Saudades desse lugar.', 'imagem', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\imagens\viagem2.png')),
(8, 'Meu novo animal de estimação!', 'imagem', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\imagens\pet1.png')),
(9, 'Foto de um jantar especial.', 'imagem', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\imagens\jantar1.png')),
(10, 'Céu ao entardecer.', 'imagem', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\imagens\ceu1.png'));


-- Inserção de dados na tabela Interacao
INSERT INTO Interacao (postagem_id, usuario_id, tipo) 
VALUES 
(9, 3, 'like'), 
(4, 10, 'like'), 
(2, 7, 'dislike'), 
(1, 3, 'like'), 
(5, 1, 'like'), 
(8, 4, 'dislike'), 
(6, 2, 'like'), 
(7, 3, 'like'), 
(10, 1, 'dislike'), 
(3, 8, 'like');



-- Inserção de dados na tabela Comentario
INSERT INTO Comentario (postagem_id, usuario_id, conteudo, comentario_pai_id) 
VALUES 
(8, 1, 'Ótima postagem!', NULL), 
(9, 3, 'Concordo!', null), 
(1, 6, 'Adorei a foto.', NULL), 
(9, 5, 'Muito bom!', NULL), 
(4, 10, 'Que interessante.', NULL), 
(5, 1, 'Adoro isso.', null), 
(4, 10, 'Muito útil!', NULL), 
(7, 3, 'Bom dia pra você também.', NULL), 
(8, 1, 'Parece ótimo!', NULL), 
(9, 3, 'Excelente trabalho!', NULL);


-- Inserção de dados na tabela Notificacao
INSERT INTO Notificacao (usuario_id, tipo, origem_id) 
VALUES 
(1, 'avaliacao', 2), (2, 'comentario', 1), (3, 'avaliacao', 4),
(4, 'comentario', 3), (5, 'avaliacao', 6), (6, 'comentario', 5),
(7, 'avaliacao', 8), (8, 'comentario', 7), (9, 'avaliacao', 10),
(10, 'comentario', 9);

-- Inserção de dados na tabela Grupo
INSERT INTO Grupo (nome, descricao) 
VALUES 
('Cinema', 'Discussões sobre filmes e séries'),
('Tecnologia', 'Novidades do mundo tech'),
('Viagens', 'Compartilhando experiências de viagem'),
('Gastronomia', 'Receitas e dicas culinárias'),
('Esportes', 'Tudo sobre esportes!'),
('Fotografia', 'Paixão por fotos e técnicas'),
('Literatura', 'Livros e leituras marcantes'),
('Música', 'Bandas e músicas preferidas'),
('Jogos', 'Games e diversão'),
('Natureza', 'Amor pela natureza e sustentabilidade');

-- Inserção de dados na tabela Membro_Grupo
INSERT INTO Membro_Grupo (grupo_id, usuario_id, funcao) 
VALUES 
(1, 1, 'administrador'), (1, 2, 'membro'), (2, 3, 'administrador'),
(2, 4, 'membro'), (3, 5, 'administrador'), (3, 6, 'membro'),
(4, 7, 'administrador'), (4, 8, 'membro'), (5, 9, 'administrador'),
(5, 10, 'membro');

-- Inserção de dados na tabela Mensagem
INSERT INTO Mensagem (remetente_id, destinatario_id, conteudo, status) 
VALUES 
(1, 2, 'Oi, tudo bem?', 'enviada'), (2, 3, 'Sim, e você?', 'recebida'),
(3, 4, 'Gostei do seu post!', 'lida'), (4, 5, 'Muito obrigado!', 'enviada'),
(5, 6, 'Parabéns pelo projeto.', 'lida'), (6, 7, 'Obrigado!', 'recebida'),
(7, 8, 'Quer participar do grupo?', 'enviada'), (8, 9, 'Claro!', 'lida'),
(9, 10, 'Vamos organizar um evento.', 'enviada'), (10, 1, 'Ótima ideia!', 'lida');

-- Inserção de dados na tabela Tag
INSERT INTO Tag (nome) 
VALUES 
('Cinema'), ('Tecnologia'), ('Esportes'), 
('Fotografia'), ('Natureza'), ('Viagens'), 
('Literatura'), ('Gastronomia'), ('Música'), ('Jogos');


-- Inserção de dados na tabela Usuario_Tag
INSERT INTO Usuario_Tag (usuario_id, tag_id) 
VALUES 
(1, 1), (1, 2), (2, 3), (2, 4), (3, 5), 
(4, 6), (5, 7), (6, 8), (7, 9), (8, 10);


