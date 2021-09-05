-- mod-version:2 lite-xl 2.00
-- for JuliaFormatter formatter
local config = require "core.config"
local formatter = require "plugins.formatter"
 
config.julia_args = {}

formatter.add_formatter {
    name = "JuliaFormatter",
    file_patterns = {"%.jl$", "%.julia$"},
    command = "julia --compile=min -e 'import JuliaFormatter: format_file; format_file($FILENAME)'",
    args = config.julia_args
}
