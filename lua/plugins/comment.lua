return {
    "numToStr/Comment.nvim",
    dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring", -- setting the commentstring based on the cursor location in a file
    },
    keys = {
        { "gcc", mode = "n",          desc = "Comment toggle current line" },
        { "gbc", mode = "n",          desc = "Comment toggle current block" },
        { "gc",  mode = { "n", "v" }, desc = "Comment toggle linewise" },
        { "gb",  mode = { "n", "v" }, desc = "Comment toggle blockwise" },
    },
    config = function()
        -- disabling the default autocmd is required
        require("ts_context_commentstring").setup({
            enable_autocmd = false,
        })
        require("Comment").setup({
            -- for commenting tsx and jsx files
            pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
        })
    end,
}
