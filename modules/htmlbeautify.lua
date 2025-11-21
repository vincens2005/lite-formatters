-- mod-version:3 lite-xl 2.1

-- https://www.npmjs.com/package/js-beautify

local config = require "core.config"
local formatter = require "plugins.formatter"

config.htmlbeautify_args = {"-r", "-q", "-s 1", "-t", "-I"} -- make sure to keep -r arg if you change this

formatter.add_module() {
	name = "HTML Beautifier",
	file_patterns = {"%.html$"},
	command = "html-beautify $ARGS $FILENAME",
	args = config.htmlbeautify_args
}
