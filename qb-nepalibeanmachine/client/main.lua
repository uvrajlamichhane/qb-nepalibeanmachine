local QBCore = exports['qb-core']:GetCoreObject()
isLoggedIn = false
local onDuty = false
PlayerJob = {}

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

Citizen.CreateThread(function()
    nepalibeanmachine = AddBlipForCoord(281.12, -969.15, 29.42)
    SetBlipSprite (nepalibeanmachine, 417)
    SetBlipDisplay(nepalibeanmachine, 4)
    SetBlipScale  (nepalibeanmachine, 0.5)
    SetBlipAsShortRange(nepalibeanmachine, true)
    SetBlipColour(nepalibeanmachine, 81)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("nepalibeanmachine")
    EndTextCommandSetBlipName(nepalibeanmachine)
end) 

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "nepalibeanmachine" then
                TriggerServerEvent("QBCore:ToggleDuty")
            end
        end
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
	onDuty = duty
end)

RegisterNetEvent("qb-nepalibeanmachine:DutyB")
AddEventHandler("qb-nepalibeanmachine:DutyB", function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent("qb-nepalibeanmachine:Tray1")
AddEventHandler("qb-nepalibeanmachine:Tray1", function()
    TriggerEvent("inventory:client:SetCurrentStash", "khajatray1")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "khajatray1", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-nepalibeanmachine:Tray2")
AddEventHandler("qb-nepalibeanmachine:Tray2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "khajatray2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "khajatray2", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-nepalibeanmachine:Tray3")
AddEventHandler("qb-nepalibeanmachine:Tray3", function()
    TriggerEvent("inventory:client:SetCurrentStash", "khajatray3")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "khajatray3", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-nepalibeanmachine:Tray4")
AddEventHandler("qb-nepalibeanmachine:Tray4", function()
    TriggerEvent("inventory:client:SetCurrentStash", "khajatray4")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "khajatray4", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-nepalibeanmachine:Storage")
AddEventHandler("qb-nepalibeanmachine:Storage", function()
    TriggerEvent("inventory:client:SetCurrentStash", "khajastorage")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "khajastorage", {
        maxweight = 250000,
        slots = 40,
    })
end)

function MakeBlackTea()
    TriggerServerEvent('QBCore:Server:RemoveItem', "suger", 1)
    QBCore.Functions.Progressbar("pickup", "Filling a cup with Black Tea..", 4000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    })
    Citizen.Wait(4000)
    TriggerServerEvent('QBCore:Server:AddItem', "blacktea", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["blacktea"], "add")
    QBCore.Functions.Notify("You made a Black Tea", "success")
end  


function MakeMilkTea()
    TriggerServerEvent('QBCore:Server:RemoveItem', "milk", 1)
    TriggerServerEvent('QBCore:Server:RemoveItem', "suger", 1)
    QBCore.Functions.Progressbar("pickup", "Filling up a cup with Milk Tea..", 4000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    })
    Citizen.Wait(4000)
    TriggerServerEvent('QBCore:Server:AddItem', "milktea", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["milktea"], "add")
    QBCore.Functions.Notify("You made a Milk Tea", "success")
end  

--Item Remove
RegisterNetEvent("qb-nepalibeanmachine:blacktea")
AddEventHandler("qb-nepalibeanmachine:blacktea", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           MakeBlackTea()
        else
            QBCore.Functions.Notify("You don't have any suger..", "error")
        end
      end, 'suger')
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)


RegisterNetEvent("qb-nepalibeanmachine:milktea")
AddEventHandler("qb-nepalibeanmachine:milktea", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           MakeMilkTea()
        else
            QBCore.Functions.Notify("You don't have any milk..", "error")
        end
      end, 'milk')
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

RegisterNetEvent("qb-nepalibeanmachine:tarkari")
AddEventHandler("qb-nepalibeanmachine:tarkari", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           MakeTarkari()
        else
            QBCore.Functions.Notify("You don't have any chana..", "error")
        end
      end, 'chana')
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

RegisterNetEvent("qb-nepalibeanmachine:samosa")
AddEventHandler("qb-nepalibeanmachine:samosa", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           MakeSamosa()
        else
            QBCore.Functions.Notify("You don't have any aalu..", "error")
        end
      end, 'aalu')
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

RegisterNetEvent("qb-nepalibeanmachine:momo")
AddEventHandler("qb-nepalibeanmachine:momo", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           MakeMoMo()
        else
            QBCore.Functions.Notify("You don't have any keema..", "error")
        end
      end, 'keema')
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

RegisterNetEvent("qb-nepalibeanmachine:jari")
AddEventHandler("qb-nepalibeanmachine:jari", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           MakeJari()
        else
            QBCore.Functions.Notify("You don't have any aata..", "error")
        end
      end, 'aata')
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

RegisterNetEvent("qb-nepalibeanmachine:puri")
AddEventHandler("qb-nepalibeanmachine:puri", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           MakePuri()
        else
            QBCore.Functions.Notify("You don't have any chat..", "error")
        end
      end, 'chat')
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

RegisterNetEvent("qb-nepalibeanmachine:chawmin")
AddEventHandler("qb-nepalibeanmachine:chawmin", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           MakeChawmin()
        else
            QBCore.Functions.Notify("You don't have any noodles..", "error")
        end
      end, 'noodles')
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

RegisterNetEvent("qb-nepalibeanmachine:pakoda")
AddEventHandler("qb-nepalibeanmachine:pakoda", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           MakePakoda()
        else
            QBCore.Functions.Notify("You don't have any onion..", "error")
        end
      end, 'onion')
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

--Khaja ko item haru
function MakeMoMo()
    TriggerServerEvent('QBCore:Server:RemoveItem', "keema", 1)
    TriggerServerEvent('QBCore:Server:RemoveItem', "aata", 1)
    QBCore.Functions.Progressbar("pickup_sla", "Making Momo..", 4000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    })
    Citizen.Wait(4000)
    TriggerServerEvent('QBCore:Server:AddItem', "momo", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["momo"], "add")
    QBCore.Functions.Notify("You made a MoMo", "success")
end  

function MakeSamosa()
    TriggerServerEvent('QBCore:Server:RemoveItem', "aalu", 1)
    TriggerServerEvent('QBCore:Server:RemoveItem', "aata", 1)
    QBCore.Functions.Progressbar("pickup_sla", "Making Samosa..", 4000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    })
    Citizen.Wait(4000)
    TriggerServerEvent('QBCore:Server:AddItem', "samosa", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["samosa"], "add")
    QBCore.Functions.Notify("You made a Samosa", "success")
end  

function MakePuri()
    TriggerServerEvent('QBCore:Server:RemoveItem', "chat", 1)
    TriggerServerEvent('QBCore:Server:RemoveItem', "aata", 1)
    QBCore.Functions.Progressbar("pickup_sla", "Making Puri..", 4000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    })
    Citizen.Wait(4000)
    TriggerServerEvent('QBCore:Server:AddItem', "puri", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["puri"], "add")
    QBCore.Functions.Notify("You made a Puri", "success")
end  

function MakeJari()
    TriggerServerEvent('QBCore:Server:RemoveItem', "aata", 1)
    TriggerServerEvent('QBCore:Server:RemoveItem', "suger", 1)
    QBCore.Functions.Progressbar("pickup_sla", "Making Jari..", 4000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    })
    Citizen.Wait(4000)
    TriggerServerEvent('QBCore:Server:AddItem', "jari", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["jari"], "add")
    QBCore.Functions.Notify("You made a Jari", "success")
end  

function MakeChawmin()
    TriggerServerEvent('QBCore:Server:RemoveItem', "noodles", 1)
    QBCore.Functions.Progressbar("pickup_sla", "Making Chawmin..", 4000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    })
    Citizen.Wait(4000)
    TriggerServerEvent('QBCore:Server:AddItem', "chawmin", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["chawmin"], "add")
    QBCore.Functions.Notify("You made a Chawmin", "success")
end  

function MakePakoda()
    TriggerServerEvent('QBCore:Server:RemoveItem', "onion", 1)
    TriggerServerEvent('QBCore:Server:RemoveItem', "aata", 1)
    QBCore.Functions.Progressbar("pickup_sla", "Making Pakoda..", 4000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    })
    Citizen.Wait(4000)
    TriggerServerEvent('QBCore:Server:AddItem', "pakoda", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["pakoda"], "add")
    QBCore.Functions.Notify("You made a Pakoda", "success")
end  

function MakeTarkari()
    TriggerServerEvent('QBCore:Server:RemoveItem', "chana", 1)
    TriggerServerEvent('QBCore:Server:RemoveItem', "aalu", 1)
    QBCore.Functions.Progressbar("pickup_sla", "Making Tarkari..", 4000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    })
    Citizen.Wait(4000)
    TriggerServerEvent('QBCore:Server:AddItem', "tarkari", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["tarkari"], "add")
    QBCore.Functions.Notify("You made a Tarkari", "success")
end  

RegisterNetEvent("qb-nepalibeanmachine:shop")
AddEventHandler("qb-nepalibeanmachine:shop", function()


    TriggerServerEvent("inventory:server:OpenInventory", "shop", "nepalibeanmachine", Config.Items)


end)