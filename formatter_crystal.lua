-- mod-version:3 lite-xl 2.1
-- for Crystal's official formatter
local config = require "core.config"
local formatter = require "plugins.formatter"

config.crystal_args = {}

formatter.add_formatter {
	name = "Crystal",
	file_patterns = {"%.cr$"},
	command = "crystal tool format $ARGS $FILENAME",
	args = config.crystal_args
}
