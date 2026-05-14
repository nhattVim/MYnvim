return {
    "uga-rosa/translate.nvim",
    cmd = "Translate",
    opts = {
        default = { command = "translate_shell" },
        preset = {
            output = {
                floating = {
                    border = "rounded",
                    filetype = "translate",
                    zindex = 500,
                },
            },
        },
    },
}
