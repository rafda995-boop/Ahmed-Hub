-- [[ CLAN ZERO HUB | THE MAIN SOURCE ]] --
-- المطور الرئيسي: Taraf69788
-- الحقوق: Clan Zero (VOID Clan)

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- إنشاء الواجهة باسم الكلان مباشرة
local Window = Library.CreateLib("CLAN ZERO HUB | BY TARAF", "DarkTheme")

-- [ تبويب الحقوق ]
local Tab1 = Window:NewTab("الحقوق")
local Section1 = Tab1:NewSection("CLAN ZERO ON TOP")

Section1:NewLabel("تم التطوير بواسطة: Taraf69788")
Section1:NewLabel("هذا السكربت ملك لـ Clan Zero")

Section1:NewButton("نسخ حساب تليجرام", "للتواصل مع المطور", function()
    setclipboard("@A_K_8_H")
    Library:Notify("تم النسخ", "معرف Taraf69788 منسوخ الآن", "rbxassetid://4483345998")
end)

-- [ تبويب اللاعب ]
local Tab2 = Window:NewTab("اللاعب")
local Section2 = Tab2:NewSection("تعديلات الشخصية")

Section2:NewSlider("السرعة", "تغيير سرعة المشي", 500, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Section2:NewSlider("القفز", "تغيير قوة القفز", 500, 50, function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

-- [ تبويب تخريب الماب ]
local Tab3 = Window:NewTab("تخريب الماب")
local Section3 = Tab3:NewSection("خيارات تدمير السيرفر V4")

Section3:NewToggle("تفعيل التدمير البصري (V4)", "وميض قوي ولاق للسيرفر", function(state)
    _G.V4_Active = state
    local Lighting = game:GetService("Lighting")
    task.spawn(function()
        while _G.V4_Active do
            Lighting.Brightness = 10000
            Lighting.Ambient = Color3.new(math.random(), math.random(), math.random())
            Lighting.OutdoorAmbient = Color3.new(math.random(), math.random(), math.random())
            task.wait(0.01)
        end
        Lighting.Brightness = 1 -- إعادة الإضاءة للطبيعة عند الإيقاف
    end)
end)

-- [ تشغيل السكربتات المساعدة تلقائياً ]
pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/01k/refs/heads/main/Roooooom.lua"))()
end)

Library:Notify("Clan Zero", "تم تشغيل هب الكلان بنجاح", "rbxassetid://4483345998")
