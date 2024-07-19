-- mod-version:3 lite-xl 2.1

-- For the prettier formatter
local formatter = require "plugins.formatter"
local config = require "core.config"

formatter.add_formatter {
    name = "Prettier",
    file_patterns = {"%.less&", "%.scss&", "%.json&", "%.jsx?$", "%.ts$"},
    command = "prettier $ARGS $FILENAME",
    args = { "-w" }
}

config.format_on_save = true
