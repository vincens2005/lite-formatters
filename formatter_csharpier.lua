-- mod-version:3 lite-xl 2.1
-- for C# csharpier formatter
local config = require "core.config"
local formatter = require "plugins.formatter"

config.csharpier_args = {} -- csharpier doesn't need any args when formatting single file

formatter.add_formatter {
    name = "csharpier",
    file_patterns = {"%.cs$"},
    command = "dotnet-csharpier $ARGS $FILENAME",
    args = config.csharpier_args
}
