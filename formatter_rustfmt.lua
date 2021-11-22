-- mod-version:2 lite-xl 2.00
-- for Rust fortmatter
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
