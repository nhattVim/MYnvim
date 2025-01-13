return {
    "nvzone/timerly",
    dependencies = "nvzone/volt",
    cmd = "TimerlyToggle",
    opts = {
        on_finish = function()
            vim.notify("Timerly: time's up!")
        end,
    },
}
