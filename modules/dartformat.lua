-- mod-version:3 lite-xl 2.1
local config = require "core.config"
local formatter = require "plugins.formatter"

config.dartformat_args = {} -- Like the previous case, it is better to leave it as default

formatter.add_module() {
	name = "Dart Formatter",
	file_patterns = {
		"%.dart$"
	},
	command = "dart format $ARGS $FILENAME",
	args = config.dartformat_args
}
