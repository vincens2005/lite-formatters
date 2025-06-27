#!/bin/bash
lpm run --ephemeral \
        --config='
core.reload_module("colors.onedark")

local formatter = require "plugins.formatter"
formatter.load()' \
        ./ formatter onedark
