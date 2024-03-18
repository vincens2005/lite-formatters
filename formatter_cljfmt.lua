-- mod-version:3 lite-xl 2.1
-- for Clojure cljfmt
local config = require "core.config"
local formatter = require "plugins.formatter"

config.cljfmt_args = { "check", "fix" }

formatter.add_formatter {
	name = "cljfmt",
	file_patterns = { "%.clj$" },
	command = "cljfmt $ARGS $FILENAME",
	args = config.cljfmt_args
}
