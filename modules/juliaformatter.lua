-- mod-version:3 lite-xl 2.1

-- https://github.com/domluna/JuliaFormatter.jl

local config = require "core.config"
local formatter = require "plugins.formatter"

config.julia_args = {}

formatter.add_module() {
    name = "JuliaFormatter",
    file_patterns = {"%.jl$", "%.julia$"},
    command = "julia --compile=min -e $ARGS 'import JuliaFormatter: format_file; format_file($FILENAME)'",
    args = config.julia_args
}
