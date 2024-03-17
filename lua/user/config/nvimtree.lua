local status_ok, nvimtree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

nvimtree.setup({
	sort = {
		sorter = "case_sensitive"
	},

	view = {
		width = 25,
	},

	filters = {
		dotfiles = false -- Hide dot files
	},

	git = {
		enable = true,
	},

	-- Change git icons
	renderer = {
		icons = {
			glyphs = {
				git = {
					unstaged = "U",
					staged = "S",
					unmerged = "UM",
					renamed = "R",
					deleted = "D",
					untracked = "",
					ignored = "I",
				}
			}
		}
	}
})
