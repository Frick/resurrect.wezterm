local wezterm = require("wezterm")

-- WezTerm loads plugins as require(component), passing the URL-encoded component
-- name as the first vararg to the main chunk. Match it against wezterm.plugin.list()
-- to unambiguously find our own plugin_dir and add plugin/ to package.path.
-- This works correctly even when multiple resurrect forks are cached on disk.
local component = ...
local sep = package.config:sub(1, 1)
for _, p in ipairs(wezterm.plugin.list()) do
    if p.component == component then
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
