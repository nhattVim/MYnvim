return {
    "nvzone/floaterm",
    dependencies = "nvzone/volt",
    cmd = "FloatermToggle",
    opts = {
        terminals = {
            { name = "Term 1" },
            { name = "Term 2" },
            { name = "Term 3" },
        },
    },
    keys = { { mode = { "n", "t" }, "<A-t>", "<cmd>FloatermToggle<cr>", desc = "float terminal" } },
}
