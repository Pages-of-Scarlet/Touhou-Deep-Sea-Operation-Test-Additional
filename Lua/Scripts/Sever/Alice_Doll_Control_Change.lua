---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Hakurei Reimu.
--- DateTime: 8/10/2024 下午6:06
---

Hook.Add("Alice.Doll.Controller", "Player.Control.Change", function (client, deltaTime, character, targets)
    if targets[1] == nil then return end

    -- 获取上一次控制的角色
    local lastControlledCharacter = CharacterInfo("LastControlled")

    if CLIENT then
        if lastControlledCharacter then
            Timer.Wait(function()
                -- 将控制权转移到上一个控制的角色
                Character.Controlled = character
            end, 10)
        end
    else
        if lastControlledCharacter then
            Timer.Wait(function()
                -- 在服务器端设置客户端控制的角色为上一个控制的角色
                client.SetClientCharacter(character)
            end, 10)
        end
    end

    return true -- returning true allows us to hide the message
end)
