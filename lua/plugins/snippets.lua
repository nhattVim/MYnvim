return {
    "chrisgrieser/nvim-scissors", -- Edit and add snippets
    cmd = { "ScissorsAddSnippet", "ScissorsEditSnippet" },
    opts = {
        snippetDir = vim.fn.stdpath("config") .. "/snippets",
    },
}
