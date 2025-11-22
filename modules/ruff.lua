-- mod-version:3 lite-xl 2.1

-- https://github.com/astral-sh/ruff

local config = require "core.config"
local formatter = require "plugins.formatter"

config.ruff_args = {}

formatter.add_module() {
    name = "Ruff Formatter",
    file_patterns = {"%.pyi?$"},
    command = "ruff format $FILENAME",
    args = config.ruff_args
}
