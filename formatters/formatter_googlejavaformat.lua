-- mod-version:3 lite-xl 2.1
-- for Google Java Formatter
local config = require "core.config"
local formatter = require "plugins.formatter"

config.googlejavaformat_args = { "--replace" }

formatter.add_formatter {
	name = "Google Java Format",
	file_patterns = {"%.java$"},
	command = "google-java-format $ARGS $FILENAME",
	args = config.googlejavaformat_args
}
