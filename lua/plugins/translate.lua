return {
    "uga-rosa/translate.nvim",
    event = "VeryLazy",
    opts = {
        default = {
            command = "translate_shell",
        },
        preset = {
            output = {
                split = {
                    append = true,
                },
            },
        },
    },
}
