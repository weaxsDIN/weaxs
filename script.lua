local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/7Lib/7Lib/main/GuiLib.lua"))()
local Window = Library.CreateLib("weaxsDIN Menü", "DarkTheme")

-- ANA SEKME
local Tab1 = Window:NewTab("Oyuncu Ayarları")
local Section1 = Tab1:NewSection("Hız ve Zıplama")

Section1:NewSlider("Yürüme Hızı", "Hızını ayarlar", 250, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Section1:NewSlider("Zıplama Gücü", "Zıplama yüksekliğini ayarlar", 500, 50, function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

-- ESP SEKME
local Tab2 = Window:NewTab("Görünüş (ESP)")
local Section2 = Tab2:NewSection("ESP Ayarları")

Section2:NewButton("Oyuncu ESP Aç", "Tüm oyuncuları parlatır", function()
    local function createESP(player)
        if player == game.Players.LocalPlayer then return end
        local function setupHighlight()
            local character = player.Character or player.CharacterAdded:Wait()
            local highlight = Instance.new("Highlight")
            highlight.Name = "weaxsESP"
            highlight.Parent = character
            highlight.FillColor = Color3.fromRGB(255, 0, 0)
        end
        setupHighlight()
        player.CharacterAdded:Connect(setupHighlight)
    end
    for _, player in pairs(game.Players:GetPlayers()) do createESP(player) end
    game.Players.PlayerAdded:Connect(createESP)
end)

Section2:NewButton("ESP Kapat", "Tüm ESP'leri siler", function()
    for _, v in pairs(game.Workspace:GetDescendants()) do
        if v.Name == "weaxsESP" then v:Destroy() end
    end
end)
