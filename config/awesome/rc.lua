pcall(require, "luarocks.loader")
--[[
 _____ __ _ __ _____ _____ _____ _______ _____
|     |  | |  |  ___|  ___|     |       |  ___|
|  -  |  | |  |  ___|___  |  |  |  | |  |  ___|
|__|__|_______|_____|_____|_____|__|_|__|_____|
             ~ AestheticArchPlus ~
            https://github.com/rxyhn
            https://github.com/mastermathew
--]]

-- 📚 Library
local gears = require("gears")
local gfs = require("gears.filesystem")
local awful = require("awful")
local beautiful = require("beautiful")
dpi = beautiful.xresources.apply_dpi

-- 🎨 Themes
themes = {
      "day",      -- [1] 🌕 Beautiful Light Colorscheme
      "night",    -- [2] 🌑 Aesthetic Dark Colorscheme
}

theme = themes[2]
beautiful.init(gfs.get_configuration_dir() .. "theme/" .. theme .."/theme.lua")

-- 🖥 Screen
screen_width = awful.screen.focused().geometry.width
screen_height = awful.screen.focused().geometry.height

-- 🌊 Default Applications
terminal = "alacritty"
terminal_user = "xfce4-terminal"
taskmanager = "xfce4-taskmanager"
editor = terminal .. " -e " .. os.getenv("EDITOR")
vscode = "notepadqq"
steam = "steam"
discord = "discord"
browser = "librewolf"
launcher = "rofi -show drun -theme " .. gfs.get_configuration_dir() .. "theme/rofi.rasi"
file_manager = "thunar"
music_client = terminal .. " --class music -e ncmpcpp"

-- UI Values
 cont_center_ypos = screen_height/2 - 50 -- experiment with the number on the right to figure it out.
 cont_center_shownpos = screen_width - 791 -- experiment with the number on the right to figure it out.
 cont_center_hidepos = screen_width  + screen_width /10

  dash_shownpos = 170
  dash_hiddenpos = -375

-- Right-Click Menu

-- power menu submenu
powermenu = {
        {"Power OFF", function() awful.spawn.with_shell("systemctl poweroff") end},
        {"Reboot", function() awful.spawn.with_shell("systemctl reboot") end},
        {"Suspend", function()
            lock_screen_show()
            awful.spawn.with_shell("systemctl suspend")
        end},
        {"Lock Screen", function() lock_screen_show() end}
    }
--awesome menu submenu
awesomemenu = {
		{"Restart", awesome.restart},
        {"Hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end},
        {"Manual", terminal .. " -e man awesome"},
        {"Edit Config", editor .. " " .. awesome.conffile},
        {"Quit", function() awesome.quit() end}
    }

-- main menu
menu_main = awful.menu({
        items = {
            {"Terminal", function() awful.spawn.with_shell(terminal_user) end},
			{"AwesomeWM", awesomemenu},
			{"Task Manager", function() awful.spawn.with_shell(taskmanager) end},
            {"Code Editor", function() awful.spawn.with_shell(vscode) end},
            {"File Manager", function() awful.spawn.with_shell(file_manager) end},
            {"Web Browser", function() awful.spawn.with_shell(browser) end},
			{"Discord", function() awful.spawn.with_shell(discord) end},
			{"Steam", function() awful.spawn.with_shell(steam) end},
            {"Power Menu", powermenu}
        }
    })

-- 🌏 Weather API
openweathermap_key = "" -- API Key
openweathermap_city_id = "" -- City ID
weather_units = "imperial" -- Unit

-- Wallpaper
use_wallpaper = true  -- when set to false wallpaper will default to theme color.
wallpaper_path = "/home/[username]/Pictures/lofi-shop.jpg"

-- Dashboard Button (The image the button on the side bar at the very top uses)
beautiful.awesome_logo = ".config/awesome/theme/assets/icons/awesome.png"

-- Profile Picture
beautiful.pfp = ".config/awesome/theme/assets/pfp_default.png"

-- Imperial or Standard time
imperial_time = true

-- Titlebar exceptions (Removes Titlebars from specific application windows)
titlebar_except = {
				"discord",
               			 "Spotify",
				"Steam",
				"LibreWolf",
				"steamwebhelper",
				"Notepadqq",
				"Thunar",
				"Xfce4-terminal",
            			"Org.gnome.Nautilus"
}

-- 🚀 Launch Autostart
awful.spawn.with_shell(gfs.get_configuration_dir() .. "configuration/autostart")

-- 🤖 Import Configuration & modul
require("configuration")
require("module")

-- ✨ Import Daemons, UI & Widgets
require("signal")
require("ui")

-- 🗑 Garbage Collector Settings
collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)
