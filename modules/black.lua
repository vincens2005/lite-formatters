-- mod-version:3 lite-xl 2.1
local config = require "core.config"
local formatter = require "plugins.formatter"

config.black_args = {}

formatter.add_module() {
	name = "Black",
	file_patterns = {"%.pyi?$"},
	command = "black $ARGS $FILENAME",
	args = config.black_args
}
