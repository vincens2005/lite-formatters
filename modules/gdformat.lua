-- mod-version:3 lite-xl 2.1
local config = require "core.config"
local formatter = require "plugins.formatter"

config.gdformat_args = {} -- I don't think gdformat takes any arguments but just in case
formatter.add_module() {
	name = "GDFormat",
	file_patterns = {"%.gd$"},
	command = "gdformat $ARGS $FILENAME",
	args = config.gdformat_args
}
