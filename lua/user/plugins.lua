-- Automatically install Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if Lazy is installed
if not vim.loop.fs_stat(lazypath) then
	-- git clone to path
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- Latest stable
		lazypath,
	})

	print("Installing Lazy.nvim close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end
vim.opt.rtp:prepend(lazypath)

-- Sync pakcer whenever write init.lua (The change can be an added/removed plugin)
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost init.lua source <afile> | PackerSync
--   augroup end
-- ]])
-- autocmd BufWritePost plugins.lua source <afile> | PackerSync


-- If you do some change here, run :PackerSync
local lock_plugins = {
	-- Necessary Plugins
	-- WARNING: Don't delete any of the plugins below
	"wbthomason/packer.nvim",      -- Have packer manage itself
	"nvim-lua/popup.nvim",         -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim",       -- Useful lua functions used ny lots of plugins
	"nvim-tree/nvim-web-devicons", -- Tabline icons

	-- Completion Plugins
	"hrsh7th/nvim-cmp",         -- Completion plugin
	"hrsh7th/cmp-buffer",       -- Buffer completion
	"hrsh7th/cmp-path",         -- Path completion
	"hrsh7th/cmp-nvim-lsp",     -- LSP cmp
	"saadparwaiz1/cmp_luasnip", -- Snippet completion

	-- Snippets
	"L3MON4D3/LuaSnip",             -- Snippet engine
	"rafamadriz/friendly-snippets", -- A bunch of snippets

	-- LSP
	"neovim/nvim-lspconfig",             -- Enable LSP
	"williamboman/nvim-lsp-installer",   -- Simple to use language server installer
	"williamboman/mason.nvim",           -- Simple to use language server installer
	"williamboman/mason-lspconfig.nvim", -- Simple to use language server installer
	"jose-elias-alvarez/null-ls.nvim",   -- LSP diagnostics and code actions

	-- Telescope
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-media-files.nvim", -- View files with telescope (not supported on all terminals)

	-- Treesiter
	-- Better syntax highlight
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate"
	},


	-- Others
	-- INFO: You can remove or edit any plugin below

	-- Tabline
	"akinsho/bufferline.nvim", -- Tabline
	"lewis6991/gitsigns.nvim", -- Tabline git status
	-- I don't like barbar.nvim because of the blank file it creates
	-- "romgrk/barbar.nvim",          -- Tabline
	-- Fot tab options see: https://github.com/romgrk/barbar.nvim

	-- Treesiter
	"p00f/nvim-ts-rainbow",

	-- Customization
	"JoosepAlviste/nvim-ts-context-commentstring", -- What comment use based on context (for files with two comments)
	"akinsho/toggleterm.nvim",                     -- Crtrl + / Opens terminal
	"nvim-lualine/lualine.nvim",                   -- Better bottom line
	"terryma/vim-multiple-cursors",                -- Multiple cursors like sublime

	{
		"folke/which-key.nvim", -- Show leader commands
		event = "VeryLazy",
	},
	{
		"nvim-tree/nvim-tree.lua", -- Nerdtree
	},
	{
		"m4xshen/autoclose.nvim", -- Autoclose (), {}, "" etc
		config = function()
			require("autoclose").setup()
		end
	},
	{
		"NvChad/nvim-colorizer.lua", -- Highlight colors like #CA1773
		config = function()
			require("colorizer").setup()
		end
	},
	{
		"gbprod/yanky.nvim", -- Highlight yank
		config = function()
			require("yanky").setup()
		end
	},
	{
		"numToStr/Comment.nvim", -- Comment (keymap: gcc)
		config = function()
			require("Comment").setup()
		end
	}
}



local config = {
	plugins = {}, -- If "return plugins" it will return a copy and won't work
	lazy_config = {}
}

local function sync_plugins()
	-- Add lock_plugins to plugins table to sync all
	for _, value in pairs(lock_plugins) do
		table.insert(config.plugins, value)
	end

	-- Load all plugins and config
	require("lazy").setup(config.plugins, config.lazy_config)
end


return {
	config = config,
	sync_plugins = sync_plugins
}
