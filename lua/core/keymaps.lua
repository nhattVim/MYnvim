-- utils variable
local set = vim.keymap.set
local opts = { noremap = true, silent = true }

--------------------------------------------- general keymap ------------------------------------------------

-- exit Visual mode
set("v", "<leader><leader>", "<ESC>", opts)

-- remap undo and redo with silent
set("n", "u", "<cmd>silent! undo<cr>")
set("n", "<C-r>", "<cmd>silent! redo<cr>")

-- navigate in Insert mode
set("i", "<C-h>", "<left>", opts)
set("i", "<C-j>", "<down>", opts)
set("i", "<C-k>", "<up>", opts)
set("i", "<C-l>", "<right>", opts)

-- indentation adjustments in Visual mode
set("v", "<tab>", ">gv", opts)
set("v", "<S-tab>", "<gv", opts)
set("v", ">", ">gv", opts)
set("v", "<", "<gv", opts)

-- Ctrl keymaps like other editors
set({ "n", "i", "v" }, "<C-s>", "<cmd>silent! w!<CR>", opts)
set({ "n", "v" }, "<C-v>", '"+p', opts)
set("i", "<C-v>", '<Esc>"+pa', opts)
set("c", "<C-S-v>", "<C-R>+", opts)
set("v", "<C-c>", '"+y', opts)
set("n", "<C-a>", "ggVG", opts)
