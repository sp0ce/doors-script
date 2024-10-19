local GuiLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/sp0ce/doors-script/refs/heads/main/gui-lib.lua"))()

local TweenService = game:GetService("TweenService")

local Notifications = {}

local Player = game.Players.LocalPlayer

local Gui = Instance.new("ScreenGui", Player.PlayerGui)
Gui.IgnoreGuiInset = true
Gui.ResetOnSpawn = false

local NotificationsHolder = GuiLib:Frame(Gui, Vector2.new(.95, 0), UDim2.fromScale(1, .1), UDim2.new(.25, 200, .25, 200), Color3.new(), 1)
NotificationsHolder.SizeConstraint = Enum.SizeConstraint.RelativeYY
GuiLib:UIListLayout(NotificationsHolder, UDim.new(.1, 0), Enum.FillDirection.Vertical, Enum.HorizontalAlignment.Right, Enum.VerticalAlignment.Top)

function Notifications:MakeNotification(_Type, _Color, _Title, _Desc, _Reason, _Icon)
	local Notification = GuiLib:Frame(NotificationsHolder, Vector2.new(.95, .5), UDim2.new(), UDim2.fromScale(0, .2), Color3.new(), 1)
	
	local Frame = GuiLib:Frame(Notification, Vector2.new(), UDim2.new(), UDim2.fromScale(1, 1), Color3.fromRGB(38, 25, 25), .3)
	Frame.ZIndex = 2000
	GuiLib:UICorner(Frame, UDim.new(.1, 0))
	GuiLib:UIPadding(Frame, UDim.new(.05, 0), UDim.new(.015, 0), UDim.new(.05, 0), UDim.new(.05, 0))
	GuiLib:UIStroke(Frame, _Color, 3)
	
	local Type: TextLabel = GuiLib:TextLabel(Frame, Vector2.new(0, 1), UDim2.fromScale(0, -.14), UDim2.new(1, 0, .2, 5), Enum.Font.Oswald, Color3, _Type)
	Type.FontFace.Family = "rbxassetid://11702779517"
	Type.FontFace.Weight = Enum.FontWeight.Heavy
	Type.FontFace.Style = Enum.FontStyle.Normal
	Type.TextXAlignment = Enum.TextXAlignment.Left
	
	local Glow = Instance.new("ImageLabel", Frame)
	Glow.AnchorPoint = Vector2.new(0, .5)
	Glow.BackgroundTransparency = 1
	Glow.Position = UDim2.fromScale(-.5, .5)
	Glow.Size = UDim2.fromScale(2, 4)
	Glow.ZIndex = 1999
	Glow.Image = "rbxassetid://61997378"
	Glow.ImageColor3 = _Color
	
	local Icon = Instance.new("ImageLabel", Frame)
	Icon.AnchorPoint = Vector2.new(0, 1)
	Icon.BackgroundColor3 = Color3.new(0, 0, 0)
	Icon.BackgroundTransparency = .7
	Icon.Position = UDim2.fromScale(0, 1)
	Icon.Size = UDim2.fromScale(1, 1)
	Icon.SizeConstraint = Enum.SizeConstraint.RelativeYY
	Icon.ZIndex = 2000
	Icon.Image = "rbxassetid://" .. _Icon
	GuiLib:UICorner(Icon, UDim.new(1, 0))
	
	local Details = GuiLib:Frame(Frame, Vector2.new(1, .5), UDim2.fromScale(1, .5), UDim2.fromScale(.78, 1), Color3.new(), 1)
	Details.ZIndex = 2000
	GuiLib:UIListLayout(Details, UDim.new(), Enum.FillDirection.Vertical, Enum.HorizontalAlignment.Left, Enum.VerticalAlignment.Top)
	
	local Title = GuiLib:TextLabel(Details, Vector2.new(1, 0), UDim2.fromScale(1, .4), UDim2.fromScale(1, .4), Enum.Font.Oswald, _Color, _Title)
	Title.ZIndex = 2000
	Title.TextXAlignment = Enum.TextXAlignment.Left
	GuiLib:UIPadding(Title, UDim.new(0, -2), UDim.new(), UDim.new(), UDim.new(0, -4))
	
	local Desc = GuiLib:TextLabel(Details, Vector2.new(1, 0), UDim2.fromScale(1, .6), UDim2.fromScale(1, .3), Enum.Font.Oswald, _Color, _Desc)
	Desc.ZIndex = 2000
	Desc.TextXAlignment = Enum.TextXAlignment.Left
	GuiLib:UIPadding(Desc, UDim.new(0, -2), UDim.new(), UDim.new(), UDim.new(0, -2))
	
	local Reason = GuiLib:TextLabel(Details, Vector2.new(1, 0), UDim2.fromScale(1, .8), UDim2.fromScale(1, .3), Enum.Font.Oswald, _Color, _Reason)
	Reason.ZIndex = 2000
	Reason.TextXAlignment = Enum.TextXAlignment.Left
	GuiLib:UIPadding(Reason, UDim.new(0, -2), UDim.new(), UDim.new(), UDim.new(0, -2))
	
	task.spawn(function()
		TweenService:Create(Notification, TweenInfo.new(.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.fromScale(1, .2)}):Play()
		task.wait(5)

		TweenService:Create(Notification, TweenInfo.new(.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.fromScale(0, .2)}):Play()
		task.wait(.5)

		Notification:Destroy()
	end)
	
	return Notification
end

return Notifications
