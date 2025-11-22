-- mod-version:3 lite-xl 2.1
local core = require "core"
local config = require "core.config"
local command = require "core.command"
local common = require "core.common"
local Doc = require "core.doc"
local keymap = require "core.keymap"


-------
-- ? --
-------
local formatter = {}
local modules = {}


---------------------------
-- Configuration Options --
---------------------------

config.plugins.formatter = common.merge({
  format_on_save = false
}, config.plugins.formatter)


------------------
-- Data Storage --
------------------

-- Check if the given filename's file extension matches that of any loaded formatter module
local function matches_any(filename, patterns)
	for _, pattern in ipairs(patterns) do
		if string.find(filename, pattern) then
			return true
		end
	end
end

-- this function will return the first formatter module that matches, so beware if you
-- install multiple modules for the same file extension
local function get_module(filename)
	local module = {}
	for _, v in pairs(modules) do
		if matches_any(filename, v.file_patterns) then module = v end
	end
	return module
end

-- Add a formatter module to the modules table
function formatter.add_module()
  return function(m)
  	-- print(common.serialize(m))
    table.insert(modules, m)
  end
end

-- Get list of template files
local function parse_list()
	local list = system.list_dir(USERDIR .. "/plugins/formatter/modules")
  local list_matched = {}
  local temp_string = ""
  for k, v in pairs(list) do
    temp_string = string.gsub(list[k], ".lua", "")
    table.insert(list_matched, temp_string)
  end
  return list_matched
end

-- Load modules
function formatter.load()
  -- Get modules' filenames
  local modules_list = parse_list()
  -- Load module files
  for _, v in ipairs(modules_list) do
    require("plugins.formatter.modules." .. v)
    core.log("Loaded formatter module: " .. v)
  end
end


-----------
-- Logic --
-----------

-- sometimes the autoreload plugin doesn't detect the file change so we
-- need our own reload_doc function to reload the document after formatting it
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

-- Format current document and reload it to show changes
-- NOTE: to reload after formatting, set 'reload' to true
local function format_current_doc(reload)
	local current_doc = core.active_view.doc
	if current_doc == nil then
		core.error("no doc is open")
		return
	end
	-- ?
	local module = get_module(current_doc.filename)
	if module == nil then
		core.error("no formatter found for " .. current_doc.filename)
		return
	end
	-- ?
	core.log("formatting " .. current_doc.filename .. " with " .. module.name)
	-- ?
	local args = table.concat(module.args or {}, " ")
	local filename = system.absolute_path(current_doc.filename)
	filename = "\"" .. filename .. "\"" -- add quotes to filename
	-- ?
	local command = module.command
	-- ?
	if type(command) ~= "table" then
		command = {module.command}
	end
	-- ?
	for i in pairs(command) do
		local cmd = command[i]:gsub("$FILENAME", filename) -- replace $FILENAME with filename
		cmd = cmd:gsub("$ARGS", args) -- replace $ARGS with args
		system.exec(cmd) -- all systems go
	end
	-- ?
	if reload then reload_doc(core.active_view.doc) end
end

-- Extend old Doc.save
local Doc_save = Doc.save
Doc.save = function(self, ...)
	Doc_save(self, ...)
	if config.plugins.formatter.format_on_save and get_module(self.filename) then
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


--------------
-- Commands --
--------------
command.add("core.docview", {["formatter:format-doc"] = format_current_doc})


-----------------
-- Keybindings --
-----------------
keymap.add {["alt+shift+f"] = "formatter:format-doc"}


-- print("---")
-- print("modules:")
-- print(common.serialize(modules))


-------
-- ? --
-------
return formatter
