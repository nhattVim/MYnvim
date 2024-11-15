return {
    "nvchad/timerly",
    cmd = "TimerlyToggle",
    opts = {
        on_finish = function()
            vim.notify("Timerly: time's up!")
        end,
    },
}
