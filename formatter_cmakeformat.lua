-- mod-version:2 lite-xl 2.00
-- for CMake Formatter
local config = require "core.config"
local formatter = require "plugins.formatter"

config.cmakeformat_args = {"-i"} -- Since by default, the output is stdout

formatter.add_formatter {
	name = "CMake Format",
	file_patterns = {
		"%.cmake$", "CMakeLists.txt$"
	},
	command = "cmake-format $ARGS $FILENAME",
	args = config.cmakeformat_args
}
