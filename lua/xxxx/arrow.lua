return {
    "otavioschwanck/arrow.nvim",
    keys = {
        { ";" },
        { "m" },
    },
    opts = {
        leader_key = ";",
        buffer_leader_key = "m",
        hide_handbook = false,
        show_icons = true,
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
        window = {
            border = "rounded",
        },
        per_buffer_config = {
            lines = 2,
            sort_automatically = true,
        },
    },
}
