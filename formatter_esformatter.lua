-- mod-version:1 lite-xl 2.00
-- for esformatter fortmatter
local config = require "core.config"
local formatter = require "plugins.formatter"

config.esformatter_args = {"-i", "--indent-value=\"\\t\""} -- default arguments. if you change them, make sure to include -i or it won't work

formatter.add_formatter {
	name = "esformatter",
	file_patterns = {"%.js$"},
	command = "esformatter $ARGS $FILENAME",
	args = config.esformatter_args
}
