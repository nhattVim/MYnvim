return {
    -- NOTE: Move faster with unique f/F indicators
    "jinh0/eyeliner.nvim",
    keys = {
        { "f" },
        { "F" },
    },
    opts = {
        highlight_on_key = true,
        dim = true,
        max_length = 9999,
        disabled_filetypes = {},
        disabled_buftypes = {},
        default_keymaps = true,
    },
}
