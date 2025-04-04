return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    build = vim.fn.has("win32") == 1 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
        or "make",
    dependencies = {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
            default = {
                embed_image_as_base64 = false,
                prompt_for_file_name = false,
                drag_and_drop = {
                    insert_mode = true,
                },
                use_absolute_path = true,
            },
        },
    },
    config = function()
        require("avante").setup({
            provider = "claude",
            claude = {
                api_key_name = "ANTHROPIC_API_KEY",
            },
            behaviour = {
                auto_suggestions = false,
                auto_set_highlight_group = true,
                auto_set_keymaps = true,
                auto_apply_diff_after_generation = false,
                support_paste_from_clipboard = true,
            },
            mappings = {
                diff = {
                    ours = "co",
                    theirs = "ct",
                    all_theirs = "ca",
                    both = "cb",
                    cursor = "cc",
                    next = "]]",
                    prev = "[[",
                },
                jump = {
                    next = "]]",
                    prev = "[[",
                },
                submit = {
                    normal = "<CR>",
                    insert = "<C-s>",
                },
            },
            hints = {
                enabled = true,
            },
            windows = {
                position = "right",
                wrap = true,
                width = 30,
                sidebar_header = {
                    align = "center",
                    rounded = true,
                },
            },
        })
    end,
}
