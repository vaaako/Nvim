require("user.options")
require("user.keymaps")
require("user.colorscheme")

local colorscheme = "dracula"

local plugins = require("user.plugins")
plugins.config.plugins = {
	{
		"kylechui/nvim-surround",
		version = "*",
		config = function()
			require("nvim-surround").setup()
		end
	},

	-- Colorschemes
	"folke/tokyonight.nvim",
	"Mofiqul/dracula.nvim"

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
	lazy = false, -- Lazy load plugins (Load plugins after nvim open)
}


-- Load and sync plugins
plugins.sync_plugins()


-- Be sure to add plugins config after loading the plugins
-- Plugins configs
require("user.cmp")
require("user.lsp") -- Credits: https://github.com/LunarVim/Neovim-from-scratch
require("user.config.telescope")
require("user.config.treesitter")
require("user.config.toggleterm")
require("user.config.bufferline")
require("user.config.lualine")
require("user.config.whichkey")

-- Use colorscheme
-- Add a second argument for background opacity (e.g. setColorScheme(colorscheme, 80))
-- If termgui is enabled, opacity is set by terminal
require("user.colorscheme").setColorScheme(colorscheme, 80)

