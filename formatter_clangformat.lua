-- mod-version:3 lite-xl 2.1
-- for ClangFormat formatter
local config = require "core.config"
local formatter = require "plugins.formatter"

config.clangformat_args = {"--style=file", "--fallback-style=WebKit", "-i"}

formatter.add_formatter {
	name = "ClangFormat",
	file_patterns = {
		"%.h$", "%.inl$", "%.cpp$", "%.cc$", "%.C$", "%.c$", "%.cxx$",
    "%.c++$", "%.hh$", "%.H$", "%.hxx$", "%.hpp$", "%.h++$"
	},
	command = "clang-format $ARGS $FILENAME",
	args = config.clangformat_args
}
