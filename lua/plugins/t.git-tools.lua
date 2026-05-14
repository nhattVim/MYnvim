return {
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        enabled = vim.fn.executable("git") == 1,
        opts = {
            preview_config = {
                border = "rounded",
            },
        },
    },

    {
        "akinsho/git-conflict.nvim",
        event = "VeryLazy",
        version = "*",
        opts = {
            default_mappings = {
                ours = "o",
                theirs = "t",
                none = "0",
                both = "b",
                next = "n",
                prev = "p",
            },
        },
    },
}
