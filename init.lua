require("user.options")
require("user.keymaps")
require("user.colorscheme")

-- [!] Change colorscheme here
local colorscheme = "dracula"

local plugins = require("user.plugins")
plugins.config.plugins = {
	{
		"xiyaowong/nvim-cursorword", -- Highlight match words under cursor
	},

	{
		"kylechui/nvim-surround",
		version = "*",
		config = function()
			require("nvim-surround").setup()
		end
	},

	-- WARNING -- This plugins slows the loading time
	{
		"folke/todo-comments.nvim", -- Highlight comment words
		event = "VeryLazy",

		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({
				signs = true, -- Show signs,

	 			highlight = {
					multiline = true,
					pattern = [[.*<(KEYWORDS)\s*]]   -- Match: " KEYWORD "
				},

				-- INFO -- Some colorschemes may affectcolors
				keywords = {
					TODO = { icon = " ", color = "default" },
				},

				-- INFO -- If termgui is enabled, terminal colors will be used instead
				colors = {
					error   = { "DiagnosticError", "ErrorMsg", "#DC2626" },
					warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
					info    = { "DiagnosticInfo", "#2563EB" },
					hint    = { "DiagnosticHint", "#10B981" },
					default = { "Identifier", "#7C3AED" },
					test    = { "Identifier", "#FF00FF" }
				},
			})
		end,
	},

	-- Sometimes works, sometimes not
	{
		"andweeb/presence.nvim", -- Discord RPC
		-- event = "VeryLazy",

		config = function()
			require("presence").setup({
				auto_update = true,
				-- log_level = "debug",

				main_image          = "file",
				buttons             = false,
				-- enabled_line_number = true,

				editing_text        = "Editing %s",
				file_explorer_text  = "Browsing %s",
				reading_text        = "Reading %s",
				workspace_text      = "Working on %s",
				line_number_text    = "Line %s out of %s",

				git_commit_text     = "Committing changes",
				plugin_manager_text = "Managing plugins"
			})
		end
	},

	-- Colorschemes
	"folke/tokyonight.nvim",
	"Mofiqul/dracula.nvim",
	"catppuccin/nvim"

	-- INFO -- Config other plugins

	-- Lazy
	-- Updating plugins: Press "<leader>pu"

	-- LSP
	-- If you want a new server, add to "lsp/mason.lua"
	-- and config file (optional) to "lsp/settings/"

	-- Treesitter
	-- If you want treesitter to some language, add it to "config/treesitter.lua"

	-- Plugin with big config file
	-- Add config file to "config/" (see other configs to see how it's done) and import here
}

-- Add more options if you want
plugins.config.lazy_config = {
	defaults = {
		lazy = false, -- Lazy load plugins (Load plugins after nvim open)
	}
}


-- Load and sync plugins
plugins.sync_plugins()


-- Be sure to add plugins config after loading the plugins
-- Plugins configs
require("user.cmp")
require("user.lsp") -- Credits: https://github.com/LunarVim/Neovim-from-scratch
require("user.config.bufferline")
require("user.config.lualine")
require("user.config.nvimtree")
require("user.config.telescope")
require("user.config.treesitter")
require("user.config.toggleterm")
require("user.config.whichkey")

-- Use colorscheme
-- Add a second argument for background opacity (e.g. setColorScheme(colorscheme, 80))
-- INFO -- If termgui is enabled, opacity is set by terminal
require("user.colorscheme").setColorScheme(colorscheme, 80)

