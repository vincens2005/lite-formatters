-- mod-version:3 lite-xl 2.1
-- for Rust formatter
local config = require "core.config"
local formatter = require "plugins.formatter"

config.rustfmt_args = {} -- I think the default flags are good

formatter.add_formatter {
	name = "Rust Formatter",
	file_patterns = {
		"%.rs$"
	},
	command = "rustfmt $ARGS $FILENAME",
	args = config.rustfmt_args
}
