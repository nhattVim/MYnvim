return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            highlight = {
                enable = true,
                disable = { "css" },
            },
            indent = {
                enable = true,
            },
            ensure_installed = {
                -- "json",
                -- "javascript",
                -- "typescript",
                -- "tsx",
                -- "yaml",
                "java",
                "html",
                "bash",
                "lua",
                "cpp",
                "c",
                -- "vim",
                -- "dockerfile",
                -- "gitignore",
                -- "query",
            },
            auto_install = true, -- make sure there languages will install
        })
    end,
}
