-- mod-version:3 lite-xl 2.1
-- for Golang fortmatter
local config = require "core.config"
local formatter = require "plugins.formatter"

config.golangformat_args = {"-w"}

formatter.add_formatter {
	name = "Golang Formatter",
	file_patterns = {
		"%.go$"
	},
	command = "goimports $ARGS $FILENAME",
	args = config.golangformat_args
}
