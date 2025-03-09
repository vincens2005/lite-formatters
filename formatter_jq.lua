-- mod-version:3 lite-xl 2.1
-- for jq JSON fortmatter
local config = require "core.config"
local formatter = require "plugins.formatter"

config.jq_args = {}

formatter.add_formatter {
	name = "jq",
	file_patterns = {"%.json$"},
	command = "jq '.' $ARGS $FILENAME",
	args = config.jq_args
}
