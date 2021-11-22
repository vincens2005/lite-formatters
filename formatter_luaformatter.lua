-- mod-version:2 lite-xl 2.00
-- for LuaFormatter fortmatter
local config = require "core.config"
local formatter = require "plugins.formatter"

config.luaformatter_args = {"-i", "--use-tab", "--indent-width=1"} -- make sure to keep -i arg if you change this

formatter.add_formatter {
	name = "LuaFormatter",
	file_patterns = {"%.lua$"},
	command = "lua-format $ARGS $FILENAME",
	args = config.luaformatter_args
}
