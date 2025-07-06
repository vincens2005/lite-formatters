# Formatters for [Lite](https://github.com/rxi/lite) and [Lite XL](https://github.com/franko/lite-xl)

TODO: brief intro

## List of formatter modules

- [autoflake python formatter](https://pypi.org/project/autoflake/): `formatter_autoflake.lua`
- [black python formatter](https://pypi.org/project/black/): `formatter_black.lua`
- [clang-format](https://clang.llvm.org/docs/ClangFormat.html): `formatter_clangformat.lua`
- [cljfmt](https://github.com/weavejester/cljfmt): `formatter_cljfmt.lua`
- [cmake-format](https://github.com/cheshirekow/cmake_format): `formatter_cmakeformat.lua`
- [csharpier](https://github.com/belav/csharpier): `formatter_csharpier.lua`
- [crystal](https://man.archlinux.org/man/crystal.1.en): `formatter_crystal.lua`
- [css-beautify](https://www.npmjs.com/package/js-beautify): `formatter_cssbeautify.lua`
- [dartformat](https://dart.dev/tools/dart-format): `formatter_dartformat.lua`
- [dfmt](https://github.com/dlang-community/dfmt): `formatter_dfmt.lua`
- [elixir](https://hexdocs.pm/mix/main/Mix.Tasks.Format.html): `formatter_elixir.lua`
- [elm-format](https://github.com/avh4/elm-format): `formatter_elmformat.lua`
- [esformatter](https://github.com/millermedeiros/esformatter/): `formatter_esformatter.lua`
- [gdformat](https://github.com/Scony/godot-gdscript-toolkit): `formatter_gdformat.lua`
- [google-java-format](https://github.com/google/google-java-format): `formatter_googlejavaformat.lua`
- [goimports](https://pkg.go.dev/golang.org/x/tools/cmd/goimports): `formatter_golang.lua`
- [html-beautify](https://www.npmjs.com/package/js-beautify): `formatter_htmlbeautify.lua`
- [isort python formatter](https://pypi.org/project/isort/): `formatter_isort.lua`
- [js-beautify](https://www.npmjs.com/package/js-beautify): `formatter_jsbeautify.lua`
- [luaformatter](https://github.com/Koihik/LuaFormatter): `formatter_luaformatter.lua`
- [ormolu](https://github.com/tweag/ormolu): `formatter_ormolu.lua`
- [perltidy](https://github.com/perltidy/perltidy): `formatter_perltidy.lua`
- [prettier](https://github.com/prettier/prettier): `formatter_prettier.lua`
- [ocp-indent](https://github.com/OCamlPro/ocp-indent): `formatter_ocpindent.lua`
- [qmlformat](https://github.com/qt/qtdeclarative): `formatter_qml.lua`
- [rubocop](https://github.com/rubocop/rubocop): `formatter_rubocop.lua`
- [ruff](https://github.com/astral-sh/ruff): `formatter_ruff.lua`
- [rustfmt](https://github.com/rust-lang/rustfmt): `formatter_rustfmt.lua`
- [shfmt](https://github.com/mvdan/sh): `formatter_shfmt.lua`
- [vfmt](https://github.com/vlang/v): `formatter_vfmt.lua`
- [sql-formatter](https://github.com/sql-formatter-org/sql-formatter): `formatter_sqlformatter.lua`
- [zigfmt](https://ziglang.org): `formatter_zigfmt.lua`

## Installation

1. Copy the `formatter.lua` file into the lite/lite-xl `data/plugins` folder

2. To install any specific formatter, copy the corresponding file into the `data/plugins` folder. List of formatters is at the top of this file.

3. Make sure you have the command that formatter uses installed, or it won't work.

4. Extra configuration:
    If you want to customize the cli arguments for a specific formatter, you can do this from your `init.lua` script.
    Example:
```lua
config.jsbeautify_args = {"-r", "-s 4", "-p", "-b end-expand"} -- set jsBeautify arguments to indent with spaces.
```

## Using `formatter`

The default keymap to format the current doc is `alt+shift+f`.

The command is `formatter:format-doc`.

To make Lite XL automatically format the current document on each save, add the following config to `USERIDR/init.lua`:

```lua
config.format_on_save = true
```

## Adding a formatter module

Here is an example of a formatter module:

`formatter_jsbeautify.lua`

```lua
-- mod-version:3 lite-xl 2.1

-- for the JS Beautify fortmatter
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

Then make a pull request.
