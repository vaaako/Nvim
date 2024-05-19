-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c"

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap -- Shorten function name

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation -> Ctrl+[hjkl] to move between splits
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- keymap("n", "<leader>e", ":Lex 30<cr>", opts) -- Open File explorer
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts) -- Open File explorer

keymap("n", "<leader>w", ":w<cr>", opts) -- Save
keymap("n", "<C-Enter>", ":exit<cr>", opts) -- Save and Exit file

-- Resize with arrows -> Resize splits
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)



-- Actions --
keymap("n", "<leader>ar", ":nohlsearch<cr>", opts) -- Remove selection after search

-- Icon picker
keymap("n", "<leader>ap", "<cmd>IconPickerNormal<CR>", opts)
keymap("n", "<leader>ae", ":IconPickerInsert emoji<CR>", opts)

-- nvim-silicon
keymap("n", "<leader>as", ":Silicon<CR>", opts)
keymap("v", "<leader>as", ":Silicon<CR>", opts)


-- Splits --
keymap("n", "<leader>sh", ":split h<cr>", opts)
keymap("n", "<leader>sv", ":vsplit<cr>", opts)

-- Tabline --
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<leader>q", ":bdelete<cr>", opts) -- Quit

-- If you want to barbar.nvim
keymap("n", "<leader>bn", ":BufferLineMoveNext<CR>", opts)
keymap("n", "<leader>bp", ":BufferLineMovePrev<CR>", opts)
keymap("n", "<leader>bf", ":BufferLineTogglePin<CR>", opts) -- Pin


-- Telescope --
keymap("n", "<leader>fp", ":Telescope find_files<CR>", opts) -- With preview
keymap("n", "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<CR>", opts)
keymap("n", "<leader>fa", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fs", ":Telescope current_buffer_fuzzy_find<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers", opts)


-- Terminal --
-- keymap("n", "<leader>t", ":terminal<cr>", opts)
keymap("n", "<leader>h", ":ToggleTerm direction=horizontal size=10<CR>", opts)

-- Tab ident --
keymap("n", "<leader>t2", ":%s/^  /	/g<CR>", opts)
keymap("n", "<leader>t3", ":%s/^   /	/g<CR>", opts)
keymap("n", "<leader>t4", ":%s/^    /	/g<CR>", opts)
keymap("n", "<leader>ta", ":%s/  /	/g<CR>", opts)




-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "kj", "<ESC>", opts)


-- Visual --
-- Ident and stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts) -- Paste without yanking

-- Visual Block --
-- Move text up and down -> Shift+[JK] move line up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
