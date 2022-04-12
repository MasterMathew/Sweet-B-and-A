-- Standard Awesome Library
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local beautiful = require("beautiful")

-- Helpers
local helpers = require("helpers")

-- Create a launcher widget and a main menu
awful.screen.connect_for_each_screen(function(s)
    -- Mainmenu
    mymainmenu = menu_main
end)
