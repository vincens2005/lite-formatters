-- mod-version:3 lite-xl 2.1

-- https://github.com/prettier/prettier

local formatter = require "plugins.formatter"
local config = require "core.config"

config.prettier_args = {"--write"}

formatter.add_formatter {
    name = "Prettier",
    file_patterns = {"%.less$", "%.scss$", "%.json$", "%.jsx?$", "%.ts$"},
    command = "npx prettier $ARGS $FILENAME",
    args = config.prettier_args
}

config.format_on_save = true
