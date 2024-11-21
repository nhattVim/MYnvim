return {
    -- NOTE: A complete plugin for moving and duplicating blocks and lines
    "booperlv/nvim-gomove",
    keys = {
        -- Move line in normal mode
        { mode = "n", "<A-j>", "<Plug>GoNSMDown" },

        -- Duplicate line in normal mode
        { mode = "n", "<S-j>", "<Plug>GoNSDDown" },

        -- Move block in visual mode
        { mode = "x", "<A-h>", "<Plug>GoVSMLeft" },
        { mode = "x", "<A-l>", "<Plug>GoVSMRight" },
        { mode = "x", "<A-k>", "<Plug>GoVSMUp" },
        { mode = "x", "<A-j>", "<Plug>GoVSMDown" },

        -- Duplicate block in visual mode
        { mode = "x", "<S-h>", "<Plug>GoVSDLeft" },
        { mode = "x", "<S-l>", "<Plug>GoVSDRight" },
        { mode = "x", "<S-k>", "<Plug>GoVSDUp" },
        { mode = "x", "<S-j>", "<Plug>GoVSDDown" },
    },
    opts = {
        map_defaults = false,
        reindent = true,
        undojoin = true,
        move_past_end_col = true,
    },
}
