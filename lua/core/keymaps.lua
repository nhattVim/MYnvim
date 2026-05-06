-- General keymaps
require("core.utils").set_keys(nil, {
    { "v", "<leader><leader>", "<esc>", "Exit visual mode" },
    { "n", "u", "<cmd>silent! undo<cr>", "Undo" },
    { "n", "<C-r>", "<cmd>silent! redo<cr>", "Redo" },
    { "i", "<C-k>", "<up>", "Move up" },
    { "i", "<C-j>", "<down>", "Move down" },
    { "i", "<C-h>", "<left>", "Move left" },
    { "i", "<C-l>", "<right>", "Move right" },
    { "v", ">", ">gv", "Indent right" },
    { "v", "<tab>", ">gv", "Indent right" },
    { "v", "<", "<gv", "Indent left" },
    { "v", "<S-tab>", "<gv", "Indent left" },
    { { "n", "i", "v" }, "<C-s>", "<cmd>silent! w!<CR>", "Save" },
    { { "n", "v" }, "<C-v>", '"+p', "Paste in normal and visual mode" },
    { "i", "<C-v>", '<Esc>"+pa', "Paste in insert mode" },
    { "c", "<C-v>", "<C-R>+", "Paste in command mode", { silent = false } },
    { "v", "<C-c>", '"+y', "Copy to clipboard" },
    { "n", "<C-a>", "ggVG", "Select all" },
    {
        "x",
        "Y",
        function()
            require("core.utils").yank_file_path_with_range()
        end,
        "Yank file path with line range",
    },
})
