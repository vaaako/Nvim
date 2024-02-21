local wk = require("which-key")

local mappings = {
	e = "Browse Files",
	t = "Open Horizontal Terminal",

	w = "Save Buffer",
	q = "Close Buffer",

	f = {
		name = "+file",                 -- Group name
		f    = "Find File",              -- Create a binding with label
		p    = "Find file with preview", -- Create just a label
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
