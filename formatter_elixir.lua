-- mod-version:3 lite-xl 2.1
-- for Black python formatter
local config = require "core.config"
local formatter = require "plugins.formatter"

config.elixir_args = {}

formatter.add_formatter {
	name = "Elixir",
	file_patterns = {"%.exs?$"},
	command = "mix format $ARGS $FILENAME",
	args = config.elixir_args
}
