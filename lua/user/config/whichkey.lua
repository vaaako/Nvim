local wk = require("which-key")

local mappings = {
	e = "Browse Files",
	h = "Open Horizontal Terminal",

	a = {
		name = "+actions",
		p = "Icon picker",
		e = "Emoji picker",
		s = "Screenshot selection",
		r = "Remove search selection"
	},

	t = {
		name = "+tabident",
		["2"] = "2 spaces ident",
		["3"] = "3 spaces ident",
		["4"] = "4 spaces ident",
		e = "Every 2 spaces to Tab"
	},

	w = "Save Buffer",
	q = "Close Buffer",

	f = {
		name = "+file",                  -- Group name
		b    = "Search opened tabs",
		f    = "Find sile",
		p    = "Find file with preview",
		s    = "Search string in file",
		a    = "Serch string in all files"
		-- r = "Open Recent File",
	},

	s = {
		name = "+split",
		h    = "Horizontal",
		v    = "Vertical"
	},

	r = {
		name = "+remove",
		s    = "Selection"
	},

	b = {
		name = "+buffer",
		n    = "Move to the right",
		p    = "Move to the left",
		f    = "Pin buffer"
	},

	-- LSP Commands
	["l"] = "which_key_ignore"
}

local opts = { prefix = "<leader>" }

wk.register(mappings, opts)
