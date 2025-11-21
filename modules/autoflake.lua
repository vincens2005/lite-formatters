-- mod-version:3 lite-xl 2.1

local config = require "core.config"
local common = require "core.common"
local formatter = require "plugins.formatter"

config.autoflake_args = common.merge({
	"--remove-all-unused-imports",
	"--remove-unused-variables",
	"--remove-duplicate-keys",
	"--expand-star-imports",
	"-ir"
}, config.autoflake_args)

formatter.add_module() {
	name = "Autoflake",
	file_patterns = {"%.pyi?$"},
	command = "autoflake $ARGS $FILENAME",
	args = config.autoflake_args
}
