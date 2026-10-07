-- mod-version:3 lite-xl 2.1

-- https://github.com/janet-lang/spork/blob/master/bin/janet-format

local config = require "core.config"
local formatter = require "plugins.formatter"

config.janetformat_args = {}

formatter.add_formatter({
    name = "Janet Format",
    file_patterns = { "%.janet", "%.jdn" },
    command = "janet-format $ARGS --files $FILENAME",
    args = config.janetformat_args
})
