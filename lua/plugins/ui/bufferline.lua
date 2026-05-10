return {
    "akinsho/bufferline.nvim",
    dependencies = { "tiagovla/scope.nvim", config = true },
    event = "VimEnter",
    version = "*",
    opts = {
        options = {
            hover = {
                enabled = true,
                delay = 200,
                reveal = { "close" },
            },
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "nhattVim",
                    highlight = "Directory",
                    text_align = "center",
                    separator = true,
                },
            },
            always_show_bufferline = false,
            tabpage_offset = 2,
            buffer_close_icon = "",
            modified_icon = "",
            close_icon = "",
            left_trunc_marker = "",
            right_trunc_marker = "",
            indicator = {
                icon = "▎",
                style = "none",
            },
            diagnostics = "nvim_lsp",
            diagnostics_indicator = function(count)
                return "(" .. count .. ")"
            end,
        },
    },
    config = function(_, opts)
        require("bufferline").setup(opts)
        require("core.utils").set_keys(nil, {
            { "n", "<tab>", "<cmd>BufferLineCycleNext<cr>", "Next buffer" },
            { "n", "<s-tab>", "<cmd>BufferLineCyclePrev<cr>", "Previous buffer" },
            { "n", "<m-n>", "<cmd>tabnext<cr>", "Next tab" },
            { "n", "<m-p>", "<cmd>tabprevious<cr>", "Previous tab" },
        })
    end,
}
