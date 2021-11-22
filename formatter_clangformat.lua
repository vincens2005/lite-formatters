-- mod-version:2 lite-xl 2.00
-- for ClangFormat fortmatter
local config = require "core.config"
local formatter = require "plugins.formatter"

config.clangformat_args = {"--style=file", "--fallback-style=WebKit", "-i"}

formatter.add_formatter {
	name = "ClangFormat",
	file_patterns = {
		"%.h$", "%.inl$", "%.cpp$", "%.cc$", "%.C$", "%.cxx$",
    "%.c++$", "%.hh$", "%.H$", "%.hxx$", "%.hpp$", "%.h++$"
	},
	command = "clang-format $ARGS $FILENAME",
	args = config.clangformat_args
}
