---@diagnostic disable: undefined-field
-- Import neovim configuration
require("core.autocmds")
require("core.options")
require("core.keymaps")
-- Neovide must not transparent
vim.g.transparent = false
require("core.lazy")

-- Config for Neovide
vim.o.guifont = "MesloLGS NF:h10"
vim.g.neovide_floating_shadow = true

-- Fix mouse
if vim.fn.has("win32") == 1 then
    -- local dir = "C:\\Games\\Unity\\UnityTutorial"
    local dir = "C:\\Users\\nhatt\\UserData"
    if vim.loop.fs_stat(dir) then
        vim.cmd("cd " .. dir)
    else
        vim.cmd("cd ~")
    end
end
