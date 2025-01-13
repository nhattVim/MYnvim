return {
    "akinsho/bufferline.nvim",
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

        vim.keymap.set("n", "<tab>", function()
            vim.cmd("BufferLineCycleNext")
        end, { desc = "Next buffer" }),

        vim.keymap.set("n", "<S-tab>", function()
            vim.cmd("BufferLineCyclePrev")
        end, { desc = "Previous buffer" }),
    },
}
