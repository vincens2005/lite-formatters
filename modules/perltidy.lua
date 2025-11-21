-- mod-version:3 lite-xl 2.1
local config = require "core.config"
local formatter = require "plugins.formatter"

config.perltidy_args = { "-b", "-se" }

formatter.add_module() {
	name = "perltidy",
	file_patterns = {"%.pl$"},
	command = "perltidy $ARGS $FILENAME",
	args = config.perltidy_args
}
