---------------------------------------------------------------------------
-------------------------- Developed by nhattVim --------------------------
------------------- Github: https://github.com/nhattVim -------------------
---------------------------------------------------------------------------
-------- ███╗   ███╗██╗   ██╗    ███╗   ██╗██╗   ██╗██╗███╗   ███╗ --------
-------- ████╗ ████║╚██╗ ██╔╝    ████╗  ██║██║   ██║██║████╗ ████║ --------
-------- ██╔████╔██║ ╚████╔╝     ██╔██╗ ██║██║   ██║██║██╔████╔██║ --------
-------- ██║╚██╔╝██║  ╚██╔╝      ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║ --------
-------- ██║ ╚═╝ ██║   ██║       ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║ --------
-------- ╚═╝     ╚═╝   ╚═╝       ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ --------
---------------------------------------------------------------------------

---------------------------------------------------------------------------
-- Enable Neovim's Lua module bytecode caching for faster startup.       --
-- This should be called at the very beginning of your configuration     --
-- To ensure all loaded Lua modules benefit from the performance boost.  --
vim.loader.enable()
---------------------------------------------------------------------------

if vim.g.neovide then
    -- Config for Neovide
    require("others.neovide")
elseif vim.g.vscode then
    -- Config for VSCode Neovim extension
    require("others.functions")
    require("others.mappings")
else
    -- Config for neovim
    require("core.autocmds")
    require("core.options")
    require("core.keymaps")
    require("core.lazy")
end
