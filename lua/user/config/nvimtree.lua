local status_ok, nvimtree = pcall(require, "nvim-tree")
if not status_ok then
	return
end


-- local function on_attach(bufnr)
-- 	local api = require("nvim-tree.api")
--
-- 	local function opts(desc)
-- 		return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
-- 	end
--
--
-- 	-- local function api_examples()
-- 	-- 	-- local node = api.tree.get_node_under_cursor()
-- 	-- 	-- local is_folder = node.fs_stat and node.fs_stat.type == 'directory' or false
-- 	-- 	-- Just to remember if someday i need it
-- 	-- 	-- node.nodes ~= nil -> folder -> else -> file
-- 	-- end
--
-- 	vim.keymap.set('n', '?', api.diagnostics.hi_test, opts('Edit'))
-- end



nvimtree.setup({
	sort = {
		sorter = "case_sensitive"
	},

	view = {
		width = 25,
		adaptive_size = true,
		side = "left",
		-- mappings = {
		-- 	list = {
		-- 		-- { key = "<cr>", cb: }
		-- 		{ key = "v", action = "vsplit" },
		-- 	}
		-- }
	},

	filters = {
		dotfiles = false -- Hide dot files
	},

	git = {
		enable = true,
	},


	-- Show diagnostics
	diagnostics = {
		enable = true,
		show_on_dirs = false,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},

	-- Opened file focus
	update_focused_file = {
		enable = true,
		update_cwd = false,
		ignore_list = {}
	},

	renderer = {

		indent_markers = {
			enable = true,
			icons = {
				corner = "└ ",
				edge = "│ ",
				item = "│ ",
				none = "	",
			}
		},

		-- Change git icons
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
	},


	-- My custom keymaps
	-- on_attach = on_attach
})

