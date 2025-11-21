-- mod-version:3 lite-xl 2.1

-- https://www.npmjs.com/package/js-beautify

local config = require "core.config"
local formatter = require "plugins.formatter"

config.jsbeautify_args = {"-r", "-q", "-s 1", "-t", "-p", "-b end-expand"} -- make sure to keep -r arg if you change this

formatter.add_module() {
	name = "JS Beautifier",
	file_patterns = {"%.js$"},
	command = "js-beautify $ARGS $FILENAME",
	args = config.jsbeautify_args
}
