-- Criação do banco de dados

-- DROP DATABASE rede_social;

CREATE DATABASE rede_social;
USE rede_social;

-- Tabela Usuario
CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome_usuario VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    foto_perfil LONGBLOB, -- Foto armazenada como dado binário
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela Conexao
CREATE TABLE Conexao (
    id_conexao INT AUTO_INCREMENT PRIMARY KEY,
    usuario1_id INT NOT NULL,
    usuario2_id INT NOT NULL,
    data_conexao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario1_id) REFERENCES Usuario(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (usuario2_id) REFERENCES Usuario(id_usuario) ON DELETE CASCADE,
    CONSTRAINT conexao_unica UNIQUE (usuario1_id, usuario2_id)
);

-- Tabela Postagem
CREATE TABLE Postagem (
    id_postagem INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    conteudo TEXT NOT NULL,
    tipo ENUM('texto', 'imagem', 'video') NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id_usuario) ON DELETE CASCADE
);

-- Tabela Interacao
CREATE TABLE Interacao (
    id_interacao INT AUTO_INCREMENT PRIMARY KEY,
    postagem_id INT NOT NULL,
    usuario_id INT NOT NULL,
    tipo ENUM('like', 'dislike') NOT NULL,
    data_interacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (postagem_id) REFERENCES Postagem(id_postagem) ON DELETE CASCADE,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id_usuario) ON DELETE CASCADE
);

-- Tabela Comentario
CREATE TABLE Comentario (
    id_comentario INT AUTO_INCREMENT PRIMARY KEY,
    postagem_id INT NOT NULL,
    usuario_id INT NOT NULL,
    conteudo TEXT NOT NULL,
    data_comentario TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    comentario_pai_id INT DEFAULT NULL,
    FOREIGN KEY (postagem_id) REFERENCES Postagem(id_postagem) ON DELETE CASCADE,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (comentario_pai_id) REFERENCES Comentario(id_comentario) ON DELETE CASCADE
);

-- Tabela Notificacao
CREATE TABLE Notificacao (
    id_notificacao INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    tipo ENUM('avaliacao', 'comentario') NOT NULL,
    origem_id INT NOT NULL,
    data_notificacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id_usuario) ON DELETE CASCADE
);

-- Tabela Grupo
CREATE TABLE Grupo (
    id_grupo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) UNIQUE NOT NULL,
    descricao TEXT,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela Membro_Grupo
CREATE TABLE Membro_Grupo (
    id_membro_grupo INT AUTO_INCREMENT PRIMARY KEY,
    grupo_id INT NOT NULL,
    usuario_id INT NOT NULL,
    funcao ENUM('membro', 'administrador') NOT NULL,
    FOREIGN KEY (grupo_id) REFERENCES Grupo(id_grupo) ON DELETE CASCADE,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id_usuario) ON DELETE CASCADE
);

-- Tabela Mensagem
CREATE TABLE Mensagem (
    id_mensagem INT AUTO_INCREMENT PRIMARY KEY,
    remetente_id INT NOT NULL,
    destinatario_id INT NOT NULL,
    conteudo TEXT NOT NULL,
    data_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('enviada', 'recebida', 'lida') NOT NULL,
    FOREIGN KEY (remetente_id) REFERENCES Usuario(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (destinatario_id) REFERENCES Usuario(id_usuario) ON DELETE CASCADE
);

-- Tabela Tag
CREATE TABLE Tag (
    id_tag INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) UNIQUE NOT NULL
);

-- Tabela Usuario_Tag
CREATE TABLE Usuario_Tag (
    id_usuario_tag INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    tag_id INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES Tag(id_tag) ON DELETE CASCADE
);


-- Adicionando o campo 'senha' na tabela 'Usuario'
ALTER TABLE Usuario ADD COLUMN senha CHAR(8) NOT NULL;

-- Garantindo que a senha tenha exatamente 8 caracteres
ALTER TABLE Usuario ADD CONSTRAINT chk_senha CHECK (CHAR_LENGTH(senha) = 8);

ALTER TABLE Postagem ADD COLUMN foto LONGBLOB;


/*Certifique-se de que o MySQL tem acesso ao caminho do arquivo e que a variável secure_file_priv está 
configurada corretamente para permitir o uso de LOAD_FILE.*/

SHOW VARIABLES LIKE 'secure_file_priv';

