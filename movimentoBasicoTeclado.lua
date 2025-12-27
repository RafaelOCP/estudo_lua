--[[]Movimento básico com teclado utilizando WASD e setas, tendo como limite de movimento as bordas da tela]]

if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
        player.x = player.x - player.speed * dt
        if player.x < 0 then
            player.x = 0
        end
    end
    if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
        player.x = player.x + player.speed * dt
        if player.x > 768 then
            player.x = 768
        end
    end
    if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
        player.y = player.y - player.speed * dt
        if player.y < 0 then
            player.y = 0
        end
    end
    if love.keyboard.isDown("down") or love.keyboard.isDown("s") then
        player.y = player.y + player.speed * dt
        if player.y > 568 then
            player.y = 568
        end
    end
