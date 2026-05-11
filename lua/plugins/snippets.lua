return {
    "chrisgrieser/nvim-scissors", -- Edit and add snippets
    cmd = { "ScissorsAddNewSnippet", "ScissorsEditSnippet" },
    opts = {
        snippetDir = vim.fn.stdpath("config") .. "/snippets",
    },
}
