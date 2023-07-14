-- Author: General Zod (Owner)
-- Discord: bilaaaaaaaaaal
-- Date: written on 06/07/2023 at 05:54
-- Name: resources/[Zod]/ZODWorks/shared/AddOns/KRPDrugs/SKRPDrugs

--[[
    Non-Commercial Script License
    This script is licensed under the Non-Commercial Script License. You are free to use, copy, and modify 
    the script for non-commercial purposes only. You may not use this script or any derivative works for 
    commercial purposes, including but not limited to selling or distributing the script for a profit. 
    Any commercial use or sale of this script requires the express written permission of the author.
    THIS SCRIPT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT 
    LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
]]--

ESX = exports["es_extended"]:getSharedObject()

--- Check if the player have seed.
---@param drug table The drug object.
---@return table
RegisterNetEvent("zod::haveSeed", function(drug)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)

    local item = xPlayer.hasItem(drug["Seed"]["name"])
    if(item) then
        xPlayer.removeInventoryItem(drug["Seed"]["name"], 1)
        TriggerClientEvent("zod::receiveHaveSeed", _src, true, drug)
    else
        TriggerClientEvent("zod::receiveHaveSeed", _src, false, drug)
    end
end)

--- Check if the player have brut matter.
---@param drug table The drug object..
---@id ID of the marker.
---@return table
RegisterNetEvent("zod::haveBase", function(drug, id)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local item = xPlayer.getInventoryItem(drug["Recolt"]["name"])
    local check = item.count >= 10
    TriggerClientEvent("zod::receiveHaveBase", _src, { flag = check, miss = (10 - item.count) }, id)
end)

--- Check if the player have the package matter.
---@param drug table The drug object.
---@id ID of the marker.
---@return table
RegisterNetEvent("zod::haveTreat", function(drug, id)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local item = xPlayer.getInventoryItem(drug["Treat"]["name"])
    local check = item.count >= 1

    TriggerClientEvent("zod::receiveHaveTreat", _src, { flag = check, miss = 1 }, id)
end)

--- When player recolt his drugs.
---@param drug table The drug object.
---@param coords vector3 The coords of the marker.
RegisterNetEvent("zod::playerRecolt", function(drug, coords)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local winGrain = math.random() >= 0.5 and 1 or 0

    if(xPlayer.canCarryItem(drug["Recolt"]["name"], 10)) then
        if(winGrain == 1) then
            xPlayer.addInventoryItem(drug["Seed"]["name"], 1)
            xPlayer.showNotification((Locales.Seeds[CurrentLocale]):format(drug["Seed"]["label"]))
        end

        xPlayer.addInventoryItem(drug["Recolt"]["name"], 10)
        xPlayer.showNotification(("Vous venez de recuperer x10 %s ~s~!"):format(drug["Recolt"]["label"]))
        TriggerClientEvent("zod::receiveDrugEnd", _src, coords)
    else
        xPlayer.showNotification((Locales.Inventory.miss[CurrentLocale]))
        TriggerClientEvent("zod::receiveDrugEnd", _src, nil)
    end
end)

--- When player process his drugs.
---@param drug table The drug object.
---@param name vector3 The coords of the marker.
RegisterNetEvent("zod::playerTreat", function(drug, name)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)

    if(xPlayer.canCarryItem(drug["Treat"]["name"], 5)) then
        xPlayer.removeInventoryItem(drug["Recolt"]["name"], 10)
        xPlayer.addInventoryItem(drug["Treat"]["name"], 5)
        TriggerClientEvent("zod::TreatEnd", _src, name)
    else
        xPlayer.showNotification(Locales.Inventory.miss[CurrentLocale])
    end
end)

--- When player sell his drugs.
---@param drug table The drug object.
---@param id vector3 The coords of the marker.
---@param price number The drug price/u
RegisterNetEvent("zod::playerSell", function(drug, id, price)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)

    xPlayer.removeInventoryItem(drug["Treat"]["name"], 1)
    xPlayer.addAccountMoney("black_money", price)

    xPlayer.showNotification((Locales.Money.add[CurrentLocale]):format(price))
    TriggerClientEvent("zod::SellEnd", _src, id)
end)