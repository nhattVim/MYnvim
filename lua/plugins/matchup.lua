---@diagnostic disable: undefined-field
return {
    "andymass/vim-matchup",
    event = "VeryLazy",
    config = function()
        local ok, cmp = pcall(require, "cmp")
        if ok then
            cmp.event:on("menu_opened", function()
                vim.b.matchup_matchparen_enabled = false
            end)
            cmp.event:on("menu_closed", function()
                vim.b.matchup_matchparen_enabled = true
            end)
        end
        vim.g.matchup_matchparen_offscreen = { method = "none" }
        require("match-up").setup({})
    end,
}
