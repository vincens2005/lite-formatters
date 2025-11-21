-- mod-version:3 lite-xl 2.1
local config = require "core.config"
local formatter = require "plugins.formatter"

config.cmakeformat_args = {"-i"} -- Since by default, the output is stdout

formatter.add_module() {
	name = "CMake Format",
	file_patterns = {
		"%.cmake$", "CMakeLists.txt$"
	},
	command = "cmake-format $ARGS $FILENAME",
	args = config.cmakeformat_args
}
