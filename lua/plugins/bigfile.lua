return {
    "LunarVim/bigfile.nvim",
    event = "BufReadPre",
    opts = {
        filesize = 2, -- size of the file in MiB, the plugin round file sizes to the closest MiB
        features = { -- features to disable
            "indent_blankline",
            "illuminate",
            "lsp",
            "treesitter",
            "syntax",
            "matchparen",
            "vimopts",
            "filetype",
        },
        -- disable when the file length is greater than 2000 lines
        pattern = function(bufnr)
            local file_contents = vim.fn.readfile(vim.api.nvim_buf_get_name(bufnr))
            local file_length = #file_contents
            if file_length > 2000 then
                return true
            end
        end,
    },
}
