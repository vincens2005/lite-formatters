-- mod-version:3 lite-xl 2.1
-- for V Language Formatter
local config = require "core.config"
local formatter = require "plugins.formatter"

config.vfmt_args = {"-w"}
formatter.add_formatter {
	name = "V Formatter",
	file_patterns = { "%.v$", "%.vsh$", "%.vv$" },
	command = "v fmt $ARGS $FILENAME",
	args = config.vfmt_args
}
