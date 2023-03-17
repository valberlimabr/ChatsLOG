-- Script criado por: Valber
-- Para ver o script original acesse: https://github.com/valberlimabr


-- Função que será chamada quando um jogador enviar uma mensagem no chat
local function OnChat(event, player, message, type, language)
    -- Verifica se o jogador é um GM de nível 3 (GM Master)
    if player:GetGMRank() == 3 then
        -- Abre o arquivo de log para GMs em modo de escrita (append)
        local file = io.open("gm_chat.log", "a")
        if file then
            -- Formata a mensagem com o nome do jogador, tipo de mensagem e idioma
            local formatted_message = string.format("[%s] <%s> (%s) %s\n", os.date("%Y-%m-%d %H:%M:%S"), player:GetName(), type, message)
            -- Escreve a mensagem no arquivo de log para GMs
            file:write(formatted_message)
            -- Fecha o arquivo
            file:close()
        end
    else
        -- Abre o arquivo de log padrão em modo de escrita (append)
        local file = io.open("player_chat.log", "a")
        if file then
            -- Formata a mensagem com o nome do jogador, tipo de mensagem e idioma
            local formatted_message = string.format("[%s] <%s> (%s) %s\n", os.date("%Y-%m-%d %H:%M:%S"), player:GetName(), type, message)
            -- Escreve a mensagem no arquivo de log padrão
            file:write(formatted_message)
            -- Fecha o arquivo
            file:close()
        end
    end
end

-- Registra a função para ser chamada quando um jogador enviar uma mensagem no chat
RegisterPlayerEvent(18, OnChat)

-- Registra a função para ser chamada quando um jogador enviar uma mensagem de sussurro
RegisterPlayerEvent(19, OnChat)

-- Registra a função para ser chamada quando um jogador enviar uma mensagem no chat de grupo
RegisterPlayerEvent(4, OnChat)
