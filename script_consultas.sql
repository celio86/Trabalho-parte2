/*1. Recuperar as postagens mais recentes de um usuário e suas interações
Consulta para listar as postagens de um usuário específico, incluindo o número de likes e dislikes recebidos:*/

SELECT 
    p.id_postagem AS n_postagem, 
    p.conteudo, 
    p.tipo, 
    p.data_criacao, 
    COUNT(CASE WHEN i.tipo = 'like' THEN 1 END) AS total_likes,
    COUNT(CASE WHEN i.tipo = 'dislike' THEN 1 END) AS total_dislikes
FROM 
    Postagem p
LEFT JOIN 
    interacao i ON  p.id_postagem = i.postagem_id
WHERE 
    p.usuario_id = 1 -- ID do usuário
GROUP BY 
    p.id_postagem
ORDER BY 
    p.data_criacao DESC;
    
/* 2. Buscar os membros de um grupo e suas funções
Consulta para obter a lista de membros de um grupo específico, incluindo as funções de cada usuário no grupo*/

SELECT 
    mg.grupo_id, 
    g.nome AS nome_grupo, 
    u.nome_usuario, 
    mg.funcao
FROM 
    membro_grupo mg
INNER JOIN 
    usuario u ON mg.usuario_id = u.id_usuario
INNER JOIN 
    grupo g ON mg.grupo_id = g.id_grupo
WHERE 
    mg.grupo_id = 1; -- ID do grupo (ex.: Cinema)
    
/*3. Exibir as notificações de um usuário
Consulta para listar todas as notificações de um usuário, ordenadas por data*/


SELECT 
    n.id_notificacao AS n_notificacao, 
    n.tipo, 
    n.origem_id, 
    n.data_notificacao
FROM 
    Notificacao n
WHERE 
    n.usuario_id = 1 -- ID do usuário
ORDER BY 
    n.data_notificacao DESC;
    
/*4. Listar usuários com interesses (tags) semelhantes
Consulta para encontrar usuários que compartilham pelo menos uma tag com um usuário específico*/


SELECT 
    u.id_usuario,
    u.nome_usuario, 
    t.nome AS interesse_comum
FROM 
    Usuario_Tag ut1
INNER JOIN 
    Usuario_Tag ut2 ON ut1.tag_id = ut2.tag_id AND ut1.usuario_id != ut2.usuario_id
INNER JOIN 
    Usuario u ON ut2.usuario_id =  u.id_usuario
INNER JOIN 
    Tag t ON ut1.tag_id = t.id_tag
WHERE 
    ut1.usuario_id = 6; -- ID do usuário


/*5. Recuperar o histórico de mensagens entre dois usuários
Consulta para listar o histórico de mensagens trocadas entre dois usuários, ordenadas por data*/

SELECT 
    m.id_mensagem, 
    m.remetente_id, 
    remetente.nome_usuario AS remetente, 
    m.destinatario_id, 
    destinatario.nome_usuario AS destinatario, 
    m.conteudo, 
    m.status, 
    m.data_envio
FROM 
    Mensagem m
INNER JOIN 
    Usuario remetente ON m.remetente_id = remetente.id_usuario
INNER JOIN 
    Usuario destinatario ON m.destinatario_id = destinatario.id_usuario
WHERE 
    (m.remetente_id = 1 AND m.destinatario_id = 2) 
    OR 
    (m.remetente_id = 2 AND m.destinatario_id = 1) -- IDs dos dois usuários
ORDER BY 
    m.data_envio;

    
    


