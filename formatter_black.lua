-- mod-version:2 lite-xl 2.00
-- for Black python formatter
local config = require "core.config"
local formatter = require "plugins.formatter"

config.black_args = {}

formatter.add_formatter {
	name = "Black",
	file_patterns = {"%.py$"},
	command = "black $ARGS $FILENAME",
	args = config.black_args
}
