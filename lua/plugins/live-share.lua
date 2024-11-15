return {
    -- Creates a "Live Share" server in Neovim,
    -- Similar to the Visual Studio Code Live Share functionality
    "azratul/live-share.nvim",
    cmd = { "LiveShareServer", "LiveShareJoin" },
    dependencies = {
        "jbyuki/instant.nvim",
    },
    config = function()
        vim.g.instant_username = "albedo"
        require("live-share").setup({
            port_internal = 8765,
            max_attempts = 40,
            -- service = "serveo.net",
        })
    end,
}
