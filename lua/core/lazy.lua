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

local function import_plugin()
    local plugin_base = "plugins"
    local full_path = vim.fn.stdpath("config") .. "/lua/" .. plugin_base
    local imports = {}

    table.insert(imports, { import = plugin_base })

    for _, folder in ipairs(vim.fn.globpath(full_path, "*", true, true)) do
        if vim.fn.isdirectory(folder) == 1 then
            if vim.fn.globpath(folder, "*.lua", false, true)[1] then
                local name = vim.fn.fnamemodify(folder, ":t")
                table.insert(imports, { import = plugin_base .. "." .. name })
            end
        end
    end

    return imports
end

require("lazy").setup({
    spec = import_plugin(),
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
    rocks = {
        enabled = false,
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
