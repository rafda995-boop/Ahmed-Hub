-- [[ CLAN ZERO HUB - THE CORE ]] --
-- حقوق السيطرة الكاملة لـ CLAN ZERO

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("CLAN ZERO HUB | BY TARAF", "DarkTheme")

-- التبويبات (نفس الموجودة في صورك)
local Tab1 = Window:NewTab("الحقوق")
local Tab2 = Window:NewTab("اللاعب")
local Tab3 = Window:NewTab("المضادات")
local Tab4 = Window:NewTab("تخريب الماب")

-- [ قسم الحقوق - هنا نغير كل شيء ]
local Section1 = Tab1:NewSection("CLAN ZERO ON TOP")
Section1:NewLabel("تم تطوير هذا الهب بواسطة Taraf69788")
Section1:NewLabel("الحقوق محفوظة لـ Clan Zero")

Section1:NewButton("نسخ حساب تليجرام", "للتواصل مع المطور", function()
    setclipboard("@A_K_8_H")
end)

-- [ قسم تخريب الماب - V4 المستخرج ]
local Section4 = Tab4:NewSection("خيارات التدمير")
Section4:NewToggle("تفعيل V4", "وميض وتدمير بصري", function(state)
    _G.V4 = state
    while _G.V4 do
        game:GetService("Lighting").Brightness = 10000
        game:GetService("Lighting").Ambient = Color3.new(math.random(), math.random(), math.random())
        task.wait(0.01)
    end
    game:GetService("Lighting").Brightness = 1
end)
