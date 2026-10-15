-- Look and feel configuration

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 80,
		border_size = 3,
		extend_border_grab_area = 10,
		resize_on_border = true,
		col = {
			active_border = CACHYBLUE,
			inactive_border = CACHYGRAY,
		},
	},
	group = {
		col = {
			border_active = CACHYLBLUE,
			border_inactive = CACHYGRAY,
			border_locked_active = CACHYDBLUE,
			border_locked_inactive = CACHYGRAY,
		},
		groupbar = {
			col = {
				active = CACHYLGREEN,
				inactive = CACHYGRAY,
				locked_active = CACHYDBLUE,
				locked_inactive = CACHYGRAY,
			},
		},
	},
	decoration = {
		dim_special = 0.3,
		rounding = 5,
		active_opacity = 0.95,
		inactive_opacity = 0.85,
		fullscreen_opacity = 1,
		blur = {
			size = 1,
			passes = 5,
			special = true,
		},
	},
})
