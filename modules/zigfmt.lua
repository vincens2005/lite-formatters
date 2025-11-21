-- mod-version:3 lite-xl 2.1
local config = require "core.config"
local formatter = require "plugins.formatter"

config.zigfmt_args = {} -- zig fmt doesn't need any args when formatting single file

formatter.add_module() {
    name = "zig fmt",
    file_patterns = {"%.zig$"},
    command = "zig fmt $ARGS $FILENAME",
    args = config.zigfmt_args
}
