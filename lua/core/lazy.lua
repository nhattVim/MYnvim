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

-- load plugins
local importdata = {
    { import = "plugins" },
    { import = "plugins.lsp" },
}

-- load theme
local theme = my_opts.themes or {}
for key, _ in pairs(theme) do
    table.insert(importdata, { import = "plugins.themes." .. key })
end

-- load language config
local lang = my_opts.langs or {}
for key, value in pairs(lang) do
    if value then
        table.insert(importdata, { import = "plugins.langs." .. key })
    end
end

require("lazy").setup({
    spec = {
        -- { import = "plugins" },
        -- { import = "plugins.lsp" },
        -- { import = "plugins.nvzone" },
        importdata,
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

if my_opts.themes then
    local theme2 = ""
    for _, value in pairs(my_opts.themes or {}) do
        theme2 = value
    end
    pcall(vim.cmd.colorscheme, theme2)
end
