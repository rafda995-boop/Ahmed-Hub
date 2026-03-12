-- [[ CLAN ZERO HUB - THE CORE ]] --
-- حقوق السيطرة الكاملة لـ CLAN ZERO

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- وظيفة لتغيير العناوين الأصلية بالقوة
local function ChangeCredits()
    pcall(function()
        -- استدعاء السكربت الأصلي (المحرك)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/rafda995-boop/Ahmed-Hub/refs/heads/main/MainSource.lua"))()
        
        -- انتظار بسيط لضمان ظهور القائمة ثم تغيير نصوصها
        task.wait(1)
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("TextLabel") then
                if v.Text:find("LOC4T") or v.Text:find("BRUTON") then
                    v.Text = "CLAN ZERO HUB | BY TARAF"
                end
            end
        end
    end)
end

-- إنشاء الواجهة الخاصة بك
local Window = Library.CreateLib("CLAN ZERO HUB | BY TARAF", "DarkTheme")

local Tab1 = Window:NewTab("الحقوق")
local Section1 = Tab1:NewSection("CLAN ZERO ON TOP")
Section1:NewLabel("تم تطوير هذا الهب بواسطة Taraf69788")
Section1:NewLabel("الحقوق محفوظة لـ Clan Zero")

-- زر التشغيل الذي سيقوم بتبديل الحقوق
Section1:NewButton("تشغيل السكربت الكامل", "تفعيل مع تغيير الحقوق", function()
    ChangeCredits()
    Library:Notify("CLAN ZERO", "تم تفعيل السكربت وتعديل الحقوق", "rbxassetid://4483345998")
end)

-- قسم التدمير
local Tab4 = Window:NewTab("تخريب الماب")
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
