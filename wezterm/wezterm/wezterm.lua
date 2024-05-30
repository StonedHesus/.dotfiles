local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Disable font ligatures.
config.harfbuzz_features = {"calt=0", "clig=0", "liga=0"}
return config

