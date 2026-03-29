local wezterm = require("wezterm")

-- Add this plugin's own directory to the Lua path so require("resurrect.xxx") works.
-- debug.getinfo source is "@/path/to/plugin/init.lua"; strip "@" and filename.
local src = debug.getinfo(1, "S").source:sub(2)
local plugin_dir = src:match("(.*)/[^/]+$") or src
package.path = plugin_dir .. "/?.lua;" .. plugin_dir .. "/?/init.lua;" .. package.path

local pub = {}

-- Export submodules
pub.workspace_state = require("resurrect.workspace_state")
pub.window_state    = require("resurrect.window_state")
pub.tab_state       = require("resurrect.tab_state")
pub.fuzzy_loader    = require("resurrect.fuzzy_loader")
pub.state_manager   = require("resurrect.state_manager")

return pub
