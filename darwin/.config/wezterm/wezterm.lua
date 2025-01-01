local wezterm = require("wezterm")

return {
	-- Live reload
	automatically_reload_config = true,

	-- Colorscheme
	colors = {
		foreground = "#e6e6e6",
		background = "#292a2b",
		cursor_bg = "#ffb86c",
		cursor_fg = "#fefff2",
		cursor_border = "#ffb86c",
		selection_bg = "#555555",
		selection_fg = "#e6e6e6",

		ansi = {
			"#292a2b", -- black
			"#ff2c6d", -- red
			"#19f9d8", -- green
			"#ffb86c", -- yellow
			"#45a9f9", -- blue
			"#ff75b5", -- magenta
			"#6fc1ff", -- cyan
			"#e6e6e6", -- white
		},
		brights = {
			"#555555", -- bright black
			"#ff2c6d", -- bright red
			"#19f9d8", -- bright green
			"#ffcc95", -- bright yellow
			"#6fc1ff", -- bright blue
			"#ff9ac1", -- bright magenta
			"#6fc1ff", -- bright cyan
			"#ffffff", -- bright white
		},
	},

	-- Cursor settings
	default_cursor_style = "BlinkingBlock",
	cursor_blink_rate = 0, -- Blinking "Never"
	force_reverse_video_cursor = false, -- equivalent to unfocused_hollow=false in Alacritty

	-- Font settings
	font = wezterm.font("FiraCode Nerd Font Propo", { weight = "Bold" }),
	font_size = 16.0,
	adjust_window_size_when_changing_font_size = false,

	-- Font offset (not directly configurable in WezTerm, but this can be adjusted via padding)
	window_padding = {
		left = 1,
		right = 0,
		top = 0,
		bottom = 0,
	},

	-- Clipboard settings
	enable_csi_u_key_encoding = true, -- Similar behavior for copying text to clipboard

	enable_tab_bar = false,
}
