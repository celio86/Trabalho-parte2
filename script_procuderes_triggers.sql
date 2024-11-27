/*Trigger para Verificação de nome_usuario Único*/

DELIMITER $$
CREATE TRIGGER VerificaNomeUsuarioAntesDeInserir
BEFORE INSERT ON Usuario
FOR EACH ROW
BEGIN
    -- Verifica se já existe um usuário com o mesmo nome
    IF EXISTS (SELECT 1 FROM Usuario WHERE nome_usuario = NEW.nome_usuario) THEN
        -- Gera um erro se o nome já existir
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: O nome de usuário já está em uso. Escolha outro nome.';
    END IF;
END $$

DELIMITER ;

/* usando a procedure*/ 
INSERT INTO Usuario (nome_usuario, email, data_nascimento, foto_perfil, senha) 
VALUES ('joaosilva', 'joao22mail@gmail.com', '2000-01-01', NULL, 'joao123');



/* Procedure para Recuperar nome_usuario*/
DELIMITER $$

CREATE PROCEDURE RecuperaNomeUsuario(
    IN p_email VARCHAR(100)
)
BEGIN
    DECLARE v_nome_usuario VARCHAR(50);

    -- Verifica se o email existe na tabela Usuario
    SELECT nome_usuario 
    INTO v_nome_usuario
    FROM Usuario
    WHERE email = p_email;

    -- Se não encontrar o email, envia uma mensagem de erro
    IF v_nome_usuario IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: O email fornecido não está cadastrado.';
    ELSE
        -- Simula o envio da mensagem com o nome de usuário
        SELECT CONCAT(
            'Enviamos uma mensagem com o nome de usuário "', 
            v_nome_usuario, 
            '" para o email: ', p_email
        ) AS Mensagem;
    END IF;
END $$

DELIMITER ;

/* Recuperação com Email Existente:*/

CALL RecuperaNomeUsuario('joao@gmail.com');

/* Recuperação com Email Inexistente:*/

CALL RecuperaNomeUsuario('inexistente@gmail.com');


/*Procedure para Recuperar a Senha*/

DELIMITER $$

CREATE PROCEDURE RecuperaSenha(
    IN p_email VARCHAR(100)
)
BEGIN
    DECLARE v_nome_usuario VARCHAR(50);
    DECLARE v_senha VARCHAR(100);

    -- Verifica se o email existe e obtém o nome de usuário e senha
    SELECT nome_usuario, senha
    INTO v_nome_usuario, v_senha
    FROM Usuario
    WHERE email = p_email;

    -- Se o email não for encontrado, retorna um erro
    IF v_nome_usuario IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: O email fornecido não está cadastrado.';
    ELSE
        -- Simula o envio de uma mensagem com a senha ao email
        SELECT CONCAT(
            'Olá, ', v_nome_usuario, 
            '. Sua senha foi enviada ao email: ', p_email
        ) AS Mensagem;

        -- Simulação do envio real (opcional, depende do sistema externo)
        -- Exemplo fictício: CALL EnviaEmail(p_email, CONCAT('Sua senha é: ', v_senha));
    END IF;
END $$

DELIMITER ;

/* Exemplo de uso*/

CALL RecuperaSenha('joao@gmail.com');


-- DROP PROCEDURE IF EXISTS NotificarMensagemRecebida;

DELIMITER $$

CREATE PROCEDURE NotificarMensagemRecebida(
    IN remetente_id INT,
    IN destinatario_id INT
)
BEGIN
    DECLARE remetente_nome VARCHAR(255);
    DECLARE destinatario_nome VARCHAR(255);
    
    -- Recupera o nome do remetente
    SELECT nome_usuario INTO remetente_nome
    FROM Usuario
    WHERE id_usuario = remetente_id;

    -- Recupera o nome do destinatário
    SELECT nome_usuario INTO destinatario_nome
    FROM Usuario
    WHERE id_usuario = destinatario_id;
    
    -- Exibe a mensagem de notificação
    SELECT CONCAT('Olá, ', destinatario_nome, '! Você recebeu uma nova mensagem de ', remetente_nome, '.');
END$$

DELIMITER ;


INSERT INTO Mensagem (remetente_id, destinatario_id, conteudo, status)
VALUES (1, 3, 'Olá, como vai?', 'enviada');

CALL NotificarMensagemRecebida(1, 3);



CALL NotificarMensagemRecebida(1, 2);


DELIMITER $$

CREATE TRIGGER VerificarConteudoPostagem
BEFORE INSERT ON Postagem
FOR EACH ROW
BEGIN
    DECLARE mensagem_erro VARCHAR(255);
    
    -- Lista de palavras proibidas
    IF NEW.conteudo LIKE '%macaco%' OR 
       NEW.conteudo LIKE '%preto imundo%' OR 
       NEW.conteudo LIKE '%chinês nojento%' OR 
       NEW.conteudo LIKE '%cigano ladrão%' OR 
       NEW.conteudo LIKE '%vadia%' OR 
       NEW.conteudo LIKE '%mulher burra%' OR 
       NEW.conteudo LIKE '%mulher é pra cozinha%' OR 
       NEW.conteudo LIKE '%feminazi%' OR 
       NEW.conteudo LIKE '%bichinha%' OR 
       NEW.conteudo LIKE '%viado%' OR 
       NEW.conteudo LIKE '%traveco%' OR 
       NEW.conteudo LIKE '%isso não é homem%' OR 
       NEW.conteudo LIKE '%retardado%' OR 
       NEW.conteudo LIKE '%mongoloide%' OR 
       NEW.conteudo LIKE '%aleijado%' OR 
       NEW.conteudo LIKE '%burro de nascença%' OR 
       NEW.conteudo LIKE '%fanático religioso%' OR 
       NEW.conteudo LIKE '%terrorista muçulmano%' OR 
       NEW.conteudo LIKE '%crente burro%' OR 
       NEW.conteudo LIKE '%seita do demônio%' OR 
       NEW.conteudo LIKE '%nojento%' OR 
       NEW.conteudo LIKE '%lixo humano%' OR 
       NEW.conteudo LIKE '%imundo%' OR 
       NEW.conteudo LIKE '%parasita%' THEN
       
        -- Mensagem de erro
        SET mensagem_erro = 'Sua postagem não foi publicada porque viola nossas diretrizes.';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = mensagem_erro;
    END IF;
END$$

DELIMITER ;


INSERT INTO Postagem (usuario_id, conteudo, tipo) 
VALUES (6, 'Seu crente nojento.', 'texto');













