-- mod-version:3 lite-xl 2.1
-- for Ruby Rubocop formatter
local config = require "core.config"
local formatter = require "plugins.formatter"

config.rubocop_args = { "-p", "-A" }

formatter.add_formatter {
	name = "Rubocop",
	file_patterns = {"%.rb$"},
	command = "rubocop $ARGS $FILENAME",
	args = config.rubocop_args
}
