--[[
    CLAN ZERO Hub. | v. 1.2 - 2026 (OFFICIAL VERSION)
    Rights: Clan Zero (VOID Clan)
    Developer: Ahmed (Taraf69788)
]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local lp = Players.LocalPlayer

-- [ 1. نظام إشعارات كلان زيرو ]
StarterGui:SetCore("SendNotification", {
    Title = "Clan Zero Hub",
    Text = "جاري تفعيل أنظمة الكلان...",
    Duration = 3
})

task.wait(2.5)

StarterGui:SetCore("SendNotification", {
    Title = "Clan Zero Hub",
    Text = "تم التفعيل بنجاح ✅ - أهلاً بك يا أحمد",
    Duration = 3
})

-- [ 2. إعدادات التصميم ]
local MutedPurple = Color3.fromRGB(65, 25, 110)
local DarkPurple = Color3.fromRGB(30, 5, 50)
local ActiveGreen = Color3.fromRGB(0, 200, 0)
local MainFont = Enum.Font.GothamBold

-- [ 3. متغيرات التحكم ]
local statsData = {}
local notificationsMuted = false
local faceSitEnabled = false
local bangEnabled = false
local bangTarget = nil
local isOpened = true

-- [ وظيفة الإشعارات ]
local function notify(title, text)
    if not notificationsMuted then
        StarterGui:SetCore("SendNotification", {Title = title, Text = text, Duration = 3})
    end
end

-- [ تصفير السرعة لمنع الطيران - نظام حماية ]
local function resetVel()
    if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = lp.Character.HumanoidRootPart
        hrp.Velocity = Vector3.zero
        hrp.AssemblyLinearVelocity = Vector3.zero
        hrp.AssemblyAngularVelocity = Vector3.zero
        lp.Character.Humanoid.Sit = false
    end
end

local function getStats(name)
    if not statsData[name] then statsData[name] = {joins = 1, leaves = 0, deaths = 0, thumb = ""} end
    return statsData[name]
end

-- [ 4. محرك الحركة المطور - سرعة 50 ]
RunService.Heartbeat:Connect(function()
    if (faceSitEnabled or bangEnabled) and bangTarget and bangTarget.Character and bangTarget.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = lp.Character.HumanoidRootPart
        local move = math.sin(tick() * 50) * 0.9 -- السرعة الخارقة 50
        hrp.Velocity = Vector3.new(0, 0.0001, 0) -- منع السقوط من خلال الأرض
        
        if faceSitEnabled and bangTarget.Character:FindFirstChild("Head") then
            lp.Character.Humanoid.Sit = true
            hrp.CFrame = bangTarget.Character.Head.CFrame * CFrame.new(0, 0.2, -0.5 + move) * CFrame.Angles(0, math.rad(180), 0)
        elseif bangEnabled then
            lp.Character.Humanoid.Sit = false
            hrp.CFrame = bangTarget.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0.5, 1.1 + move)
        end
    end
end)

-- [ 5. الواجهة الرسومية Clan Zero Edition ]
local MainGui = Instance.new("ScreenGui", lp.PlayerGui); MainGui.ResetOnSpawn = false
local MainFrame = Instance.new("Frame", MainGui)
MainFrame.Size = UDim2.new(0, 600, 0, 480)
MainFrame.Position = UDim2.new(0.5, -300, 0.25, 0) 
MainFrame.BackgroundColor3 = DarkPurple; MainFrame.BackgroundTransparency = 0.2; MainFrame.Active = true; MainFrame.Draggable = true; MainFrame.ClipsDescendants = true
Instance.new("UIStroke", MainFrame).Color = Color3.fromRGB(180, 50, 255)

local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 50); Title.BackgroundColor3 = DarkPurple; Title.Text = "CLAN ZERO HUB | OFFICIAL"; Title.TextColor3 = Color3.new(1, 1, 1); Title.Font = MainFont; Title.TextSize = 20

local Arrow = Instance.new("TextButton", MainFrame)
Arrow.Size = UDim2.new(0, 50, 0, 50); Arrow.Position = UDim2.new(1, -50, 0, 0); Arrow.Text = "▲"; Arrow.BackgroundTransparency = 1; Arrow.TextColor3 = Color3.new(1, 1, 1); Arrow.TextSize = 25
Arrow.MouseButton1Click:Connect(function()
    isOpened = not isOpened
    MainFrame:TweenSize(isOpened and UDim2.new(0, 600, 0, 480) or UDim2.new(0, 600, 0, 50), "Out", "Quad", 0.3, true)
    Arrow.Text = isOpened and "▲" or "▼"
end)

local Tabs = Instance.new("Frame", MainFrame); Tabs.Size = UDim2.new(1, 0, 0, 40); Tabs.Position = UDim2.new(0, 0, 0, 50); Tabs.BackgroundColor3 = DarkPurple; Tabs.BackgroundTransparency = 0.6
local Content = Instance.new("Frame", MainFrame); Content.Size = UDim2.new(1, 0, 1, -90); Content.Position = UDim2.new(0, 0, 0, 90); Content.BackgroundTransparency = 1

local function createTab(name, pos)
    local btn = Instance.new("TextButton", Tabs); btn.Size = UDim2.new(0.25, 0, 1, 0); btn.Position = UDim2.new(pos * 0.25, 0, 0, 0)
    btn.Text = name; btn.TextColor3 = Color3.new(1, 1, 1); btn.BackgroundTransparency = 0.9; btn.Font = MainFont; btn.TextSize = 14; return btn
end

local FunBtn = createTab("الأنظمة", 0); local TrackBtn = createTab("التتبع", 1); local SetBtn = createTab("الإعدادات", 2); local ScBtn = createTab("كلان زيرو", 3)
local FunFrame = Instance.new("Frame", Content); FunFrame.Size = UDim2.new(1,0,1,0); FunFrame.BackgroundTransparency = 1; FunFrame.Visible = true
local TrackFrame = Instance.new("ScrollingFrame", Content); TrackFrame.Size = UDim2.new(1,0,1,0); TrackFrame.BackgroundTransparency = 1; TrackFrame.Visible = false; TrackFrame.CanvasSize = UDim2.new(0,0,4,0)
local SetFrame = Instance.new("Frame", Content); SetFrame.Size = UDim2.new(1,0,1,0); SetFrame.BackgroundTransparency = 1; SetFrame.Visible = false

local function hideAll() FunFrame.Visible = false; TrackFrame.Visible = false; SetFrame.Visible = false end
FunBtn.MouseButton1Click:Connect(function() hideAll(); FunFrame.Visible = true end)
TrackBtn.MouseButton1Click:Connect(function() hideAll(); TrackFrame.Visible = true end)
SetBtn.MouseButton1Click:Connect(function() hideAll(); SetFrame.Visible = true end)

-- [ 6. تحديث قائمة التتبع ]
local function updateTracker()
    for _, v in pairs(TrackFrame:GetChildren()) do if v:IsA("Frame") then v:Destroy() end end
    local yPos = 10
    for name, data in pairs(statsData) do
        local Card = Instance.new("Frame", TrackFrame); Card.Size = UDim2.new(1, -40, 0, 80); Card.Position = UDim2.new(0, 20, 0, yPos); Card.BackgroundColor3 = MutedPurple; Card.BackgroundTransparency = 0.7; Instance.new("UICorner", Card)
        local Img = Instance.new("ImageLabel", Card); Img.Size = UDim2.new(0, 60, 0, 60); Img.Position = UDim2.new(0, 10, 0, 10); Img.Image = data.thumb; Instance.new("UICorner", Img).CornerRadius = UDim.new(1, 0)
        local Info = Instance.new("TextLabel", Card); Info.Size = UDim2.new(1, -120, 1, 0); Info.Position = UDim2.new(0, 100, 0, 0); Info.BackgroundTransparency = 1; Info.TextColor3 = Color3.new(1,1,1); Info.TextSize = 13; Info.Font = MainFont; 
        Info.Text = "الاسم: " .. name .. " | دخول: " .. data.joins .. " | خروج: " .. data.leaves .. " | موت: " .. data.deaths; Info.TextXAlignment = Enum.TextXAlignment.Left
        yPos = yPos + 90
    end
end

-- [ وظيفة إنشاء الأزرار ]
local function createBigBtn(parent, text, pos, callback)
    local btn = Instance.new("TextButton", parent); btn.Size = UDim2.new(1, -40, 0, 60); btn.Position = UDim2.new(0, 20, 0, pos)
    btn.Text = text; btn.BackgroundColor3 = MutedPurple; btn.BackgroundTransparency = 0.5; btn.TextColor3 = Color3.new(1, 1, 1); btn.Font = MainFont; btn.TextSize = 18; 
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)
    btn.MouseButton1Click:Connect(function() callback(btn) end); return btn
end

-- [ محتوى الأنظمة ]
local TargetInput = Instance.new("TextBox", FunFrame); TargetInput.Size = UDim2.new(1, -40, 0, 45); TargetInput.Position = UDim2.new(0, 20, 0, 10); TargetInput.PlaceholderText = "يوزر الضحية..."; TargetInput.BackgroundColor3 = MutedPurple; TargetInput.TextColor3 = Color3.new(1,1,1); TargetInput.Font = MainFont; TargetInput.TextSize = 16; Instance.new("UICorner", TargetInput)
local PreviewFrame = Instance.new("Frame", FunFrame); PreviewFrame.Size = UDim2.new(1, -40, 0, 70); PreviewFrame.Position = UDim2.new(0, 20, 0, 65); PreviewFrame.BackgroundColor3 = MutedPurple; PreviewFrame.BackgroundTransparency = 0.8; PreviewFrame.Visible = false; Instance.new("UICorner", PreviewFrame)
local TargetImg = Instance.new("ImageLabel", PreviewFrame); TargetImg.Size = UDim2.new(0, 60, 0, 60); TargetImg.Position = UDim2.new(0, 5, 0, 5); Instance.new("UICorner", TargetImg).CornerRadius = UDim.new(1,0)
local TargetNameDisp = Instance.new("TextLabel", PreviewFrame); TargetNameDisp.Size = UDim2.new(1, -100, 1, 0); TargetNameDisp.Position = UDim2.new(0, 80, 0, 0); TargetNameDisp.BackgroundTransparency = 1; TargetNameDisp.TextColor3 = Color3.new(1,1,1); TargetNameDisp.Font = MainFont; TargetNameDisp.TextSize = 15; TargetNameDisp.TextXAlignment = Enum.TextXAlignment.Left

local foundPlayer = nil
TargetInput:GetPropertyChangedSignal("Text"):Connect(function()
    local text = TargetInput.Text:lower()
    if #text >= 1 then
        for _, p in pairs(Players:GetPlayers()) do
            if p.Name:lower():sub(1, #text) == text then
                foundPlayer = p; TargetNameDisp.Text = "الهدف: " .. p.Name; TargetImg.Image = Players:GetUserThumbnailAsync(p.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150); PreviewFrame.Visible = true; return
            end
        end
    end
    PreviewFrame.Visible = false; foundPlayer = nil
end)

local btnMos, btnEgh
btnMos = createBigBtn(FunFrame, "تثبيت الرأس (خاص)", 150, function(btn)
    if foundPlayer then
        faceSitEnabled = not faceSitEnabled; bangEnabled = false; bangTarget = faceSitEnabled and foundPlayer or nil
        btn.BackgroundColor3 = faceSitEnabled and ActiveGreen or MutedPurple
        btnEgh.BackgroundColor3 = MutedPurple
        if not faceSitEnabled then resetVel() end
    end
end)

btnEgh = createBigBtn(FunFrame, "مطاردة سريعة (50)", 225, function(btn)
    if foundPlayer then
        bangEnabled = not bangEnabled; faceSitEnabled = false; bangTarget = bangEnabled and foundPlayer or nil
        btn.BackgroundColor3 = bangEnabled and ActiveGreen or MutedPurple
        btnMos.BackgroundColor3 = MutedPurple
        if not bangEnabled then resetVel() end
    end
end)

-- [ الإعدادات ]
createBigBtn(SetFrame, "كتم إشعارات الكلان: معطل", 15, function(btn)
    notificationsMuted = not notificationsMuted
    btn.Text = notificationsMuted and "كتم إشعارات الكلان: مفعل ✅" or "كتم إشعارات الكلان: معطل"
    btn.BackgroundColor3 = notificationsMuted and ActiveGreen or MutedPurple
end)
createBigBtn(SetFrame, "تدمير واجهة كلان زيرو", 90, function() notify("Clan Zero", "تم إغلاق الواجهة"); task.wait(0.3); MainGui:Destroy() end)

-- [ رصد اللاعبين ]
local function mon(p)
    if p ~= lp then notify("كلان زيرو: دخول", p.Name .. " دخل السيرفر") end
    local s = getStats(p.Name)
    s.thumb = Players:GetUserThumbnailAsync(p.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
    p.CharacterAdded:Connect(function(c) 
        local hum = c:WaitForChild("Humanoid")
        hum.Died:Connect(function() s.deaths = s.deaths + 1; updateTracker() end)
    end)
    updateTracker()
end

Players.PlayerAdded:Connect(mon)
Players.PlayerRemoving:Connect(function(p)
    notify("كلان زيرو: خروج", p.Name .. " غادر السيرفر")
    getStats(p.Name).leaves = getStats(p.Name).leaves + 1
    updateTracker()
end)

for _, p in pairs(Players:GetPlayers()) do mon(p) end
