-- mod-version:3 lite-xl 2.1
local core = require "core"
local config = require "core.config"
local command = require "core.command"
local common = require "core.common"
local Doc = require "core.doc"
local keymap = require "core.keymap"

-- set to true on your user init.lua to run formatter on each document save
config.plugins.formatter.format_on_save = config.plugins.formatter.format_on_save or false

local formatter = {}
local formatters = {}

-- Checks if the given filename's file extension matches with that of any loaded formatter module
local function matches_any(filename, patterns)
	for _, ptn in ipairs(patterns) do if filename:find(ptn) then return true end end
end

-- Returns the first formatter that matches, so beware if you
-- install multiple for the same filetype
local function get_formatter(filename)
	local formatter = nil
	for _, v in pairs(formatters) do
		if matches_any(filename, v.file_patterns) then formatter = v end
	end
	return formatter
end

-- Sometimes the autoreload plugin doesn't detect the file change so we
-- need our own reload_doc function to reload document after formatting it
local function reload_doc(doc)
	local fp = io.open(doc.filename, "r")
	local text = fp:read("*a")
	fp:close()
	
	-- TODO: check if text has changed
	
	local sel = {doc:get_selection()}
	doc:remove(1, 1, math.huge, math.huge)
	doc:insert(1, 1, text:gsub("\r", ""):gsub("\n$", ""))
	doc:set_selection(table.unpack(sel))
	
	doc:clean()
end

-- Formats current document and reloads it to show changes
-- NOTE: to reload after formatting, set 'reload' to true
local function format_current_doc(reload)
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
	filename = "\"" .. filename .. "\"" -- add quotes to filename
	
	local command = formatter.command
	
	if type(command) ~= "table" then
		command = {formatter.command}
	end
	
	for i in pairs(command) do
		local cmd = command[i]:gsub("$FILENAME", filename) -- replace $FILENAME with filename
		cmd = cmd:gsub("$ARGS", args) -- replace $ARGS with args
		system.exec(cmd) -- all systems go
	end
	
	if reload then reload_doc(core.active_view.doc) end
end

-- Fills list of formatter modules
-- NOTE: used by get_formatter()
function formatter.add_formatter()
	return function (t)
    table.insert(formatters, t)
  end
end

-- Generate list of formatter module names
-- NOTE: used by load()
local function parse_list()
	local list = system.list_dir(USERDIR .. "/plugins/formatter/formatters")
  local list_matched = {}
  local temp_string = ""
  for k, v in pairs(list) do
    temp_string = string.gsub(list[k], ".lua", "")
    table.insert(list_matched, temp_string)
  end
  return list_matched
end

-- Loads formatter modules
function formatter.load()
	-- Get template filenames
  local formatters_list = parse_list()
  -- Load template files
  for _, v in ipairs(formatters_list) do
    require("plugins.formatter.formatters." .. v)
  end
end

-- ?
local Doc_save = Doc.save
Doc.save = function(self, ...)
	Doc_save(self, ...)
	if config.format_on_save and get_formatter(self.filename) then
		format_current_doc(true)
		core.add_thread(function()
			-- Wait at least 1 second before trying to reload the document
			-- to let core Doc.save do its work
			local current_time = os.time()
			while current_time == os.time() do coroutine.yield() end
			reload_doc(core.active_view.doc)
		end)
	end
end

-- ?
command.add("core.docview", {["formatter:format-doc"] = format_current_doc})

-- ?
keymap.add {["alt+shift+f"] = "formatter:format-doc"}

-- ?
return formatter
