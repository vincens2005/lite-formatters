-- mod-version:3 lite-xl 2.1

-- https://hexdocs.pm/mix/main/Mix.Tasks.Format.html

local config = require "core.config"
local formatter = require "plugins.formatter"

config.elixir_args = {}

formatter.add_module() {
	name = "Elixir",
	file_patterns = {"%.exs?$"},
	command = "mix format $ARGS $FILENAME",
	args = config.elixir_args
}
