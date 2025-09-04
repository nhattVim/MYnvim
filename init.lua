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

-- Import neovim configuration
require("core.autocmds")
require("core.options")
require("core.keymaps")

if vim.g.neovide then
    -- Neovide must not transparent
    vim.g.transparent = false
    require("others.neovide")
end

-- Import plugins manager
require("core.lazy_lib")
