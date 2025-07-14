return {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle",
    opts = {
        enabled = vim.g.autosave,
        debounce_delay = 500,
        trigger_events = {
            immediate_save = { "BufLeave", "FocusLost" },
            defer_save = { "InsertLeave", "TextChanged" },
            cancel_deferred_save = { "InsertEnter" },
        },
    },
}
