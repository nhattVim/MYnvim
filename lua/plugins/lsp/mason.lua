return {
    "mason-org/mason.nvim",
    event = "VeryLazy",
    dependencies = {
        "jay-babu/mason-nvim-dap.nvim",
        opts = {
            ensure_installed = {
                "javadbg",
                "bash",
            },
        },
    },
    opts = {
        ui = {
            border = "rounded",
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
            },
        },
    },
}
