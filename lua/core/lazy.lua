---@diagnostic disable: undefined-field
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { import = "plugins" },
        { import = "plugins.lsp" },
        { import = "plugins.nvzone" },
    },
    ui = {
        title = " MYnvim ",
        title_pos = "left",
        border = "rounded",
        pills = true,
        icons = {
            ft = "󰈔",
            loaded = "✓",
            not_loaded = "➜",
        },
    },
    install = {
        missing = true,
        colorscheme = { "tokyonight" },
    },
    change_detection = {
        enabled = true,
        notify = false,
    },
    defaults = {
        lazy = true,
    },
    checker = {
        enabled = true,
    },
    performance = {
        rtp = {
            -- disable some rtp plugins
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
    lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json",
})
