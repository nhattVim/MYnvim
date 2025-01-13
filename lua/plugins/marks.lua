return {
    "chentoast/marks.nvim",
    event = "BufRead",
    config = function()
        require("marks").setup({
            default_mappings = false,
            mappings = {
                set = "m",
                set_next = "m,",
                toggle = "m;",
                next = "m]",
                prev = "m[",
                preview = "m:",
                next_bookmark = "m}",
                prev_bookmark = "m{",
                delete = "dm",
                delete_line = "dm-",
                delete_bookmark = "dm=",
                delete_buf = "dm<space>",
                set_bookmark0 = "m0",
                delete_bookmark0 = "dm0",
                set_bookmark1 = "m1",
                delete_bookmark1 = "dm1",
                set_bookmark2 = "m2",
                delete_bookmark2 = "dm2",
                set_bookmark3 = "m3",
                delete_bookmark3 = "dm3",
                set_bookmark4 = "m4",
                delete_bookmark4 = "dm4",
                annotate = "m<space>",
            },
            bookmark_0 = {
                sign = "",
                virt_text = "TODO",
            },
            bookmark_1 = {
                sign = "",
                virt_text = "WARN",
            },
            bookmark_3 = {
                sign = "󰢷",
                virt_text = "FIX",
            },
            bookmark_4 = {
                sign = "",
                virt_text = "NOTE",
            },
        })

        vim.cmd([[hi MarkSignHL gui=italic guifg=#fc1a70]])
    end,
}
