-- mod-version:3 lite-xl 2.1
-- for Scala scalafmt formatter
local config = require "core.config"
local formatter = require "plugins.formatter"

config.scalafmt_args = {}

formatter.add_formatter {
	name = "scalafmt",
	file_patterns = { "%.scala$" },
	command = { "scalafmt $FILENAME" },
	args = config.scalafmt_args
}
