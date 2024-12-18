# **Save Discord ID Resource for FiveM**

🔗 **A lightweight and efficient script** to detect and save a player's Discord ID into a database. Perfect for integrating with other server systems or building advanced features.

---

## **Features**
- ✅ **Auto-Detect Discord IDs**: Captures a player's Discord ID when they join the server.
- 🗃️ **Database Integration**: Saves the Discord ID into a MySQL database for easy access.
- 🔧 **Extensible**: Other resources can retrieve and use the stored Discord IDs for custom functionality.
- 🚀 **Performance Friendly**: Optimized to run seamlessly on your server.

---

## **Requirements**
To use this resource, ensure you have the following:
- 🛠️ **FiveM Server** with QBCore Framework
- 🗄️ **MySQL** or **MariaDB** for database storage
- 🛡️ **Discord Ace Permissions** enabled or **discordroles** configured

---

## **Installation**

### **Step 1: Add the Resource**
1. Download the resource and place the folder `save_discord_id` into your **resources** directory.

### **Step 2: Update Server Configuration**
Add the following line to your **server.cfg** file:

```cfg
ensure save_discord_id
