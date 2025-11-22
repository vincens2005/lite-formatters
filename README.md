# Formatter Plugin

A simple formatter plugin for [lite](https://github.com/rxi/lite.git) and [Lite XL](https://github.com/lite-xl/lite-xl).

## Installation

Use `lpm` to install this plugin: `lpm install formatter`.

> [!NOTE]
> This plugin does not provide the bundled executable binary files needed to run the formatters themselves.
> You must install the desired formatters yourself.

If you want to customize the cli arguments for a specific formatter, you can do this from your `init.lua` script.

Here's and example:

```lua
config.jsbeautify_args = {"-r", "-s 4", "-p", "-b end-expand"} -- set jsBeautify arguments to indent with spaces.
```

## Usage

The default keymap to format the current doc is `alt+shift+f`.

The command is `formatter:format-doc`.

To make Lite XL automatically format the current document on each save, add the following config to `USERDIR/init.lua`:

```lua
config.plugins.formatter = common.merge({
  format_on_save = true
}, config.plugins.formatter)
```

## Adding a formatter module

Here is an example of a formatter module:

`formatter_jsbeautify.lua`

```lua
-- mod-version:3 lite-xl 2.1

-- https://www.npmjs.com/package/js-beautify

local config = require "core.config"
local formatter = require "plugins.formatter"

config.jsbeautify_args = {"-r", "-q", "-s 1", "-t", "-p", "-b end-expand"} -- make sure to keep -r arg if you change this

formatter.add_formatter {
    name = "JS Beautifier",
    file_patterns = {"%.js$"},
    command = "js-beautify $ARGS $FILENAME",
    args = config.jsbeautify_args
}
```

A few things to keep in mind:

- Add the correct Lite XL version tag at the top
- Keep the arguments inside `config.formattername_args`
- Set a name
- Add it to the list in README.md and keep it alphabetically sorted

Then make a pull request on Github.
