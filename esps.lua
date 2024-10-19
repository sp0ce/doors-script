local GuiLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/sp0ce/doors-script/refs/heads/main/gui-lib.lua"))()

local RunService = game:GetService("RunService")

local Esps = {}

local Player = game.Players.LocalPlayer

local Character = Player.Character or Player.CharacterAdded:Wait()
local Root = Character:WaitForChild("HumanoidRootPart")

function Esps:MakeGps(Object, Color, Text)
	local BillboardGui = Instance.new("BillboardGui", Player.PlayerGui)
	BillboardGui.Adornee = Object
	BillboardGui.AlwaysOnTop = true
	BillboardGui.ResetOnSpawn = false
	
	local ObjectName = GuiLib:TextLabel(BillboardGui, Vector2.new(0, 0), UDim2.fromScale(0, 0), UDim2.fromScale(1, .5), Enum.Font.Oswald, Color, Text)
	ObjectName.TextStrokeTransparency = .9
	
	local ObjectDistance = GuiLib:TextLabel(BillboardGui, Vector2.new(0, 0), UDim2.fromScale(0, 0), UDim2.fromScale(1, .5), Enum.Font.Oswald, Color, "???")
	ObjectDistance.TextStrokeTransparency = .9
	
	RunService.RenderStepped:Connect(function()
		ObjectDistance.Text = math.round((Root.Position - Object.Position).Magnitude) .. "s"
	end)
	
	return BillboardGui
end

return Esps
