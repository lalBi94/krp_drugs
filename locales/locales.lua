-- Author: General Zod (Owner)
-- Discord: bilaaaaaaaaaal
-- Date: written on 02/07/2023 at 20:15
-- Name: [COURS]/krp_drugs/locales/locales

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
Locales = {}

Locales.discord = {
    ["fr"] = "Lien vers le discord copie dans le presse papier !",
    ["en"] = "Discord's link copied in clipboard!"
}

Locales.canPlant = {
    ["fr"] = "Disponible",
    ["en"] = "Available"
}

Locales.recolt = {
    ["fr"] = "Appuyez sur ~INPUT_CONTEXT~ pour recolter votre drogue",
    ["en"] = "Appuyez ~INPUT_CONTEXT~ to collect your drugs"
}

Locales.missing = {
    ["fr"] = "~r~Vous n'avez pas assez de %s ~s~(x%d manquant)",
    ["en"] = "~r~You dont have enougth of %s ~s~(x%d missing)"
}

Locales.plant = {
    ["fr"] = "Appuyez sur ~INPUT_CONTEXT~ pour planter une drogue",
    ["en"] = "Press ~INPUT_CONTEXT~ to plant a drug"
}

Locales.treat = {
    notify = {
        ["fr"] = "Appuyez sur ~INPUT_CONTEXT~ pour traiter vos %s",
        ["en"] = "Press ~INPUT_CONTEXT~ to process your %s"
    }, text3d = {
        ["fr"] = "Traitez votre %s",
        ["en"] = "Process your %s"
    }, recup = {
        ["fr"] = "Recuperer votre produit !",
        ["en"] = "Take your product!"
    }, take = {
        ["fr"] = "Appuyez sur ~INPUT_CONTEXT~ pour recuperer votre produit !",
        ["en"] = "Press ~INPUT_CONTEXT~ to take your product!"
    }, action = {
        ["fr"] = "~g~Traitement en cours...",
        ["en"] = "~g~In process..."
    }
}

Locales.sell = {
    notify = {
        ["fr"] = "Appuyez sur ~INPUT_CONTEXT~ pour vendre vos %s",
        ["en"] = "Press ~INPUT_CONTEXT~ to sell your %s"
    }, text3d = {
        ["fr"] = "Vendre votre %s pour %d$/u",
        ["en"] = "Sell your %s for %d$/u"
    }, recup = {
        ["fr"] = "Recuperer votre argent !",
        ["en"] = "Take your money!"
    }, take = {
        ["fr"] = "Appuyez sur ~INPUT_CONTEXT~ pour recuperer votre argent !",
        ["en"] = "Press sur ~INPUT_CONTEXT~ to take your money!"
    }, action = {
        ["fr"] = "~g~Vente en cours...",
        ["en"] = "~g~In selling..."
    }
}