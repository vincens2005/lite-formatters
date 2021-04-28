-- lite-xl 1.16
-- for GDFormat from godot-gdscript-toolkit
local config = require "core.config"
local formatter = require "plugins.formatter"

config.gdformat_args = {} -- I don't think gdformat takes any arguments but just in case
formatter.add_formatter {
	name = "GDFormat",
	file_patterns = {"%.gd$"},
	command = "gdformat $ARGS $FILENAME",
	args = config.gdformat_args
}
