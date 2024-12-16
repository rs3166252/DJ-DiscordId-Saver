local MySQL = exports.oxmysql -- Use oxmysql for database queries

local playerLicenses = {}  -- Table to store player licenses


-- Ensure the table exists when the resource starts
AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        print("^2Checking for 'player_identifiers' table existence...^0")
        MySQL:execute([[
            CREATE TABLE IF NOT EXISTS `player_identifiers` (
                `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
                `license` VARCHAR(50) NOT NULL COLLATE 'utf8mb3_general_ci',
                `discord` VARCHAR(50) NOT NULL COLLATE 'utf8mb3_general_ci',
                PRIMARY KEY (`id`) USING BTREE,
                UNIQUE INDEX `license` (`license`) USING BTREE
            ) COLLATE='utf8mb3_general_ci' ENGINE=InnoDB;
        ]], {}, function()
            print("^2Table 'player_identifiers' checked/created successfully.^0")
        end)
    end
end)


-- Store the player's license when they join
AddEventHandler('playerJoining', function()
    local src = source
    local identifiers = GetPlayerIdentifiers(src)
    local playerData = {
        steam = nil,
        license = nil,
        discord = nil,
        ip = nil
    }

    -- Loop through identifiers and extract needed values
    for _, id in ipairs(identifiers) do
        if string.find(id, 'steam') then
            playerData.steam = id
        elseif string.find(id, 'license:') then
            playerData.license = id -- The first license ID
        elseif string.find(id, 'discord') then
            playerData.discord = id -- The Discord ID
        elseif string.find(id, 'ip') then
            playerData.ip = id -- The IP address
        end
    end

    -- Debugging output for identifier checking
    print("Discord ID: " .. (playerData.discord or "Not Found"))
    print("License ID: " .. (playerData.license or "Not Found"))

    -- Check if both Discord and License IDs exist before saving to database
    if playerData.license and playerData.discord then
        MySQL:execute('INSERT INTO player_identifiers (license, discord) VALUES (?, ?) ON DUPLICATE KEY UPDATE discord = ?', 
        {playerData.license, playerData.discord, playerData.discord}, function(result)
            if result and result.affectedRows > 0 then
                print("Record successfully inserted or updated.")
            else
                print("No changes were made to the database.")
            end
        end)
    else
        print("No Discord ID or License found for player: " .. src)
    end
end)



-- Retrieve the Discord ID based on the player's license
RegisterServerEvent('discord-id-saver:getPlayerInfo')
AddEventHandler('discord-id-saver:getPlayerInfo', function()
    local src = source
    local licenseId = playerLicenses[src]  -- Get the player's license from the playerLicenses table

    if licenseId then
        -- Query the database to get the Discord ID for the player based on their license
        MySQL:fetchScalar('SELECT discord FROM player_identifiers WHERE license = ?', {licenseId}, function(data)
            if data then
                TriggerClientEvent('discord-id-saver:sendPlayerInfo', src, data.discord)
            else
                TriggerClientEvent('discord-id-saver:sendPlayerInfo', src, nil)
            end
        end)
    else
        print("No license found for player: " .. src)
    end
end)
