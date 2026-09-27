# FiveM Data Manager

A versatile FiveM script for managing player data with ESX integration.

## Features

- ESX integration for seamless player data management
- Database setup and data storage functionality
- Client and server-side events for data handling
- Commands and callbacks for efficient data operations

## Requirements

- FiveM server with ESX Legacy installed
- MySQL database

## Installation

1. Download the script files.
2. Place the files in your FiveM server's resources directory.
3. Add `start FiveMScript` to your server.cfg file.
4. Ensure your database is properly configured in the config.lua file.

## Usage

### Commands

- `/fivemscript` - Example command to trigger server-side event

### Events

- `fivemscript:client:exampleEvent` - Client-side event triggered with data
- `fivemscript:server:exampleCommand` - Server-side event triggered by the command

### Callbacks

- `fivemscript:server:exampleCallback` - Server-side callback for data operations

## Configuration

The script can be configured via the `config.lua` file. Key settings include:

- `Config.ScriptName` - Name of the script
- `Config.Debug` - Enable or disable debug mode
- `Config.Database.TableName` - Name of the database table
- `Config.Client.NotificationDuration` - Duration of client notifications
- `Config.Server.Cooldown` - Cooldown period for server operations

---

## Generated with EnderDevelopment

This plugin was generated in minutes with [EnderDevelopment](https://enderdevelopment.com) — the AI platform that turns your ideas into working Minecraft plugins, Discord bots and FiveM scripts.

**Want your own?** [Generate this project on EnderDevelopment](https://dash.enderdevelopment.com?utm_source=github&utm_medium=readme&utm_campaign=fivem-data-manager&utm_content=bottom) — describe it in one sentence and get the full source code.
