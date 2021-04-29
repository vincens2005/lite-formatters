-- lite-xl 1.16
-- for CSS Beautify fortmatter
local config = require "core.config"
local formatter = require "plugins.formatter"

config.cssbeautify_args = {"-r", "-q", "-s 1", "-t"} -- make sure to keep -r arg if you change this

formatter.add_formatter {
	name = "CSS Beautifier",
	file_patterns = {"%.css$"},
	command = "css-beautify $ARGS $FILENAME",
	args = config.cssbeautify_args
}
