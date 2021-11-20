-- mod-version:2 lite-xl 2.00
-- for ClangFormat fortmatter
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
