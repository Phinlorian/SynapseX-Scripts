local Players = game:GetService("Players")
local UserInputService = game:GetService'UserInputService'
local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()
local CanSnap = false
UserInputService.InputBegan:Connect(function(inputObject, gp)
if gp then return end
if inputObject.KeyCode == Enum.KeyCode.H then
    CanSnap = true
    task.wait()
    CanSnap = false
end
end)
local GetMouse = game.ReplicatedStorage.Requests.GetMouse
local function returnMouseTable()
return {
    Hit = Mouse.Hit;
    Target = Mouse.Target;
    UnitRay = Mouse.UnitRay;
    X = Mouse.X;
    Y = Mouse.Y;
}
end
GetMouse.OnClientInvoke = function()
repeat task.wait() until CanSnap
return returnMouseTable()
end
