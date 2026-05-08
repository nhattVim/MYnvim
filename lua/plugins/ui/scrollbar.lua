return {
    "dstein64/nvim-scrollview", -- Scrollbar (Optional)
    event = "BufReadPost",
    opts = {
        excluded_filetypes = { "NvimTree" },
        on_startup = false,
        current_only = true,
    },
}
