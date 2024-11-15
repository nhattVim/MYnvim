return {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    opts = {
        timeout = vim.o.timeoutlen,
        mappings = {
            i = {
                j = {
                    k = "<Esc>",
                    j = "<Esc>",
                },
            },
            c = {
                j = {
                    k = "",
                    j = "",
                },
            },
            t = {
                j = {
                    k = "",
                    j = "",
                },
            },
            v = {
                j = {
                    k = "",
                },
            },
            s = {
                j = {
                    k = "",
                },
            },
        },
    },
}
