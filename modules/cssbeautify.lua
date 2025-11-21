-- mod-version:3 lite-xl 2.1

-- https://www.npmjs.com/package/js-beautify

local config = require "core.config"
local formatter = require "plugins.formatter"

config.cssbeautify_args = {"-r", "-q", "-s 1", "-t"} -- make sure to keep -r arg if you change this

formatter.add_module() {
	name = "CSS Beautifier",
	file_patterns = {"%.css$"},
	command = "css-beautify $ARGS $FILENAME",
	args = config.cssbeautify_args
}
