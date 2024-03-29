-- mod-version:3 lite-xl 2.1
-- for qmlformat formatter
local config = require "core.config"
local formatter = require "plugins.formatter"

config.qmlformat_args = {"-i"}

formatter.add_formatter {
	name = "QmlFormat",
	file_patterns = {"%.qml$"},
	command = "qmlformat $ARGS $FILENAME",
	args = config.qmlformat_args
}
