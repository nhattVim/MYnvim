return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufRead", "VeryLazy" },
    build = ":TSUpdate",
    lazy = true,
    cmd = {
        "TSInstall",
        "TSInstallInfo",
        "TSInstallSync",
        "TSUpdate",
        "TSUpdateSync",
        "TSUninstall",
        "TSUninstallInfo",
        "TSInstallFromGrammar",
    },
    opts = function()
        return {
            highlight = {
                enable = true,
                disable = { "css" },
            },
            indent = {
                enable = true,
            },
            ensure_installed = {
                "lua",
                "luadoc",
                "printf",
                "vim",
                "vimdoc",
            },
            incremental_selection = {
                enable = true,
            },
            autopairs = {
                enable = true,
            },
        }
    end,
    config = function(_, opts)
        if type(opts.ensure_installed) == "table" then
            local added = {}
            opts.ensure_installed = vim.tbl_filter(function(lang)
                if added[lang] then
                    return false
                end
                added[lang] = true
                return true
            end, opts.ensure_installed)
        end
        require("nvim-treesitter.configs").setup(opts)
    end,
}
