-- mod-version:3 lite-xl 2.1
-- for Haskell ormolu formatter
local config = require "core.config"
local formatter = require "plugins.formatter"

config.ormolu_args = { "--mode inplace" }

formatter.add_formatter {
	name = "Ormolu",
	file_patterns = {"%.hs$"},
	command = "ormolu $ARGS $FILENAME",
	args = config.ormolu_args
}
