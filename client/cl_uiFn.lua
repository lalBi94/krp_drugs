-- Author: General Zod (Owner)
-- Discord: bilaaaaaaaaaal
-- Date: written on 03/07/2023 at 02:53
-- Name: [COURS]/krp_pets/client/cl_uiFn.lua

--[[
    Non-Commercial Script License
    This script is licensed under the Non-Commercial Script License. You are free to use, copy, and modify 
    the script for non-commercial purposes only. You may not use this script or any derivative works for 
    commercial purposes, including but not limited to selling or distributing the script for a profit. 
    Any commercial use or sale of this script requires the express written permission of the author.
    THIS SCRIPT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT 
    LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
]]--

ZODWorks = exports["ZODWorks"]:getSharedObject()
LastCall = nil

RegisterNetEvent("zod::receiveHaveSeed", function(check, drug)
    if(check) then
        parcel(drug)
    else
        ZODWorks.Player:notify(("~r~Vous ne possedez pas de %s"):format(drug["Seed"]["label"]))
    end
end)

function parcel(drug)
    if(LastCall ~= nil) then
        ZODWorks.Player:notify(("Vous venez de planter une %s"):format(drug["Seed"]["label"]))
        ZODWorks.Player:doAnimation(Config.Animations.recolte.dictionnary, Config.Animations.recolte.name)
        changeState(LastCall, 2, drug)
    end
end

Citizen.CreateThread(function()
    while(onFocus) do
        Citizen.Wait(0)
        DisableControlAction(0, 142, onFocus)
        DisableControlAction(0, 18, onFocus)
        DisableControlAction(0, 322, onFocus)
        DisableControlAction(0, 106, onFocus)
    end
end)

RegisterNUICallback("exit", function(data)
    SetDisplay(false)
end)

RegisterNUICallback("discord", function(data)
    ZODWorks.Player:notify(Locales.discord[CurrentLocale])
end)

RegisterNUICallback("submit", function(data)
    local choice = data.choice

    local isChoiceExist = false
    local choiceObj = nil

    print(data.choice)

    SetDisplay(false)

    for _, v in pairs(Config.Drugs.List) do
        for x, y in pairs(v) do
            if(y.name == choice) then
                isChoiceExist = true
                choiceObj = v
            end
        end
    end

    if(not isChoiceExist) then
        ZODWorks.Player:notify("~r~Ca cheat ouuuu")
        return nil
    else
        ZODWorks.KRPDrugs:haveSeed(choiceObj)
    end
end)

---Display the UI interface.
---@param bool boolean Set true for active.
---@param coords vector3 The activated coords.
function SetDisplay(bool, coords)
    onFocus = bool
    SetNuiFocus(bool, bool)

    if(coords ~= nil) then
        LastCall = coords
    end

    SendNUIMessage({
        type = "ui",
        status = bool
    })
end