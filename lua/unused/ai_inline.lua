return {
    "ggml-org/llama.vim", -- AI ghost text completion like GitHub Copilot (Optional)
    event = "VeryLazy",
    init = function()
        -- Highlight groups
        vim.api.nvim_set_hl(0, "llama_hl_hint", { fg = "#808080", ctermfg = 244, default = true })
        vim.api.nvim_set_hl(0, "llama_hl_info", { fg = "#77ff2f", ctermfg = 119, default = true })

        -- Settings
        vim.g.llama_config = {
            show_info = false,
            keymap_accept_full = "<A-f>",
            keymap_accept_line = "<A-a>",
            keymap_accept_word = "<A-w>",
        }
    end,
}
