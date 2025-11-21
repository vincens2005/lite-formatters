-- mod-version:3 lite-xl 2.1

-- https://github.com/OCamlPro/ocp-indent

local config = require "core.config"
local formatter = require "plugins.formatter"

config.ocpindent_args = { "-i" }

formatter.add_module() {
	name = "ocp-indent",
	file_patterns = {"%.ml$"},
	command = "ocp-indent $ARGS $FILENAME",
	args = config.ocpindent_args
}
