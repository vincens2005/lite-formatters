-- mod-version:3 lite-xl 2.1

-- https://github.com/vlang/v

local config = require "core.config"
local formatter = require "plugins.formatter"

config.vfmt_args = { "-w" }

formatter.add_module() {
	name = "vfmt",
	file_patterns = {"%.vv?$", "%.vsh$"},
	command = "v fmt $ARGS $FILENAME",
	args = config.vfmt_args
}
