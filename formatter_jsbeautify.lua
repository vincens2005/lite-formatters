-- mod-version:2 lite-xl 2.00
-- for JS Beautify fortmatter
local config = require "core.config"
local formatter = require "plugins.formatter"

config.jsbeautify_args = {"-r", "-q", "-s 1", "-t", "-p", "-b end-expand"} -- make sure to keep -r arg if you change this

formatter.add_formatter {
	name = "JS Beautifier",
	file_patterns = {"%.js$"},
	command = "js-beautify $ARGS $FILENAME",
	args = config.jsbeautify_args
}
