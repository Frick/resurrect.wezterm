local wezterm = require("wezterm")

-- Add this plugin's own directory to the Lua path so require("resurrect.xxx") works.
-- WezTerm sandboxes plugins and strips the debug library, so we use wezterm.plugin.list()
-- to locate our own plugin_dir and add its plugin/ subdirectory to package.path.
local sep = package.config:sub(1, 1)
for _, p in ipairs(wezterm.plugin.list()) do
    if p.url:find("resurrect.wezterm", 1, true) then
        local dir = p.plugin_dir .. sep .. "plugin"
        package.path = dir .. sep .. "?.lua;" .. dir .. sep .. "?" .. sep .. "init.lua;" .. package.path
        break
    end
end

local pub = {}

-- Export submodules
pub.workspace_state = require("resurrect.workspace_state")
pub.window_state    = require("resurrect.window_state")
pub.tab_state       = require("resurrect.tab_state")
pub.fuzzy_loader    = require("resurrect.fuzzy_loader")
pub.state_manager   = require("resurrect.state_manager")

return pub
