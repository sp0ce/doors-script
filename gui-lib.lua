local GuiLib = {}

function GuiLib:Frame(Parent, AnchorPoint, Position, Size, BackgroundColor, BackgroundTransparency)
	local Frame = Instance.new("Frame", Parent)
	Frame.AnchorPoint = AnchorPoint
	Frame.Position = Position
	Frame.Size = Size
	Frame.BackgroundColor3 = BackgroundColor
	Frame.BackgroundTransparency = BackgroundTransparency
	
	return Frame
end

function GuiLib:TextLabel(Parent, AnchorPoint, Position, Size, TextFont, TextColor, Text)
	local TextLabel = Instance.new("TextLabel", Parent)
	TextLabel.BackgroundTransparency = 1
	TextLabel.AnchorPoint = AnchorPoint
	TextLabel.Position = Position
	TextLabel.Size = Size
	TextLabel.Font = TextFont
	TextLabel.TextColor3 = TextColor
	TextLabel.Text = Text
	
	return TextLabel
end

function GuiLib:UICorner(Parent, CornerRadius)
	local UICorner = Instance.new("UICorner", Parent)
	UICorner.CornerRadius = CornerRadius
	
	return UICorner
end

function GuiLib:UIStroke(Parent, Color, Thickness)
	local UIStroke = Instance.new("UIStroke", Parent)
	UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	UIStroke.Color = Color
	UIStroke.Thickness = Thickness

	return UIStroke
end

function GuiLib:UIPadding(Parent, PaddingBottom, PaddingLeft, PaddingRight, PaddingTop)
	local UIPadding = Instance.new("UIPadding", Parent)
	UIPadding.PaddingBottom = PaddingBottom
	UIPadding.PaddingLeft = PaddingLeft
	UIPadding.PaddingRight = PaddingRight
	UIPadding.PaddingTop = PaddingTop

	return UIPadding
end

function GuiLib:UIListLayout(Parent, Padding, FillDirection, HorizontalAlignment, VerticalAlignment)
	local UIListLayout = Instance.new("UIListLayout", Parent)
	UIListLayout.Padding = Padding
	UIListLayout.FillDirection = FillDirection
	UIListLayout.HorizontalAlignment = HorizontalAlignment
	UIListLayout.VerticalAlignment = VerticalAlignment

	return UIListLayout
end

return GuiLib
