local wk = require("which-key")

local mappings = {
	["e"] = { "<cmd>NvimTreeToggle<cr>", "Browse Files" },
	["h"] = { "<cmd>ToggleTerm direction=horizontal size=10<cr>", "Open Horizontal Terminal" },
	["w"] = { "<cmd>w<cr>", "Save Buffer" },
	["q"] = { "<cmd>bdelete<cr>", "Close Buffer" },
	["r"] = { "<cmd>nohlsearch<cr>", "Remove search selection" },

	-- Buffers
	["b"] = {
		name = "+buffer",
		["f"] = { "<cmd>BufferLineTogglePin<cr>", "Pin buffer" },
		["c"] = { "<cmd>close<cr>", "Close" },
		["n"] = { "<cmd>BufferLineMoveNext<cr>", "Move to the right" },
		["p"] = { "<cmd>BufferLineMovePrev<cr>", "Move to the left" },
		["h"] = { "<cmd>hsplit<cr>", "Horizontal" },
		["v"] = { "<cmd>vsplit<cr>", "Vertical" }
	},

	-- Telescope
	["f"] = {
		name = "+telescope", -- Group name
		["b"] = { "<cmd>Telescope buffers", "Search opened tabs" },
		["f"] = { "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", "Find sile" },
		["p"] = { "<cmd>Telescope find_files<cr>", "Find file with preview" },
		["s"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search string in file" },
		["a"] = { "<cmd>Telescope live_grep<CR>", "Serch string in all files" }
		-- r = "Open Recent File",
	},

	-- LSP Commands
	-- Commands set on mason.lua
	["l"] = {
		name = "+lsp",
		["a"] = "View all possible actions",
		["f"] = "Quick Fix",
		["F"] = "Format",
		["i"] = "Current LSP info",
		["j"] = "Diagnostic go to next",
		["k"] = "Diagnostic go to prev",
		["q"] = "View all problems location",
		["r"] = "Rename symbol (e.g. namespace, macro)",
		["s"] = "Signature help"
	},

	["p"] = {
		name = "+picker",
		["p"] = { ":IconPickerNormal<cr>", "Icon picker" },
		["e"] = { ":IconPickerInsert emoji<cr>", "Emoji picker" },
	},

	["i"] = {
		name = "+tabident",
		["2"] = { "<cmd>%s/^  /	/g<cr>", "2 spaces ident" },
		["3"] = { "<cmd>%s/^   /	/g<cr>", "3 spaces ident" },
		["4"] = { "<cmd>%s/^    /	/g<cr>", "4 spaces ident" },
		["e"] = { "<cmd>%s/  /	/g<cr>", "All 2 spaces to Tab" }
	}
	-- "which_key_ignore"
}

local visual_mappings = {
	["s"] = {
		name = "+silicon",
		["s"]= { function() require("nvim-silicon").shoot() end, "Create code screenshot" },
		["f"]= { function() require("nvim-silicon").file() end,  "Save code screenshot as file" },
		["c"]= { function() require("nvim-silicon").clip() end,  "Copy code screenshot to clipboard" },
	}
}


wk.register(mappings, { prefix = "<leader>" })
wk.register(visual_mappings, { prefix = "<leader>", mode = "v" })
