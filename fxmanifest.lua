fx_version 'adamant'
game 'gta5'
lua54 'yes'

author "General Zod | Discord: bilaaaaaaaaaal"
description "Drugs script for Metropolis"

ui_page {
    "ui/main.html"
}

files {
    "ui/assets/discord_logo.png",
    "ui/assets/exit_logo.png",
    "ui/assets/weed_logo.gif",
    "ui/main.html",
    "ui/main.js",
    "ui/main.css"
}

client_scripts {
    "config.lua",
    "locales/locales.lua",
    "client/cl_main.lua",
    "client/cl_uiFn.lua",
    "AddOn/KRPDrugs/locales/locales.lua",
    "AddOn/KRPDrugs/KRPDrugs.lua",
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    "AddOn/KRPDrugs/locales/locales.lua",
    "AddOn/KRPDrugs/SKRPDrugs.lua"
}

shared_scripts {
    "@ZODWorks/shared/ZODWorks.lua",
}