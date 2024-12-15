# Save Discord ID Resource for FiveM

This resource is a simple script that saves a player's Discord ID into a database. The script can be easily extended and used with other resources.

---

## Features
- Detects a player's Discord ID when they join the server.
- Saves the Discord ID to a MySQL database.
- Can be accessed by other resources for further development.

---

## Requirements
- **FiveM Server** with QBCore or ESX framework support.
- **MySQL** or MariaDB for the database.
- **Discord Ace Perms** or the `discordroles` system enabled.

---

## Installation

### 1. Add Database Table
Run the following SQL query to create the table for saving Discord IDs:

```sql
CREATE TABLE IF NOT EXISTS `player_discord_ids` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `identifier` VARCHAR(50) NOT NULL,
    `discord_id` VARCHAR(30) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE (`identifier`)
);
```

### 2. Create the Resource
Make a new folder in your `resources` directory called `save_discord_id`.

Add the following files:

#### **fxmanifest.lua**
```lua
fx_version 'cerulean'
game 'gta5'

author 'Rohtash'
description 'Save Discord ID to the database.'
version '1.0.0'

server_script 'server.lua'
shared_script '@oxmysql/lib/MySQL.lua' -- Change to your MySQL library.
```

## Usage

1. Place the folder `save_discord_id` in your `resources` directory.
2. Add `ensure save_discord_id` to your **server.cfg**.
3. Restart the server.

## Notes
- Ensure that players have their Discord account connected to FiveM for the script to work.
- You need to have the **MySQL library** (`oxmysql` or equivalent) installed and configured in your server.

---

## Credits
Developed by **Rohtash**

---

## License
This resource is open-source. You are free to use and modify it for your server.

---
