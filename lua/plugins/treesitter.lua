return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
        local ts = require("nvim-treesitter")
        local config = require("nvim-treesitter.config")

        local parsers = {
            "vim",
            "vimdoc",
            "rust",
            "c",
            "cpp",
            "go",
            "html",
            "css",
            "javascript",
            "json",
            "lua",
            "markdown",
            "python",
            "typescript",
            "vue",
            "svelte",
            "bash",
        }

        ts.setup({})

        ts.install(vim.tbl_filter(function(parser)
            return not vim.tbl_contains(config.get_installed(), parser)
        end, parsers))

        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                local lang = vim.treesitter.language.get_lang(args.match)

                if vim.tbl_contains(ts.get_installed(), lang) then
                    vim.treesitter.start(args.buf)
                end
            end,
        })
    end,
}
