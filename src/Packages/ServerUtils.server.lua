local HttpService = game:GetService("HttpService")
local GetGameInfoRemote = Instance.new("RemoteFunction")
GetGameInfoRemote.Parent = game.ReplicatedStorage;
GetGameInfoRemote.Name = "_TopbarPlusGetGameInfo"

const gameInfo = {
    Name = "",
    Description = "",
    IsPrivate = false
}

const gameInfoRaw = HttpService:GetAsync("https://develop.roproxy.com/v1/universes/"..game.GameId)
if gameInfoRaw then
    const parsedGameInfo = HttpService:JSONDecode(gameInfoRaw)
    gameInfo.Name = parsedGameInfo.name
    gameInfo.Description = parsedGameInfo.description
    gameInfo.IsPrivate = parsedGameInfo.privacyType == "Private"
end

GetGameInfoRemote.OnServerInvoke = function()
    return gameInfo
end