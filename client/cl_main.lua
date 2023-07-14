-- Author: General Zod (Owner)
-- Discord: bilaaaaaaaaaal
-- Date: written on 04/07/2023 at 18:47
-- Name: [Zod]/krp_drug/client/cl_main.lua

--[[
    Non-Commercial Script License
    This script is licensed under the Non-Commercial Script License. You are free to use, copy, and modify 
    the script for non-commercial purposes only. You may not use this script or any derivative works for 
    commercial purposes, including but not limited to selling or distributing the script for a profit. 
    Any commercial use or sale of this script requires the express written permission of the author.
    THIS SCRIPT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT 
    LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
]]--

--- Spaghetti per moment but work.

Citizen.CreateThread(function()
    print("^5?^1--------------------------------------^5?")
    print("^1| Script: ^5krp_drugs                    ^1|")
    print("^1| ^7Author: bilaaaaaaaaaal (General ^3Zod^7) ^1|")
    print("^1| ^2Powered ^3by ZODWorks                  ^1|")
    print("^5?^1--------------------------------------^5?^7")
end)

ZODWorks = exports["ZODWorks"]:getSharedObject()
PlayerCoords = nil
Chronos = {}

--- Change the state of marker
---@param of vector3 The coords to change.
---@param by number The new state {1, 2, 3}.
---@param drug table The drogues inside the marker.
function changeState(of, by, drug)
    for _, v in pairs(Config.Drugs.Coords) do
        for _, y in pairs(v) do
            if(y.value == of) then
                y.phase = by
                y.drugOn = drug
            end
        end
    end
end

RegisterNetEvent("zod::receiveDrugEnd", function(coords)
    if(coords ~= nil) then
        changeState(coords, 1, nil)
    end
end)

RegisterNetEvent("zod::TreatEnd", function(name)
    Config.Treat[name]["phase"] = 1
end)

RegisterNetEvent("zod::SellEnd", function(id)
    Config.Selling[id]["phase"] = 1
end)

RegisterNetEvent("zod::receiveHaveBase", function(can, id)
    if(can.flag) then
        ZODWorks.Player:doAnimation(Config.Animations.recolte.dictionnary, Config.Animations.recolte.name)
        ZODWorks.Player:notify(Locales.treat.action[CurrentLocale])
        Config.Treat[id]["phase"] = 2
    else
        ZODWorks.Player:notify((Locales.missing[CurrentLocale]):format(Config.Drugs.List[id]["Recolt"]["label"], can.miss))
    end
end)

RegisterNetEvent("zod::receiveHaveTreat", function(can, id)
    if(can.flag) then
        ZODWorks.Player:doAnimation(Config.Animations.recolte.dictionnary, Config.Animations.recolte.name)
        ZODWorks.Player:notify(Locales.sell.action[CurrentLocale])
        Config.Selling[id]["phase"] = 2
    else
        ZODWorks.Player:notify((Locales.missing[CurrentLocale]):format(Config.Drugs.List[id]["Treat"]["label"], 1))
    end
end)

Citizen.CreateThread(function()
    while(true) do
        PlayerCoords = ZODWorks.Player:getCoords()
        Citizen.Wait(200)
    end
end)

--- Recolt
Citizen.CreateThread(function()
    while(true) do
        local canUse = false
        local dist = ZODWorks.Utils:getDistanceBetween(PlayerCoords,
                Config.Drugs.Distance.playerToRecolt.value) < Config.Drugs.Distance.playerToRecolt.dist

        for _, v in pairs(Config.Drugs.Coords) do
            for x, y in pairs(v) do
                if(dist) then
                    canUse = true

                    if(canUse) then
                        if(y.phase == 1) then
                            ZODWorks.Game:createMarker(Config.MarkerType, y.value, Config.MarkerState[y.phase], false, false)
                            ZODWorks.Game:create3dText(Locales.canPlant[CurrentLocale], y.value, { r = 255, g = 255, b = 255, a = 255 }, 4, true)

                            if(ZODWorks.Utils:getDistanceBetween(PlayerCoords, y.value) < 1.67) then
                                ZODWorks.Game:helpNotify(Locales.plant[CurrentLocale])

                                if(IsControlJustPressed(1, 54)) then
                                    SetDisplay(true, y.value)
                                end
                            end
                        elseif y.phase == 2 then
                            if(not Chronos[y.name]) then
                                Chronos[y.name] = 0
                            elseif Chronos[y.name] == -1 or Chronos[y.name] > y.drugOn["Seed"]["timeRecolt"] then
                                Chronos[y.name] = -1
                            else
                                Chronos[y.name] = Chronos[y.name] + 1
                            end

                            ZODWorks.Game:createMarker(Config.MarkerType, y.value, Config.MarkerState[y.phase], false, false)
                            ZODWorks.Game:create3dText(y.drugOn["Seed"]["label"], y.value, { r = 255, g = 255, b = 255, a = 255 }, 4, true)
                            ZODWorks.Game:create3dText(
                                    ("%d%s"):format(math.floor((Chronos[y.name] / y.drugOn["Seed"]["timeRecolt"]) * 100), "%"),
                                    vector3(y.value.x, y.value.y, y.value.z + 0.5), { r = 255, g = 255, b = 255, a = 255 }, 4, true
                            )

                            if(Chronos[y.name] == -1) then
                                Chronos[y.name] = nil
                                y.phase = 3
                            end
                        elseif y.phase == 3 then
                            ZODWorks.Game:createMarker(Config.MarkerType, y.value, Config.MarkerState[y.phase], false, false)
                            ZODWorks.Game:create3dText(y.drugOn["Seed"]["label"], y.value, { r = 255, g = 255, b = 255, a = 255 }, 4, true)

                            if(ZODWorks.Utils:getDistanceBetween(PlayerCoords, y.value) < 1.67) then
                                ZODWorks.Game:helpNotify(Locales.recolt[CurrentLocale])

                                if(IsControlJustPressed(1, 54)) then
                                    ZODWorks.Player:doAnimation(Config.Animations.recolte.dictionnary, Config.Animations.recolte.name)
                                    ZODWorks.KRPDrugs:playerRecolt(y.drugOn, y.value)
                                end
                            end
                        end
                    end
                else
                    canUse = false
                end
            end
        end

        Citizen.Wait(1)
    end
end)

--- Process
Citizen.CreateThread(function()
    while(true) do
        for _, v in pairs(Config.Treat) do
            if(ZODWorks.Utils:getDistanceBetween(PlayerCoords, v.value) < Config.Drugs.Distance.playerToTreat) then
                if(v.phase == 1) then
                    ZODWorks.Game:createMarker(Config.MarkerType, v.value, v.color, false, false)
                    ZODWorks.Game:helpNotify((Locales.treat.notify[CurrentLocale]):format(Config.Drugs.List[v.id]["Recolt"].label))
                    ZODWorks.Game:create3dText(
                            (Locales.treat.text3d[CurrentLocale]):format(v.label),
                            v.value, { r = 255, g = 255, b = 255, a = 255 }, 4, true
                    )

                    if(IsControlJustPressed(1, 54)) then
                        ZODWorks.KRPDrugs:haveBase(Config.Drugs.List[v.id], v.id)
                    end
                elseif v.phase == 2 then
                    if(not Chronos[v.id]) then
                        Chronos[v.id] = 0
                    elseif Chronos[v.id] == -1 or Chronos[v.id] > v.timeTreat then
                        Chronos[v.id] = -1
                    else
                        Chronos[v.id] = Chronos[v.id] + 1
                    end

                    ZODWorks.Game:createMarker(Config.MarkerType, v.value, { r = 255, g = 255, b = 255, a = 255 }, false, false)
                    ZODWorks.Game:create3dText(
                            ("%d%s"):format(math.floor((Chronos[v.id] / v.timeTreat) * 100), "%"),
                            v.value, { r = 255, g = 255, b = 255, a = 255 }, 4, true
                    )

                    if(Chronos[v.id] == -1) then
                        Chronos[v.id] = nil
                        v.phase = 3
                    end
                elseif v.phase == 3 then
                    ZODWorks.Game:createMarker(Config.MarkerType, v.value, { r = 255, g = 0, b = 0, a = 255 }, false, false)
                    ZODWorks.Game:create3dText(Locales.treat.recup[CurrentLocale], v.value, { r = 255, g = 255, b = 255, a = 255 }, 4, true)
                    ZODWorks.Game:helpNotify(Locales.treat.take[CurrentLocale])

                    if(IsControlJustPressed(1, 54)) then
                        ZODWorks.Player:doAnimation(Config.Animations.recolte.dictionnary, Config.Animations.recolte.name)
                        ZODWorks.KRPDrugs:playerTreat(Config.Drugs.List[v.id], v.id)
                    end
                end
            end
        end

        Citizen.Wait(0)
    end
end)

--- Selling
Citizen.CreateThread(function()
    while(true) do
        for _, v in pairs(Config.Selling) do
            if(ZODWorks.Utils:getDistanceBetween(PlayerCoords, v.value) < Config.Drugs.Distance.playerToSell) then
                if(v.phase == 1) then
                    ZODWorks.Game:createMarker(Config.MarkerType, v.value, v.color, false, false)
                    ZODWorks.Game:helpNotify((Locales.sell.notify[CurrentLocale]):format(Config.Drugs.List[v.id]["Treat"].label))
                    ZODWorks.Game:create3dText(
                            (Locales.sell.text3d[CurrentLocale]):format(v.label, Config.Drugs.List[v.id]["Selling"].price),
                            v.value, { r = 255, g = 255, b = 255, a = 255 }, 4, true
                    )

                    if(IsControlJustPressed(1, 54)) then
                        ZODWorks.KRPDrugs:haveTreat(Config.Drugs.List[v.id], v.id)
                    end
                elseif(v.phase == 2) then
                    if(not Chronos[v.id]) then
                        Chronos[v.id] = 0
                    elseif Chronos[v.id] == -1 or Chronos[v.id] > v.timeSell then
                        Chronos[v.id] = -1
                    else
                        Chronos[v.id] = Chronos[v.id] + 1
                    end

                    ZODWorks.Game:createMarker(Config.MarkerType, v.value, { r = 255, g = 255, b = 255, a = 255 }, false, false)
                    ZODWorks.Game:create3dText(
                            ("%d%s"):format(math.floor((Chronos[v.id] / v.timeSell) * 100), "%"),
                            v.value, { r = 255, g = 255, b = 255, a = 255 }, 4, true
                    )

                    if(Chronos[v.id] == -1) then
                        Chronos[v.id] = nil
                        v.phase = 3
                    end
                elseif(v.phase == 3) then
                    ZODWorks.Game:createMarker(Config.MarkerType, v.value, { r = 255, g = 0, b = 0, a = 255 }, false, false)
                    ZODWorks.Game:create3dText(Locales.sell.recup[CurrentLocale], v.value, { r = 255, g = 255, b = 255, a = 255 }, 4, true)
                    ZODWorks.Game:helpNotify(Locales.sell.take[CurrentLocale])

                    if(IsControlJustPressed(1, 54)) then
                        ZODWorks.Player:doAnimation(Config.Animations.recolte.dictionnary, Config.Animations.recolte.name)
                        ZODWorks.KRPDrugs:playerSell(Config.Drugs.List[v.id], v.id, Config.Drugs.List[v.id]["Selling"].price)
                    end
                end
            end
        end

        Citizen.Wait(0)
    end
end)