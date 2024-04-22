-- mod-version:3 lite-xl 2.1
-- for Ruff python formatter
local config = require "core.config"
local formatter = require "plugins.formatter"

config.ruff_args = {}

formatter.add_formatter {
    name = "Ruff Formatter",
    file_patterns = {"%.pyi?$"},
    command = "ruff format $FILENAME",
    args = config.ruff_args
}
