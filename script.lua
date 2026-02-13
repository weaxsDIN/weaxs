-- weaxsDIN Oyuncu ESP Scripti
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- ESP Oluşturma Fonksiyonu
local function createESP(player)
    -- Kendimizi görmeyelim
    if player == LocalPlayer then return end

    local function setupHighlight()
        -- Eğer karakter yüklenmediyse bekle
        local character = player.Character or player.CharacterAdded:Wait()
        
        -- Mevcut ESP varsa sil (üst üste binmesin)
        if character:FindFirstChild("weaxsESP") then
            character.weaxsESP:Destroy()
        end

        -- Highlight (Parlatma) efekti oluştur
        local highlight = Instance.new("Highlight")
        highlight.Name = "weaxsESP"
        highlight.Parent = character
        highlight.FillColor = Color3.fromRGB(255, 0, 0) -- İç renk (Kırmızı)
        highlight.OutlineColor = Color3.fromRGB(255, 255, 255) -- Kenarlık (Beyaz)
        highlight.FillTransparency = 0.5 -- Saydamlık
        highlight.OutlineTransparency = 0 -- Kenarlık netliği
    end

    -- Karakter her doğduğunda ESP'yi yenile
    setupHighlight()
    player.CharacterAdded:Connect(setupHighlight)
end

-- Mevcut oyuncular için çalıştır
for _, player in pairs(Players:GetPlayers()) do
    createESP(player)
end

-- Yeni katılan oyuncular için çalıştır
Players.PlayerAdded:Connect(createESP)

-- Başarı Bildirimi
game.StarterGui:SetCore("SendNotification", {
    Title = "weaxsDIN Aktif",
    Text = "Oyuncu ESP başarıyla yüklendi!",
    Duration = 5
})
