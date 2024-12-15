fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'CStrikerDJ'
description 'This script saves and retrieves the Discord ID for players when they join the server. It stores the Discord ID alongside the player\'s license ID in the database using oxmysql.'
version '1.0.0'

server_script 'server.lua'

dependencies {
    'oxmysql', -- Use oxmysql for database interaction instead of mysql-async
}

homepage 'https://github.com/YourUsername/discord-id-saver' -- Link to your GitHub or documentation
repository 'https://github.com/YourUsername/discord-id-saver' -- URL to the repository for others to use or contribute


exports {
    'getPlayerDiscordId', -- Example export for retrieving player Discord ID from the server-side
}

