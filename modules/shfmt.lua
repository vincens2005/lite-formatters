-- mod-version:3 lite-xl 2.1

-- https://github.com/mvdan/sh

local config = require "core.config"
local formatter = require "plugins.formatter"

config.sh_args = {"-l", "-w"}

formatter.add_module() {
	name = "shfmt",
	file_patterns = {"%.sh$"},
	command = "shfmt $ARGS $FILENAME",
	args = config.sh_args
}
