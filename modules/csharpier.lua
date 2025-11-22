-- mod-version:3 lite-xl 2.1

-- https://github.com/belav/csharpier

local config = require "core.config"
local formatter = require "plugins.formatter"

config.csharpier_args = {} -- csharpier doesn't need any args when formatting single file

formatter.add_module() {
    name = "csharpier",
    file_patterns = {"%.cs$"},
    command = "dotnet-csharpier $ARGS $FILENAME",
    args = config.csharpier_args
}
