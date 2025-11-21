-- mod-version:3 lite-xl 2.1

-- https://github.com/weavejester/cljfmt

local config = require "core.config"
local formatter = require "plugins.formatter"

config.cljfmt_args = {}

formatter.add_module() {
	name = "cljfmt",
	file_patterns = { "%.clj$" },
	command = { "cljfmt check $FILENAME", "cljfmt fix $FILENAME" },
	args = config.cljfmt_args
}
