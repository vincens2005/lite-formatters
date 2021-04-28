-- lite-xl 1.16
local core = require "core"
local command = require "core.command"
local config = require "core.config" -- probably will be neccesary
local keymap = require "core.keymap"
local Doc = require "core.doc" -- might not be neccesary

local formatters = {
	{ -- test formatter, will be changed in the future
		file_patterns = {"%.js$"},
		command = "esformatter $ARGS $FILENAME",
		args = {"-i", "--indent-value=\"\\t\""},
		expected_exitcodes = {0}
	}
}

-- stolen from linter plugin
local function matches_any(filename, patterns)
	for _, ptn in ipairs(patterns) do if filename:find(ptn) then return true end end
end

-- this function will return the first formatter that matches, so beware if you
-- install multiple for the same filetype
local function get_formatter(filename)
	local formatter = nil
	for _, v in pairs(formatters) do
		if matches_any(filename, v.file_patterns) then formatter = v end
	end
	return formatter
end

local function format_current_doc()
	local current_doc = core.active_view.doc
	if current_doc == nil then
		core.error("no doc is open")
		return
	end

	local formatter = get_formatter(current_doc.filename)
	if formatter == nil then
		core.error("no formatter found for " .. current_doc.filename)
		return
	end

	core.log("formatting " .. current_doc.filename .. " with " .. formatter.name)

	local args = table.concat(formatter.args or {}, " ")
	local filename = system.absolute_path(current_doc.filename)

	local cmd = formatter.command:gsub("$FILENAME", filename) -- replace $FILENAME with filename
	cmd = cmd:gsub("$ARGS", args) -- replace $ARGS with args

	system.exec(cmd) -- all systems go

end

command.add("core.docview", {["formatter:format-doc"] = format_current_doc})

keymap.add {["alt+shift+f"] = "formatter:format-doc"}

return {
	add_formatter = function(formatter) table.insert(formatters, formatter) end
}
