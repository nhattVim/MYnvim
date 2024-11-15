return {
    "brenoprata10/nvim-highlight-colors", -- Colorizer
    event = "BufReadPre",
    opts = {
        render = "virtual",
        virtual_symbol = "",
        enable_tailwind = true,
    },
}
