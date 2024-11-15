return {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        opts = {
            override_by_filename = {
                [".gitignore"] = {
                    icon = "",
                    color = "#f1502f",
                    name = "Gitignore",
                },
                ["exe"] = {
                    icon = "",
                    color = "#7aa2f7",
                    name = "Exe",
                },
            },
        },
    },
    opts = {
        update_focused_file = {
            enable = true,
            update_cwd = true,
            update_root = false,
        },
        view = {
            width = 25,
            preserve_window_proportions = true,
            signcolumn = "no",
            float = {
                enable = false,
                quit_on_focus_loss = true,
                open_win_config = {
                    relative = "editor",
                    border = "rounded",
                    width = 30,
                    height = 30,
                    row = 2,
                    col = 1,
                },
            },
        },
        filesystem_watchers = {
            enable = true,
        },
        renderer = {
            root_folder_label = false,
            root_folder_modifier = ":t",
            indent_markers = {
                enable = false,
                inline_arrows = true,
                icons = {
                    corner = "└",
                    edge = "│",
                    item = "│",
                    bottom = "─",
                    none = " ",
                },
            },
            icons = {
                glyphs = {
                    folder = {
                        arrow_closed = "",
                        arrow_open = "",
                    },
                },
            },
        },
        actions = {
            open_file = {
                resize_window = true,
                window_picker = {
                    enable = false,
                },
            },
        },
        disable_netrw = true,
        hijack_netrw = true,
        hijack_cursor = true,
        auto_reload_on_write = true,
        hijack_unnamed_buffer_when_opening = false,
        sync_root_with_cwd = true,
    },
}
