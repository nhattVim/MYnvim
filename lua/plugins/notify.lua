return {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    opts = {
        background_colour = "NotifyBackground",
        fps = 90,
        icons = {
            DEBUG = "",
            ERROR = "",
            INFO = "",
            TRACE = "✎",
            WARN = "",
        },
        level = 2,
        minimum_width = 50,
        render = "compact",
        stages = "fade_in_slide_out",
        timeout = 1000,
        top_down = true,
    },
}
