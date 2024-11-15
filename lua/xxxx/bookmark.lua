return {
    "tomasky/bookmarks.nvim",
    event = "VimEnter",
    opts = {
        sign_priority = 10,
        save_file = vim.fn.expand("$HOME/.bookmarks"), -- bookmarks save file path
        keywords = {
            ["@t"] = " ", -- mark annotation startswith @t ,signs this icon as `Todo`
            ["@w"] = " ", -- mark annotation startswith @w ,signs this icon as `Warn`
            ["@f"] = "󰢷 ", -- mark annotation startswith @f ,signs this icon as `Fix`
            ["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
        },
        signs = {
            add = { hl = "BookMarksAdd", text = " ", numhl = "BookMarksAddNr", linehl = "BookMarksAddLn" },
            ann = { hl = "BookMarksAnn", text = "♥ ", numhl = "BookMarksAnnNr", linehl = "BookMarksAnnLn" },
        },
    },
}
