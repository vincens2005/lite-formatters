-- mod-version:2 lite-xl 2.05
-- for dfmt dlang formatter

local config = require "core.config"
local formatter = require "plugins.formatter"

config.dfmt_args = {"--brace_style=otbs", "--indent_size=2", "--inplace"}

formatter.add_formatter {
  name = "dfmt",
  file_patterns = {"%.d$"},
  command = "dfmt $FILENAME $ARGS",
  args = config.dfmt_args
}
