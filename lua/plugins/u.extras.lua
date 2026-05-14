return {

    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
    },
    {
        "OXY2DEV/helpview.nvim",
        ft = "help",
    },
    {
        "brenoprata10/nvim-highlight-colors", -- Colorizer (Optional)
        event = "BufReadPost",
        opts = {
            render = "virtual",
            virtual_symbol = "󱓻",
            enable_tailwind = true,
            exclude_filetypes = { "NvimTree" },
        },
    },
    {
        "jinh0/eyeliner.nvim", -- NOTE: Move fasterwith unique f/F indicators (Optional)
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
    },
    {
        "dstein64/nvim-scrollview", -- Scrollbar (Optional)
        event = "BufReadPost",
        opts = {
            excluded_filetypes = { "NvimTree" },
            on_startup = false,
            current_only = true,
        },
    },
    {
        "hat0uma/csvview.nvim",
        cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
        ft = { "csv", "tsv" },
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "csv", "tsv" },
                callback = function()
                    vim.schedule(function()
                        require("csvview").enable()
                    end)
                end,
            })
        end,
        opts = {
            parser = { comments = { "#", "//" } },
            view = {
                display_mode = "border",
            },
        },
    },
}
