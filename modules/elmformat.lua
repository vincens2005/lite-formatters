-- mod-version:3 lite-xl 2.1

-- https://github.com/avh4/elm-format

local config = require "core.config"
local formatter = require "plugins.formatter"

config.elmformat_args = { "--yes" }

formatter.add_module() {
	name = "Elm",
	file_patterns = {"%.elm$"},
	command = "elm-format $ARGS $FILENAME",
	args = config.elmformat_args
}
