-- mod-version:3 lite-xl 2.1

-- https://pypi.org/project/isort/

local config = require "core.config"
local formatter = require "plugins.formatter"

config.isort_args = {}

formatter.add_module() {
	name = "Isort",
	file_patterns = {"%.pyi?$"},
	command = "isort $ARGS $FILENAME",
	args = config.isort_args
}
