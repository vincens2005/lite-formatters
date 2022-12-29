-- mod-version:3 lite-xl 2.1
-- for Prettier formatter
local config = require "core.config"
local formatter = require "plugins.formatter"

config.prettier_args = {"--write"}

formatter.add_formatter {
	name = "Prettier",
	file_patterns = { "%.jsx?$", "%.cjs$", "%.mjs$", "%.tsx?$" },
	command = "npx prettier $ARGS $FILENAME",
	args = config.prettier_args
}
