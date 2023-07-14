-- Author: General Zod (Owner)
-- Discord: bilaaaaaaaaaal
-- Date: written on 04/07/2023 at 18:47
-- Name: [Zod]/krp_drug/config.lua

--[[
    Non-Commercial Script License
    This script is licensed under the Non-Commercial Script License. You are free to use, copy, and modify 
    the script for non-commercial purposes only. You may not use this script or any derivative works for 
    commercial purposes, including but not limited to selling or distributing the script for a profit. 
    Any commercial use or sale of this script requires the express written permission of the author.
    THIS SCRIPT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT 
    LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
]]--
    
Config = {}
Config.Drugs = {}
Config.Animations = {}

Config.MarkerType = 27

Config.MarkerState = {
    [1] = { r =  0, g = 255, b = 0, a = 255 },
    [2] = { r =  255, g = 165, b = 0, a = 255 },
    [3] = { r =  255, g = 0, b = 0, a = 255 }
}

Config.Drugs.List = {
    Coca = {
        Seed = {
            name = "seedcoca",
            label = "~r~Graine de Cocaine",
            timeRecolt = 4000
        }, Recolt = {
            name = "cocaleaf",
            label = "~r~Feuille de Cocaine"
        }, Treat = {
            name = "boulettecoca",
            label = "~r~Boulette de Cocaine"
        }, Selling = {
            price = 470
        }
    }, Weed = {
        Seed = {
            name = "seedweed",
            label = "~g~Graine de Canabis",
            timeRecolt = 3500
        }, Recolt = {
            name = "weedleaf",
            label = "~g~Feuille de Canabis"
        }, Treat = {
            name = "pochonweed",
            label = "~g~Pochon de Canabis"
        }, Selling = {
            price = 400
        }
    }, Champi = {
        Seed = {
            name = "seedchampi",
            label = "~b~Graine de Champignon Hallucinogene",
            timeRecolt = 4200
        }, Recolt = {
            name = "champibrut",
            label = "~b~Champignon Hallucinogene Brut"
        }, Treat = {
            name = "boitechampi",
            label = "~b~Boite de Champignons Hallucinogènes"
        }, Selling = {
            price = 450
        }
    }
}

Config.Treat = {
    Coca = {
        id = "Coca",
        label = "Cocaine",
        value = vector3(0, 0, 0),
        color = { r = 255, g = 0, b = 0, a = 255 },
        phase = 1,
        timeTreat = 5000
    }, Weed = {
        id = "Weed",
        label = "Canabis",
        value = vector3(0, 0, 0),
        color = { r = 0, g = 255, b = 0, a = 255 },
        phase = 1,
        timeTreat = 4500
    }, Champi = {
        id = "Champi",
        label = "Champignon Hallucinogène",
        value = vector3(1902.047, 5053.461, 47),
        color = { r = 0, g = 0, b = 255, a = 255 },
        phase = 1,
        timeTreat = 5200
    }
}

Config.Selling = {
    Coca = {
        id = "Coca",
        label = "Cocaine",
        value = vector3(0, 0, 0),
        color = { r = 255, g = 0, b = 0, a = 255 },
        phase = 1,
        timeSell = 2100
    }, Weed = {
        id = "Weed",
        label = "Canabis",
        value = vector3(0, 0, 0),
        phase = 1,
        color = { r = 0, g = 255, b = 0, a = 255 },
        timeSell = 2000
    }, Champi = {
        id = "Champi",
        label = "Champignon Hallucinogène",
        value = vector3(1914.723, 5061.471, 46.00),
        color = { r = 0, g = 0, b = 255, a = 255 },
        phase = 1,
        timeSell = 2200
    }
}

Config.Drugs.Coords = {
    North = {
        { name = "one", value = vector3(1885.549, 5039.166, 48.72), phase = 1, drugOn = nil },
        { name = "two", value = vector3(1887.644, 5040.963, 48.49), phase = 1, drugOn = nil },
        { name = "three", value = vector3(1889.739, 5042.760, 48.26), phase = 1, drugOn = nil },
        { name = "four", value = vector3(1891.834, 5044.557, 48.03), phase = 1, drugOn = nil },
        { name = "five", value = vector3(1893.929, 5046.354, 47.8), phase = 1, drugOn = nil },
        { name = "six", value = vector3(1888.203, 5035.821, 48.12), phase = 1, drugOn = nil },
        { name = "seven", value = vector3(1890.386, 5037.826, 47.96), phase = 1, drugOn = nil },
        { name = "eight", value = vector3(1892.569, 5039.831, 47.80), phase = 1, drugOn = nil },
        { name = "nine", value = vector3(1894.752, 5041.836, 47.64), phase = 1, drugOn = nil },
        { name = "ten", value = vector3(1896.935, 5043.841, 47.48), phase = 1, drugOn = nil }
    }
}

Config.Drugs.Distance = {
    playerToTreat = 10,
    playerToSell = 10,
    playerToRecolt = {
        value = Config.Drugs.Coords.North[5].value,
        dist = 110
    }
}

Config.Animations.recolte = {
    dictionnary = "weapons@first_person@aim_rng@generic@projectile@thermal_charge@",
    name = "plant_floor"
}