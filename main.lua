local releasever = "build19922"
local ver = "5.0.0"..(shared.SigmaClient.Private and " PRIVATE" or shared.SigmaClient.Dev and " DEVELOPMENT" or "").." "..releasever
shared.SigmaClient = {
    Loaded = false,
    Loops = {},
    Functions = {
        QueueOnTeleport = function(path)
            pcall(function()
                local qt = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport or function() end
                qt(path)
            end)
        end,
        Loop = function(n,f)
            pcall(function()
                if not shared.SigmaClient.Loops[n] then
                    shared.SigmaClient.Loops[n] = game:GetService("RunService").Stepped:Connect(f)
                end
            end)
        end,
        Unloop = function(n)
            pcall(function()
                if shared.SigmaClient.Loops[n] then
                    shared.SigmaClient.Loops[n]:Disconnect()
                    shared.SigmaClient.Loops[n] = nil
                end
            end)
        end
    },
    Main = {
        Initiate = function()
            repeat task.wait() until game:IsLoaded()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/qwertyui-cool/sigma-but-actually-good/main/GUI/lib.lua",true))()
        end
    }
}
local SigmaClient = shared.SigmaClient
SigmaClient.Main.Initiate()