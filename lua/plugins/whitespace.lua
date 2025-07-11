return {
    "mcauley-penney/visual-whitespace.nvim", -- Highlight whitespace (Optional)
    event = "ModeChanged *:[vV\22]",
    opts = {
        match_types = {
            space = true,
            tab = true,
            nbsp = false,
            lead = false,
            trail = false,
        },
        list_chars = {
            space = "·",
            tab = "→",
            nbsp = "␣",
            lead = "‹",
            trail = "›",
        },
        fileformat_chars = {
            unix = "",
            mac = "",
            dos = "",
        },
    },
}
