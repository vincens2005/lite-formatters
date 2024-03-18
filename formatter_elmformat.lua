-- mod-version:3 lite-xl 2.1
-- for Black python formatter
local config = require "core.config"
local formatter = require "plugins.formatter"

config.elmformat_args = { "--yes" }

formatter.add_formatter {
	name = "Elm",
	file_patterns = {"%.elm$"},
	command = "elm-format $ARGS $FILENAME",
	args = config.elmformat_args
}
