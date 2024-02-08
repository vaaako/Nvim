local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

-- See more configs here: https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/user/bufferline.lua
bufferline.setup({
	options = {
		numbers = "ordinal", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string
		close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
		middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
	}
})
