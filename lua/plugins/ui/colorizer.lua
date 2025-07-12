return {
    "brenoprata10/nvim-highlight-colors", -- Colorizer (Optional)
    event = "BufReadPre",
    opts = {
        render = "virtual",
        -- virtual_symbol = "",
        virtual_symbol = "󱓻",
        enable_tailwind = true,
        exclude_filetypes = { "NvimTree" },
    },
}
