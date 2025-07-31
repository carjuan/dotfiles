local wezterm = require("wezterm")

return {
	automatically_reload_config = true,

	color_scheme = "Panda (Gogh)",
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

	-- Window settings
	window_decorations = "NONE",
	enable_tab_bar = false,
	--window_title = "Alacritty",
}
