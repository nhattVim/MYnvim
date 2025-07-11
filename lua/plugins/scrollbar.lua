return {
    "dstein64/nvim-scrollview", -- Scrollbar (Optional)
    event = "BufReadPre",
    opts = {
        excluded_filetypes = { "NvimTree" },
        on_startup = false,
        current_only = true,
    },
}
