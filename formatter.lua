-- mod-version:3 lite-xl 2.1
local core = require "core"
local config = require "core.config"
local command = require "core.command"
local Doc = require "core.doc"
local keymap = require "core.keymap"

-- set to true on your user init.lua to run formatter on each document save
config.format_on_save = config.format_on_save or false

local formatters = {}

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

-- sometimes the autoreload plugin doesn't detect the file change so we
-- need our own reload_doc function to reload document after formatting it
local function reload_doc(doc)
	local fp = io.open(doc.filename, "r")
	local text = fp:read("*a")
	fp:close()

	-- TODO: check text has changed

	local sel = {doc:get_selection()}
	doc:remove(1, 1, math.huge, math.huge)
	doc:insert(1, 1, text:gsub("\r", ""):gsub("\n$", ""))
	doc:set_selection(table.unpack(sel))

	doc:clean()
end

-- formats current document and reload it to show changes
-- to reload after formatting, set 'reload' to true
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

command.add("core.docview", {["formatter:format-doc"] = format_current_doc})

keymap.add {["alt+shift+f"] = "formatter:format-doc"}

return {
	add_formatter = function(formatter) table.insert(formatters, formatter) end
}
