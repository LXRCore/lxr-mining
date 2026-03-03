--[[
    ██╗     ██╗  ██╗██████╗        ███╗   ███╗██╗███╗   ██╗██╗███╗   ██╗ ██████╗
    ██║     ╚██╗██╔╝██╔══██╗      ████╗ ████║██║████╗  ██║██║████╗  ██║██╔════╝
    ██║      ╚███╔╝ ██████╔╝█████╗██╔████╔██║██║██╔██╗ ██║██║██╔██╗ ██║██║  ███╗
    ██║      ██╔██╗ ██╔══██╗╚════╝██║╚██╔╝██║██║██║╚██╗██║██║██║╚██╗██║██║   ██║
    ███████╗██╔╝ ██╗██║  ██║      ██║ ╚═╝ ██║██║██║ ╚████║██║██║ ╚████║╚██████╔╝
    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝      ╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═══╝ ╚═════╝

    🐺 LXR Mining System — The Land of Wolves

    An immersive, multi-framework mining resource for RedM.
    Players mine at designated quarry locations, process raw ore, and sell
    refined materials through a vendor NPC — all with full framework support.

    ═══════════════════════════════════════════════════════════════════════════════
    SERVER INFORMATION
    ═══════════════════════════════════════════════════════════════════════════════

    Server:      The Land of Wolves 🐺
    Developer:   iBoss21 / The Lux Empire
    Website:     https://www.wolves.land
    Discord:     https://discord.gg/CrKcWdfd3A
    Store:       https://theluxempire.tebex.io

    ═══════════════════════════════════════════════════════════════════════════════

    Version:     1.0.0
    Framework:   LXR-Core (Primary) · RSG-Core · VORP Core

    ═══════════════════════════════════════════════════════════════════════════════
    CREDITS
    ═══════════════════════════════════════════════════════════════════════════════

    Script Author: iBoss21 / The Lux Empire for The Land of Wolves

    © 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved
]]

fx_version 'cerulean'
game       'rdr3'

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

name        'lxr-mining'
author      'iBoss21 / The Lux Empire | wolves.land'
description '🐺 LXR Mining System — The Land of Wolves'
version     '1.0.0'
lua54       'yes'

client_scripts { 'client/*.lua' }

server_scripts { 'server/*.lua' }

shared_scripts { '@lxr-core/shared/locale.lua', 'config.lua', 'locales/*.lua' }

