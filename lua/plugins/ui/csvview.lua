return {
    "hat0uma/csvview.nvim",
    cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
    opts = {
        parser = { comments = { "#", "//" } },
        view = {
            display_mode = "border",
        },
    },
}
