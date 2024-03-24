-- mod-version:3 lite-xl 2.1
-- for Clojure cljfmt formatter
local config = require "core.config"
local formatter = require "plugins.formatter"

config.cljfmt_args = {}

formatter.add_formatter {
	name = "cljfmt",
	file_patterns = { "%.clj$" },
	command = { "cljfmt check $FILENAME", "cljfmt fix $FILENAME" },
	args = config.cljfmt_args
}
