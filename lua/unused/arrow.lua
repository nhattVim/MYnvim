return {
    "otavioschwanck/arrow.nvim",
    event = "BufReadPre",
    keys = {
        { "mj", "<cmd>Arrow next_buffer_bookmark<cr>", desc = "Next bookmark" },
        { "mk", "<cmd>Arrow prev_buffer_bookmark<cr>", desc = "Previous bookmark" },
        { "mm", "<cmd>Arrow toggle_current_line_for_buffer<cr>", desc = "Previous bookmark" },
    },
    opts = {
        leader_key = ";",
        buffer_leader_key = "ma",
        show_icons = true,
        always_show_path = false,
        mappings = {
            edit = "e",
            delete_mode = "d",
            clear_all_items = "c",
            toggle = "s",
            open_vertical = "v",
            open_horizontal = "h",
            quit = "q",
            remove = "x",
            next_item = "j",
            prev_item = "k",
        },
        window = { border = "rounded" },
        per_buffer_config = {
            lines = 3,
            sort_automatically = true,
        },
    },
}
