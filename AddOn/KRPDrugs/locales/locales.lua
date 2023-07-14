-- Author: General Zod (Owner)
-- Discord: bilaaaaaaaaaal
-- Date: written on 06/07/2023 at 05:53
-- Name: resources/[Zod]/ZODWorks/shared/AddOns/KRPDrugs/locales/locales.lua

--[[
    Non-Commercial Script License
    This script is licensed under the Non-Commercial Script License. You are free to use, copy, and modify 
    the script for non-commercial purposes only. You may not use this script or any derivative works for 
    commercial purposes, including but not limited to selling or distributing the script for a profit. 
    Any commercial use or sale of this script requires the express written permission of the author.
    THIS SCRIPT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT 
    LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
]]--

CurrentLocale = "fr"
Locales = Locales or {}

Locales.Inventory = {
    miss = {
        ["fr"] = "~r~Vous n'avez pas assez de place dans votre inventaire !",
        ["en"] = "~r~You don't have enough room in your inventory!"
    }
}

Locales.Money = {
    add = {
        ["fr"] = "~g~Vous venez de recuperer %d$",
        ["en"] = "~g~You just won %d$"
    }
}

Locales.Seeds = {
    ["fr"] = "Une %s ~s~ a survecu !",
    ["en"] = "A %s ~s~ survive !"
}
