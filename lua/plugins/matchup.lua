return {
    "andymass/vim-matchup",
    event = "VeryLazy",
    init = function()
        vim.g.matchup_matchparen_offscreen = { method = "none" }
        vim.cmd([[hi MatchParen gui=italic guifg=#ff966c]])
    end,
    config = function()
        local augroup = vim.api.nvim_create_augroup("MatchupCmp", { clear = true })

        vim.api.nvim_create_autocmd("User", {
            group = augroup,
            pattern = "CmpMenuOpen",
            callback = function()
                vim.g.matchup_matchparen_enabled = false
            end,
        })

        vim.api.nvim_create_autocmd("User", {
            group = augroup,
            pattern = "CmpMenuClose",
            callback = function()
                vim.g.matchup_matchparen_enabled = true
            end,
        })

        vim.api.nvim_create_autocmd("InsertLeave", {
            group = augroup,
            callback = function()
                vim.g.matchup_matchparen_enabled = true
            end,
        })
    end,
}
