local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

treesitter.setup({
	-- ensure_installed = "maintainers", -- "all" For all langues, "maintained" For parsers with maintainers
	ensure_installed = { "c", "cpp", "lua", "python" },
	sync_install = false, -- Install languages synchronously (only applied to "ensure_installed")
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- False will disable the whole extension
		disable = { "" }, -- List of language that will be disabled
		additional_vim_regex_highlighting = true,
	},
	-- indent = { enable = true, disable = { "yaml" } },

	-- Enable rainbow parentheses
	-- See: https://github.com/p00f/nvim-ts-rainbow
	rainbow = {
		enable = true,
		-- disable = { }
		extended_mode = true, -- Highlight non-brackets delimiters like HTML tags
		max_file_lines = nil  -- Do not enable for files with more than n lines
		-- colors = {}
		-- termcolors = {}
	}
})

